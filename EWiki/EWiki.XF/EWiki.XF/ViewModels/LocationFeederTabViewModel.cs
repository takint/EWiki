using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Service.Requests.Pokemon;
using Prism.Commands;
using Prism.Navigation;
using EWiki.XF.AppServices;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LocationFeederTabViewModel : BaseViewModel
    {
        private readonly INavigationService _navigationService;
        private readonly IPokemonService _pokemonService;
        private readonly ILocationFeederService _locationFeederService;

        private ObservableCollection<SniperInfo> _pokemons = new ObservableCollection<SniperInfo>();
        public ObservableCollection<SniperInfo> Pokemons => _pokemons;

        private int _totalPokemons;

        public LocationFeederTabViewModel(INavigationService navigationService, IPokemonService pokemonService, ILocationFeederService locationFeederService)
        {
            _pokemonService = pokemonService;
            _navigationService = navigationService;
            _locationFeederService = locationFeederService;

            // Subscribe to PokemonResultFetched message to update UI base on continuously fetched results
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
