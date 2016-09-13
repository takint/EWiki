using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Xamarin.Forms;
using EWiki.XF.Droid.LocationFeeder.Config;
using EWiki.XF.Droid.LocationFeeder.Repository;
using Android.Util;
using EWiki.XF.Droid.LocationFeeder.Helper;

namespace EWiki.XF.Droid.BackgroundServices
{
    [Service]
    public class LocationFeederBackgroundService : Service
    {
        List<CancellationTokenSource> _ctsList = new List<CancellationTokenSource>();

        public override IBinder OnBind(Intent intent)
        {
            return null;
        }

        public override StartCommandResult OnStartCommand(Intent intent, StartCommandFlags flags, int startId)
        {
            var settings = GlobalSettings.Load();
            var rarePokemonRepositories = RarePokemonRepositoryFactory.CreateRepositories(settings);

            List<Task> repoTasks = new List<Task>();
            repoTasks =
                    rarePokemonRepositories.Select(
                        rarePokemonRepository => StartPollRarePokemonRepository(settings, rarePokemonRepository))
                        .Cast<Task>()
                        .ToList();

            try
            {
                // Manage repo tasks
                for (var i = 0; i < repoTasks.Count; ++i)
                {
                    var t = repoTasks[i];
                    if (t.Status != TaskStatus.Running && t.Status != TaskStatus.WaitingToRun &&
                        t.Status != TaskStatus.WaitingForActivation)
                    {
                        // Replace broken tasks with a new one
                        repoTasks[i].Dispose();
                        repoTasks[i] = StartPollRarePokemonRepository(settings, rarePokemonRepositories[i]);
                    }
                }
            }
            catch (Exception e)
            {
                Log.Error($"Exception in thread manager: ", e.Message);
                throw;
            }

            return StartCommandResult.Sticky;
        }


        private async Task RareRepoThread(IRarePokemonRepository rarePokemonRepository)
        {
            var _cts = new CancellationTokenSource();
            _ctsList.Add(_cts);
            const int delay = 1000;
            try
            {
                while (!_cts.IsCancellationRequested)
                {
                    Thread.Sleep(delay);
                    for (var retrys = 0; retrys <= 1; retrys++)
                    {
                        var pokeSniperList = rarePokemonRepository.FindAll();
                        if (pokeSniperList != null)
                        {
                            if (pokeSniperList.Any())
                            {
                                WriteOutListeners(pokeSniperList);
                            }
                            break;
                        }
                        Thread.Sleep(1000);
                    }
                }
            }
            catch (Android.OS.OperationCanceledException)
            {
            }
            finally
            {
                if (_cts.IsCancellationRequested)
                {
                    var message = new CancelledMessage();
                    Device.BeginInvokeOnMainThread(
                        () => MessagingCenter.Send(message, "CancelledMessage")
                    );
                }
            }
        }

        private async void WriteOutListeners(List<SniperInfo> sniperInfos)
        {
            List<SniperInfo> sniperInfosToSend = sniperInfos;
            var message = new PokemonResultFetchedMessage
            {
                Pokemons = sniperInfosToSend.Select(s => new Models.SniperInfo {
                    Id = s.Id,
                    Name = s.Id.ToString(),
                    ChannelName = s.ChannelInfo.channel,
                    EncounterId = s.EncounterId,
                    ExpirationTimestamp = s.ExpirationTimestamp,
                    IV = s.IV,
                    Latitude = s.Latitude,
                    Longitude = s.Longitude,
                    Move1 = s.Move1,
                    Move2 = s.Move2,
                    NeedVerification = s.NeedVerification,
                    ReceivedTimeStamp = s.ReceivedTimeStamp,
                    SpawnPointId = s.SpawnPointId,
                    Verified = s.Verified,
                    VerifiedOn = s.VerifiedOn
                }).ToList()
            };
            Device.BeginInvokeOnMainThread(
                () => MessagingCenter.Send(message, "PokemonResultFetched")
            );
        }

        private async Task<Task> StartPollRarePokemonRepository(GlobalSettings globalSettings, IRarePokemonRepository rarePokemonRepository)
        {
            return await Task.Factory.StartNew(async () => await RareRepoThread(rarePokemonRepository), TaskCreationOptions.LongRunning);
        }

        public override void OnDestroy()
        {
            foreach(var _cts in _ctsList)
            {
                if (_cts != null)
                {
                    _cts.Token.ThrowIfCancellationRequested();
                    _cts.Cancel();
                }
            }

            base.OnDestroy();
        }
    }
}