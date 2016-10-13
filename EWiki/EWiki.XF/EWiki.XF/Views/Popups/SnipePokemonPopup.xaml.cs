using System;
using System.Threading;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Services;
using EWiki.XF.Utilities;
using EWiki.XF.ViewModels;
using Newtonsoft.Json;
using Rg.Plugins.Popup.Pages;
using Xamarin.Forms;

namespace EWiki.XF.Views.Popups
{
    public partial class SnipePokemonPopup : PopupPage
    {
        private CancellationTokenSource _cts;
        public SnipePokemonPopup()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            var context = BindingContext as SnipePokemonPopupViewModel;
            if(context == null) return;

            await context.Snipe();
            var runningCts = new CancellationTokenSource();
            try
            {
                await Task.Run(async () =>
                 {
                     while (!runningCts.IsCancellationRequested && context.IsBusy)
                     {
                         await PokeBall.RotateTo(360, 500U);
                         PokeBall.Rotation = 0;
                     }
                 }, runningCts.Token);
            }
            catch (Exception)
            {
                runningCts.Cancel();
            }
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
