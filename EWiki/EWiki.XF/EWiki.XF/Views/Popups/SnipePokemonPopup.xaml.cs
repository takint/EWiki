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

        protected override void OnAppearing()
        {
            base.OnAppearing();

            var context = BindingContext as SnipePokemonPopupViewModel;
            if (context == null) return;

            _cts = new CancellationTokenSource();
            var runningCts = new CancellationTokenSource();
            try
            {
                Task.Run(async () =>
                {
                    context.Messages.Add(new Message()
                    {
                        Content = $"Requested catch {context.PokemonId} at {context.Latitude}, {context.Longitude}. Waiting response...",
                        ColorName = "White"
                    });

                    var pokemonAccount = LocalDataStorage.GetActivePokemonAccount();
                    var service = DependencyService.Get<ISniperService>();
                    await service.Snipe(context.PokemonId, context.Latitude, context.Longitude, pokemonAccount);

                    MessagingCenter.Subscribe<SniperMessage>(this, "Sniper", message =>
                    {
                        switch (message.Message)
                        {
                            case "Opened":
                                context.Messages.Insert(0, new Message()
                                {
                                    Content = "Accepted. Awaiting for login and catching...",
                                    ColorName = "Magenta"
                                });
                                break;
                            case "End":
                                runningCts.Cancel();
                                break;
                            default:
                                if (!string.IsNullOrEmpty(message.Message))
                                {
                                    try
                                    {
                                        var deserializedMessage = JsonConvert.DeserializeObject<Message>(message.Message);
                                        context.Messages.Insert(0, deserializedMessage);

                                        if (deserializedMessage.ColorName.Contains("Green") ||
                                            deserializedMessage.ColorName.Contains("Red") ||
                                            deserializedMessage.ColorName.Contains("Yellow"))
                                        {
                                            runningCts.Cancel();
                                        }
                                    }
                                    catch (Exception)
                                    {
                                        context.Messages.Insert(0, new Message()
                                        {
                                            Content = message.Message
                                        });
                                        // ignored
                                    }
                                }
                                break;
                        }
                    });

                    
                }, _cts.Token);

                Task.Run(async () =>
                {
                    while (!runningCts.IsCancellationRequested)
                    {
                        await PokeBall.RotateTo(360, 500U);
                        PokeBall.Rotation = 0;
                    }
                }, runningCts.Token);
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
