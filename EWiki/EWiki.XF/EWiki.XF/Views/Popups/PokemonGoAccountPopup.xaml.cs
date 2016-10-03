using System;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Services;
using EWiki.XF.ViewModels;
using Newtonsoft.Json;
using Plugin.Geolocator;
using Rg.Plugins.Popup.Pages;
using Xamarin.Forms;

namespace EWiki.XF.Views.Popups
{
    public partial class PokemonGoAccountPopup : PopupPage
    {
        public PokemonGoAccountPopup()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            try
            {
                var locator = CrossGeolocator.Current;
                locator.DesiredAccuracy = 50;

                var position = await locator.GetPositionAsync(10000);
                var pokemonGoAccountPopupViewModel = BindingContext as PokemonGoAccountPopupViewModel;
                if (pokemonGoAccountPopupViewModel != null)
                {
                    pokemonGoAccountPopupViewModel.Account.Latitude = position.Latitude;
                    pokemonGoAccountPopupViewModel.Account.Longitude = position.Longitude;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Unable to get location, may need to increase timeout: " + ex);
            }
            base.OnAppearing();
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
        }

        protected override bool OnBackButtonPressed()
        {
            return base.OnBackButtonPressed();
        }
    }
}
