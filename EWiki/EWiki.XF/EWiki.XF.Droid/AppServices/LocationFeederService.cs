using System;
using EWiki.XF.AppServices;
using EWiki.XF.Droid.AppServices;
using Xamarin.Forms;
using EWiki.XF.Droid.LocationFeeder.Repository;
using EWiki.XF.Droid.LocationFeeder.Config;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Threading;
using Android.Util;
using System.Linq;
using EWiki.XF.Droid.LocationFeeder.Helper;

[assembly: Dependency(typeof(LocationFeederService))]
namespace EWiki.XF.Droid.AppServices
{
    public class LocationFeederService : ILocationFeederService
    {
        public void Start()
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
        }


        private async Task RareRepoThread(IRarePokemonRepository rarePokemonRepository)
        {
            const int delay = 30 * 1000;
            while (true)
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

        private async void WriteOutListeners(List<SniperInfo> sniperInfos)
        {
            List<SniperInfo> sniperInfosToSend = sniperInfos;

        }

        private async Task<Task> StartPollRarePokemonRepository(GlobalSettings globalSettings, IRarePokemonRepository rarePokemonRepository)
        {
            return await Task.Factory.StartNew(async () => await RareRepoThread(rarePokemonRepository), TaskCreationOptions.LongRunning);
        }
    }
}