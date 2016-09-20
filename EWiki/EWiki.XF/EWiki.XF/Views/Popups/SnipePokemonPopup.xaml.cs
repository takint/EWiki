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
    public partial class SnipePokemonPopup : PopupPage
    {
        private CancellationTokenSource _cts;
        public SnipePokemonPopup()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            var context = BindingContext as SnipePokemonPopupViewModel;
            if (context == null) return;

            _cts = new CancellationTokenSource();
            try
            {
                Task.Run(async () =>
                {

                    context.Messages.Add(new Message()
                    {
                        Content = $"Requested catch {context.PokemonId} at {context.Latitude}, {context.Longitude}",
                        ColorName = "White"
                    });

                    var service = DependencyService.Get<ISniperService>();
                    await service.Snipe(context.PokemonId, context.Latitude, context.Longitude);

                    MessagingCenter.Subscribe<SniperMessage>(this, "Sniper", message =>
                    {
                        if (!string.IsNullOrEmpty(message.Message))
                        {
                            var deserializedMessage = JsonConvert.DeserializeObject<Message>(message.Message);
                            context.Messages.Insert(0, deserializedMessage);
                        }
                    });
                }, _cts.Token);
                //Device.OpenUri(new Uri($"pokesniper2://{Name}/{Latitude},{Longitude}"));
            }
            catch (Exception exception)
            {
                // ignored
                _cts.Cancel();
            }
        }

        protected override void OnDisappearing()
        {
            _cts.Cancel();
            base.OnDisappearing();
        }

        protected override bool OnBackButtonPressed()
        {
            return base.OnBackButtonPressed();
        }
    }
}
