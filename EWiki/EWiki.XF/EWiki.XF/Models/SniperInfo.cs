﻿using System;
using System.Linq;
using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Models.Enum;
using EWiki.XF.Resources;
using EWiki.XF.Service;
using EWiki.XF.Services;
using EWiki.XF.Utilities;
using EWiki.XF.ViewModels;
using EWiki.XF.Views.Popups;
using Plugin.Share;
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
        public PokemonId PokemonId { get; set; }
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
        public bool IsRarePokemon => System.Enum.IsDefined(typeof(RarePokemon), (int)PokemonId);

        public DelegateCommand SnipCommand { get; set; }
        public DelegateCommand OpenMapCommand { get; set; }
        public DelegateCommand CopyLongitudeCommand { get; set; }
        public DelegateCommand CopyLatitudeCommand { get; set; }

        public SniperInfo()
        {
            CreatedDate = DateTime.Now;
            SnipCommand = DelegateCommand.FromAsyncHandler(ExecuteSnipCommand);
            OpenMapCommand = new DelegateCommand(ExecuteOpenMapCommand);
            CopyLongitudeCommand = new DelegateCommand(ExecuteCopyLongitudeCommand);
            CopyLatitudeCommand = new DelegateCommand(ExecuteCopyLatitudeCommand);
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
                if (pokemonAccounts == null || pokemonAccounts.Count == 0)
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
                else
                {

                    var pokemonGoAccount = LocalDataStorage.GetActivePokemonAccount();
                    if (pokemonGoAccount == null || string.IsNullOrEmpty(pokemonGoAccount.Username) || string.IsNullOrEmpty(pokemonGoAccount.Password))
                    {
                        await UserDialogs.Instance.AlertAsync("Your selected Pokemon Account missing some info. Please update...");
                        if (pokemonGoAccount != null)
                        {
                            var pokemonGoAccountPopup = new PokemonGoAccountPopup
                            {
                                BindingContext = new PokemonGoAccountPopupViewModel
                                {
                                    Account = new PokemonAccount
                                    {
                                        Id = pokemonGoAccount.Id,
                                        Username = pokemonGoAccount.Username,
                                        Password = pokemonGoAccount.Password,
                                        Latitude = pokemonGoAccount.Latitude,
                                        Longitude = pokemonGoAccount.Longitude,
                                        Avatar = pokemonGoAccount.Avatar
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

                    if (CheckUserCanCapturePokemon(authData.Username))
                    {
                        var snipePokemonPopup = new SnipePokemonPopup()
                        {
                            BindingContext = new SnipePokemonPopupViewModel()
                            {
                                PokemonId = PokemonId,
                                Latitude = Latitude,
                                Longitude = Longitude
                            }
                        };
                        await PopupNavigation.PushAsync(snipePokemonPopup);
                    }
                    else
                    {
                        await UserDialogs.Instance.AlertAsync(Resource.MaximumRarePokemonsCaptured);
                        await UserDialogs.Instance.AlertAsync(Resource.MaximumNormalPokemonsCaptured);
                    }
                }
            }
        }

        private bool CheckUserCanCapturePokemon(string userName)
        {
            var tracking = LocalDataStorage.GetPokemonCaptureTracking(userName);

            if (tracking == null || tracking.Date.Date != DateTime.Now.Date)
            {
                tracking = new UserPokemonCaptureTracking
                {
                    Date = DateTime.Now,
                    RareCount = 0,
                    NormalCount = 0
                };
            }

            if (IsRarePokemon && tracking.Date.Date == DateTime.Now.Date && tracking.RareCount >= 5)
                return false;

            if (!IsRarePokemon && tracking.Date.Date == DateTime.Now.Date && tracking.NormalCount >= 20)
                return false;

            if (IsRarePokemon)
            {
                tracking.RareCount++;
            }
            else
            {
                tracking.NormalCount++;
            }

            LocalDataStorage.SavePokemonCaptureTracking(userName, tracking);

            return true;
        }

        public void ExecuteOpenMapCommand()
        {
            Device.OpenUri(new Uri($"http://maps.google.com/maps?q=loc:{Latitude},{Longitude}"));
        }

        public void ExecuteCopyLongitudeCommand()
        {
            CrossShare.Current.SetClipboardText($"{Longitude}");
            UserDialogs.Instance.Toast(Resource.CopyLongitudeToClipboard);
        }

        public void ExecuteCopyLatitudeCommand()
        {
            CrossShare.Current.SetClipboardText($"{Latitude}");
            UserDialogs.Instance.Toast(Resource.CopyLatitudeToClipboard);
        }
    }
}
