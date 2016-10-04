using System.Linq;
using System.Reactive.Disposables;
using EWiki.XF.Models;
using EWiki.XF.ViewModels;
using EWiki.XF.Views.Rerenders;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class PokedexTab : ContentPage
    {
        public PokedexTab()
        {
            InitializeComponent();
            PokedexListView.ItemAppearing += (sender, args) =>
            {
                if (ActivityIndicator.IsVisible)
                {
                    ActivityIndicator.IsRunning = false;
                    ActivityIndicator.IsVisible = false;
                    Message.IsVisible = false;
                }
            };
        }

        private void PokedexList_OnItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (PokedexListView.SelectedItem == null) return;
            var context = BindingContext as PokedexTabViewModel;
            var selectedItem = PokedexListView.SelectedItem as Pokemon;
            context?.PokedexItemSelectedHandler(selectedItem);
            PokedexListView.SelectedItem = null;
        }

        protected override async void OnAppearing()
        {
            var context = BindingContext as PokedexTabViewModel;
            if (context != null && !context.Pokemons.Any()) await context.LoadPokemons(0);
            base.OnAppearing();
        }
    }
}
