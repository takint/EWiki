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

namespace EWiki.XF.ViewModels
{
    public class LocationFeederTabViewModel : BaseViewModel
    {
        private readonly INavigationService _navigationService;
        private readonly IPokemonService _pokemonService;
        private readonly ILocationFeederService _locationFeederService;

        private ObservableCollection<Pokemon> _pokemons = new ObservableCollection<Pokemon>();
        public ObservableCollection<Pokemon> Pokemons => _pokemons;

        private int _totalPokemons;

        public DelegateCommand RefreshCommand { get; set; }
        public DelegateCommand<Pokemon> LoadMoreCommand { get; set; }

        public LocationFeederTabViewModel(INavigationService navigationService, IPokemonService pokemonService, ILocationFeederService locationFeederService)
        {
            _pokemonService = pokemonService;
            _navigationService = navigationService;
            _locationFeederService = locationFeederService;
            RefreshCommand = DelegateCommand.FromAsyncHandler(ExecuteRefreshCommand, CanExecuteRefreshCommand);
            LoadMoreCommand = DelegateCommand<Pokemon>.FromAsyncHandler(ExecuteLoadMoreCommand, CanExecuteLoadMoreCommand);
        }

        public bool CanExecuteRefreshCommand()
        {
            return IsNotBusy;
        }

        public async Task ExecuteRefreshCommand()
        {
            IsBusy = true;

            _pokemons = new ObservableCollection<Pokemon>();
            await LoadPokemons(0);

            IsBusy = false;
        }

        public bool CanExecuteLoadMoreCommand(Pokemon item)
        {
            return IsNotBusy && _pokemons.Count > _totalPokemons;
        }

        public async Task ExecuteLoadMoreCommand(Pokemon item)
        {
            IsBusy = true;

            var skip = _pokemons.Count;
            await LoadPokemons(skip);

            IsBusy = false;
        }

        public async Task LoadPokemons(int skip)
        {
            _locationFeederService.Start();
        }

        public void PokedexItemSelectedHandler(Pokemon pokemon)
        {
            _navigationService.NavigateAsync($"LeftMenu/Navigation/PokemonInfoPage?PokemonId={pokemon.Id}", animated: false);
        }
    }
}
