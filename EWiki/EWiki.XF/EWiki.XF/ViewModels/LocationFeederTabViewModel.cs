using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Models.Enum;
using EWiki.XF.Service;
using EWiki.XF.Services;
using Microsoft.AspNet.SignalR.Client;
using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LocationFeederTabViewModel : BaseViewModel
    {
        private ObservableCollection<SniperInfo> _pokemons = new ObservableCollection<SniperInfo>();
        public ObservableCollection<SniperInfo> Pokemons => _pokemons;

        private string _message;

        public string Message
        {
            get { return _message; }
            set { SetProperty(ref _message, value); }
        }

        CancellationTokenSource _cts;

        public LocationFeederTabViewModel()
        {
            MessagingCenter.Subscribe<PokemonResultFetchedMessage>(this, "PokemonResultFetched", message =>
            {
                foreach (var pokemon in message.Pokemons)
                {
                    try
                    {
                        _pokemons.Insert(0, pokemon);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                };
            });

            _cts = new CancellationTokenSource();
            Cleanup();
        }

        public async void Cleanup()
        {
            await Task.Run(async () =>
            {
                while (!_cts.IsCancellationRequested)
                {
                    try
                    {
                        foreach (var poke in Pokemons)
                        {
                            var ukn = "";
                            var expiration = poke.ExpirationTimestamp;
                            if (expiration.Equals(default(DateTime)))
                            {
                                expiration = poke.CreatedDate.AddSeconds(200);
                                ukn = "unk. ";
                            }
                            var remaining = expiration - DateTime.Now;

                            if (remaining < TimeSpan.Zero)
                            {
                                _pokemons.Remove(poke);
                            }
                            poke.ExpirationSeconds = $"{ukn}{(int)remaining.TotalSeconds}s";
                        }
                        await Task.Delay(1000);
                    }
                    catch (Exception)
                    {
                        await Task.Delay(1000);
                    }
                }
            }, _cts.Token);
        }
    }
}
