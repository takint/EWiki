using System;
using System.Threading;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Services;
using EWiki.XF.ViewModels;
using Newtonsoft.Json;
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

        protected override void OnAppearing()
        {
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
