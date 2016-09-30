using System;
using System.Collections.ObjectModel;
using System.Linq;
using EWiki.XF.Models;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Models.Enum;
using Prism.Commands;
using Prism.Navigation;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class PokemonSelectorPopupViewModel : BaseViewModel
    {
        public ObservableCollection<PokemonSM> Pokemons { get; } = new ObservableCollection<PokemonSM>();

        private PokemonSM _selectedPokemon;

        public PokemonSM SelectedPokemon
        {
            get { return _selectedPokemon; }
            set { SetProperty(ref _selectedPokemon, value); }
        }

        public DelegateCommand PokemonTappedCommand { get; set; }

        public PokemonSelectorPopupViewModel()
        {
            PokemonTappedCommand = new DelegateCommand(ExecutePokemonTappedCommand);

            foreach (PokemonId pokemonId in Enum.GetValues(typeof(PokemonId)))
            {
                if (pokemonId == PokemonId.Missingno)
                {
                    continue;
                }
                Pokemons.Add(new PokemonSM()
                {
                    PokemonId = pokemonId
                });
            }
        }

        private async void ExecutePokemonTappedCommand()
        {
            MessagingCenter.Send(this, "SelectedPokemonMessage", SelectedPokemon);
            await PopupNavigation.PopAsync();
        }

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);
        }
    }
}
