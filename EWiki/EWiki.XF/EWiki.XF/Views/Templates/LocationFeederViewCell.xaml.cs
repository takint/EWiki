using EWiki.XF.Models;
using System;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Input;
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
            if (context != null) {
                await Task.Run(async () =>
                {
                    try
                    {
                        while ((int)(context.ExpirationTimestamp - DateTime.Now).TotalSeconds > 0 && !_cts.IsCancellationRequested)
                        {
                            await Task.Delay(1000);
                            context.ExpirationSeconds = (int)(context.ExpirationTimestamp - DateTime.Now).TotalSeconds;
                        }
                    }
                    catch (OperationCanceledException)
                    {

                    }
                }, _cts.Token);
            };
            base.OnAppearing();
        }

        protected override void OnDisappearing()
        {
            if (_cts != null)
            {
                _cts.Cancel();
            }
            base.OnDisappearing();
        }
    }
}
