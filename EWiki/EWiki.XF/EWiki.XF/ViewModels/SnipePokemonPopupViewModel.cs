using System;
using System.Collections.ObjectModel;
using System.Threading;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Models.Enum;
using EWiki.XF.Service;
using EWiki.XF.Services;
using EWiki.XF.Utilities;
using Microsoft.AspNet.SignalR.Client;
using Newtonsoft.Json;
using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class SnipePokemonPopupViewModel : BaseViewModel
    {
        private CancellationTokenSource _cts;

        private readonly HubConnection _connection;
        private readonly IHubProxy _proxy;

        public ObservableCollection<Message> Messages { get; } = new ObservableCollection<Message>();

        private PokemonId _pokemonId;

        public PokemonId PokemonId
        {
            get { return _pokemonId; }
            set { SetProperty(ref _pokemonId, value); }
        }

        private double _latitude;

        public double Latitude
        {
            get { return _latitude; }
            set { SetProperty(ref _latitude, value); }
        }

        private double _longitude;

        public double Longitude
        {
            get { return _longitude; }
            set { SetProperty(ref _longitude, value); }
        }

        public string LatLong => $"{Latitude}, {Longitude}";

        public string Name => PokemonId.ToString();

        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)PokemonId).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)PokemonId}";
            }
        }

        public string Avatar
            => $"http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/{Number}{Name}.png";

        public SnipePokemonPopupViewModel()
        {
            _connection = new HubConnection("http://192.168.1.12:2702/");
            _proxy = _connection.CreateHubProxy("SniperHub");

            _proxy.On("GetMessage", (string message) =>
            {
                if (!string.IsNullOrEmpty(message))
                {
                    try
                    {
                        var deserializedMessage = JsonConvert.DeserializeObject<Message>(message);
                        Messages.Insert(0, deserializedMessage);

                        if (deserializedMessage.LogLevel == LogLevel.Failed ||
                            deserializedMessage.LogLevel == LogLevel.Error ||
                            deserializedMessage.LogLevel == LogLevel.Success)
                        {
                            IsBusy = false;
                        }
                    }
                    catch (Exception)
                    {
                        Messages.Insert(0, new Message()
                        {
                            Content = message
                        });
                    }
                }
            });

        }

        public async Task Snipe()
        {
            _cts = new CancellationTokenSource();
            try
            {
                await Task.Run(async () =>
                {
                    while (_connection.State == ConnectionState.Disconnected)
                    {
                        await _connection.Start();
                        await Task.Delay(5000);
                    }

                    var pokemonAccount = LocalDataStorage.GetActivePokemonAccount();
                    await _proxy.Invoke("SniperMessage", JsonConvert.SerializeObject(new
                    {
                        Action = "Snipe",
                        PokemonId = PokemonId,
                        Latitude = Latitude,
                        Longitude = Longitude,
                        UserName = pokemonAccount.Username,
                        Password = pokemonAccount.Password,
                        DefaultLatitude = pokemonAccount.Latitude,
                        DefaultLongitude = pokemonAccount.Longitude
                    }));
                }, _cts.Token);
            }
            catch (HubException)
            {
                await _connection.Start();
                await Task.Delay(5000);
            }
            catch (Exception)
            {
                IsBusy = false;
                _cts.Cancel();
            }
        }
    }
}
