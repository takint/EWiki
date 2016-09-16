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
                    var expirationSeconds = (int)(context.ExpirationTimestamp - DateTime.Now).TotalSeconds;
                    if (expirationSeconds <= 0)
                    {
                        parentContext?.Pokemons.Remove(context);
                        return;
                    }
                    await Task.Run(async () =>
                    {
                        while (expirationSeconds > 0 &&
                               !_cts.IsCancellationRequested)
                        {

                            context.ExpirationSeconds = context.TrueExpirationTimestamp ? $"{expirationSeconds}s" : $"? {expirationSeconds}s";
                            
                            await Task.Delay(1000);
                            expirationSeconds--;
                            if (expirationSeconds <= 0)
                            {
                                parentContext?.Pokemons.Remove(context);
                                return;
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
