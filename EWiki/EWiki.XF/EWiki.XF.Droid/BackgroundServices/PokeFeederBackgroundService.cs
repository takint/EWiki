using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Util;
using EWiki.XF.Droid.LocationFeeder.Helper;
using EWiki.XF.Droid.LocationFeeder.Repository;
using Newtonsoft.Json;
using Xamarin.Forms;
using Microsoft.AspNet.SignalR.Client;

namespace EWiki.XF.Droid.BackgroundServices
{
    [Service]
    public class PokeFeederBackgroundService : Service
    {
        private CancellationTokenSource _cts;
        private readonly SniperInfoRepository _serverRepository;
        private readonly SniperInfoRepositoryManager _sniperInfoRepositoryManager;

        private readonly HubConnection _connection;
        private readonly IHubProxy _proxy;

        public PokeFeederBackgroundService()
        {
            _serverRepository = new SniperInfoRepository();
            _sniperInfoRepositoryManager = new SniperInfoRepositoryManager(_serverRepository);

            _connection = new HubConnection("http://signalr.pokit.mobi/");
            _proxy = _connection.CreateHubProxy("SniperHub");

            _proxy.On("GetSniperInfos", (string message) =>
            {
                if (!string.IsNullOrEmpty(message))
                {
                    try
                    {
                        var sniperInfos = JsonConvert.DeserializeObject<List<SniperInfo>>(message);

                        WriteOutListeners(sniperInfos);
                    }
                    catch (Exception)
                    {
                        // Suppress?
                    }
                }
            });
        }

        public override IBinder OnBind(Intent intent)
        {
            return null;
        }

        public override StartCommandResult OnStartCommand(Intent intent, StartCommandFlags flags, int startId)
        {
            _cts = new CancellationTokenSource();

            Task.Run(async () =>
            {
                try
                {
                    while (!_cts.IsCancellationRequested)
                    {
                        await _proxy.Invoke("FetchSniperInfos");

                        Log.Info("", "Reconnecting to stream in 10 seconds");
                        Thread.Sleep(10000);
                    }
                }
                catch (Android.OS.OperationCanceledException)
                {
                    // Suppress?
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
            }, _cts.Token);

            return StartCommandResult.Sticky;
        }

        private void WriteOutListeners(List<SniperInfo> sniperInfos)
        {
            List<SniperInfo> sniperInfosToSend = sniperInfos;
            sniperInfosToSend = sniperInfosToSend.OrderBy(m => m.ExpirationTimestamp).ToList();
            foreach (SniperInfo sniperInfo in sniperInfosToSend)
            {
                _sniperInfoRepositoryManager.AddToRepository(sniperInfo);
            }
        }
    }
}