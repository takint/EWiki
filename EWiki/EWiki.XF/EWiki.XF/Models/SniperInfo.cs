using System;
using System.Linq;
using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Models.Enum;
using EWiki.XF.Services;
using EWiki.XF.Utilities;
using EWiki.XF.ViewModels;
using EWiki.XF.Views.Popups;
using Prism.Commands;
using Prism.Mvvm;
using Prism.Navigation;
using Rg.Plugins.Popup.Services;
using WebSocket4Net;
using Xamarin.Forms;

namespace EWiki.XF.Models
{
    public class SniperInfo : BindableBase
    {
        public string Name { get; set; }
        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)Id).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)Id}";
            }
        }
        public string Avatar => $"http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/{Number}{Name}.png";
        public ulong EncounterId { get; set; }
        public DateTime ExpirationTimestamp { get; set; }

        private bool _trueExpirationTimestamp;

        public bool TrueExpirationTimestamp
        {
            get { return _trueExpirationTimestamp; }
            set { SetProperty(ref _trueExpirationTimestamp, value); }
        }

        private string _expirationSeconds;
        public string ExpirationSeconds
        {
            get { return _expirationSeconds; }
            set { SetProperty(ref _expirationSeconds, value); }
        }


        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public PokemonId Id { get; set; }
        public string SpawnPointId { get; set; } = null;

        private PokemonMove _move1;

        public PokemonMove Move1
        {
            get { return _move1; }
            set { SetProperty(ref _move1, value); }
        }

        private PokemonMove _move2;

        public PokemonMove Move2
        {
            get { return _move2; }
            set { SetProperty(ref _move2, value); }
        }

        private double _IV;

        public double IV
        {
            get { return _IV; }
            set { SetProperty(ref _IV, value); }
        }

        private bool _verified;

        public bool Verified
        {
            get { return _verified; }
            set { SetProperty(ref _verified, value); }
        }

        public DateTime VerifiedOn { get; set; } 
        public string ChannelName { get; set; }
        public DateTime ReceivedTimeStamp { get; set; }
        public bool NeedVerification { get; set; } = false;
        public DateTime CreatedDate { get; set; }


        public DelegateCommand SnipCommand { get; set; }
        public DelegateCommand OpenMapCommand { get; set; }

        public SniperInfo()
        {
            CreatedDate = DateTime.Now;
            SnipCommand = DelegateCommand.FromAsyncHandler(ExecuteSnipCommand);
            OpenMapCommand = new DelegateCommand(ExecuteOpenMapCommand);
        }

        public async Task ExecuteSnipCommand()
        {
            var authData = LocalDataStorage.GetAuthData();
            if (authData == null)
            {
                var loginPage = new LoginPage
                {
                    BindingContext = new LoginPageViewModel()
                };

                await PopupNavigation.PushAsync(loginPage);
            }
            else
            {
                var pokemonAccounts = LocalDataStorage.GetPokemonAccounts(authData.Username);
                if (pokemonAccounts == null || pokemonAccounts.Count == 0)                {
                    var pokemonGoAccountPopup = new PokemonGoAccountPopup
                    {
                        BindingContext = new PokemonGoAccountPopupViewModel
                        {
                            Account = new PokemonAccount { Id = Guid.NewGuid(), Avatar = "no_avatar" },
                            IsEdit = false
                        }
                    };

                    await PopupNavigation.PushAsync(pokemonGoAccountPopup);
                }
                else
                {

                    var pokemonGoAccount = App.PokemonGoAccount;
                    if (pokemonGoAccount == null || pokemonGoAccount.Split(':').Length < 4 || string.IsNullOrEmpty(pokemonGoAccount.Split(':')[0]) || string.IsNullOrEmpty(pokemonGoAccount.Split(':')[1]))
                    {
                        await UserDialogs.Instance.AlertAsync("Your selected Pokemon Account missing some info. Please update...");
                        var selectedAccount = pokemonAccounts.FirstOrDefault(p => p.Username == pokemonGoAccount?.Split(':')[0]);
                        if (selectedAccount != null)
                        {
                            var pokemonGoAccountPopup = new PokemonGoAccountPopup
                            {
                                BindingContext = new PokemonGoAccountPopupViewModel
                                {
                                    Account = new PokemonAccount
                                    {
                                        Id = selectedAccount.Id,
                                        Username = selectedAccount.Username,
                                        Password = selectedAccount.Password,
                                        Latitude = selectedAccount.Latitude,
                                        Longitude = selectedAccount.Longitude,
                                        Avatar = selectedAccount.Avatar
                                    },
                                    IsEdit = true
                                }
                            };

                            await PopupNavigation.PushAsync(pokemonGoAccountPopup);
                        }
                        else
                        {
                            var pokemonGoAccountPopup = new PokemonGoAccountPopup
                            {
                                BindingContext = new PokemonGoAccountPopupViewModel
                                {
                                    Account = new PokemonAccount { Id = Guid.NewGuid(), Avatar = "no_avatar" },
                                    IsEdit = false
                                }
                            };

                            await PopupNavigation.PushAsync(pokemonGoAccountPopup);
                        }
                    }

                    var snipePokemonPopup = new SnipePokemonPopup()
                    {
                        BindingContext = new SnipePokemonPopupViewModel()
                        {
                            PokemonId = Id,
                            Latitude = Latitude,
                            Longitude = Longitude
                        }
                    };
                    await PopupNavigation.PushAsync(snipePokemonPopup);
                }
            }
        }

        public void ExecuteOpenMapCommand()
        {
            Device.OpenUri(new Uri($"http://maps.google.com/maps?q=loc:{Latitude},{Longitude}"));
        }
    }
}
