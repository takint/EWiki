using EWiki.XF.Models;
using System;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Input;
using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views.Templates
{
    public partial class LocationFeederViewCell : ViewCell
    {
        CancellationTokenSource _cts;

        public LocationFeederViewCell()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            _cts = new CancellationTokenSource();
            var context = BindingContext as SniperInfo;
            if (context != null)
            {
                var parentContext = Parent.BindingContext as LocationFeederTabViewModel;
                try
                {
                    await Task.Run(async () =>
                    {
                        while ((int)(context.ExpirationTimestamp - DateTime.Now).TotalSeconds > 0 &&
                               !_cts.IsCancellationRequested)
                        {
                            await Task.Delay(1000);
                            context.ExpirationSeconds = (int)(context.ExpirationTimestamp - DateTime.Now).TotalSeconds;
                            if (context.ExpirationSeconds <= 0)
                            {
                                parentContext?.Pokemons.Remove(context);
                            }
                        }
                    }, _cts.Token);
                }
                catch (Exception exception)
                {
                    _cts.Cancel();
                }
            };
            base.OnAppearing();
        }

        protected override void OnDisappearing()
        {
            _cts?.Cancel();
            base.OnDisappearing();
        }
    }
}
