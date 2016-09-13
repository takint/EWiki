using System;
using System.Collections.ObjectModel;
using System.Linq;
using EWiki.XF.Models;
using EWiki.XF.Service;
using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LocationFeederTabViewModel : BaseViewModel
    {
        private ObservableCollection<SniperInfo> _pokemons = new ObservableCollection<SniperInfo>();
        public ObservableCollection<SniperInfo> Pokemons => _pokemons;

        public LocationFeederTabViewModel()
        {
            MessagingCenter.Subscribe<PokemonResultFetchedMessage>(this, "PokemonResultFetched", message =>
            {
                foreach (var pokemon in message.Pokemons.Where(p => p.ExpirationTimestamp > DateTime.Now).OrderByDescending(p => p.ReceivedTimeStamp))
                {
                    if (!_pokemons.Any(p => p.Latitude == pokemon.Latitude && p.Longitude == pokemon.Longitude && p.Id == pokemon.Id))
                    {
                        _pokemons.Insert(0, pokemon);
                    }
                };
            });
        }
    }
}
