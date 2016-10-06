using System.Linq;
using Acr.UserDialogs;
using EWiki.XF.Resources;
using EWiki.XF.ViewModels;
using Rg.Plugins.Popup.Pages;

namespace EWiki.XF.Views
{
    public partial class PokemonInfoPage : PopupPage
    {
        public PokemonInfoPage()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            UserDialogs.Instance.HideLoading();
            base.OnAppearing();
        }

        protected override void OnBindingContextChanged()
        {
            var pokemonInfoPageViewModel = BindingContext as PokemonInfoPageViewModel;
            if (pokemonInfoPageViewModel != null && pokemonInfoPageViewModel.Pokemons.Any())
            {
                UserDialogs.Instance.Loading(Resource.Loading);
            }
            base.OnBindingContextChanged();
        }
    }
}
