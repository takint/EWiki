using EWiki.XF.Models;
using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class PokedexTab : ContentPage
    {
        public PokedexTab()
        {
            InitializeComponent();
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
            if (context != null) await context.LoadPokemons(0);
            base.OnAppearing();
        }
    }
}
