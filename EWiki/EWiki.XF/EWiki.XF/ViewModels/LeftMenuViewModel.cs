using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.Settings;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Resources;
using EWiki.XF.Service;
using EWiki.XF.Service.Models;
using EWiki.XF.Utilities;
using EWiki.XF.Views;
using EWiki.XF.Views.Popups;
using Prism.Commands;
using Prism.Navigation;
using Prism.Services;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LeftMenuViewModel : BaseViewModel
    {
        private readonly INavigationService _navigationService;
        private readonly IPageDialogService _pageDialogService;
        private readonly IAccountService _accountService;

        private string _username;
        public string Username
        {
            get { return _username; }
            set { SetProperty(ref _username, value); }
        }

        private string _email;
        public string Email
        {
            get { return _email; }
            set { SetProperty(ref _email, value); }
        }

        private bool _isLoggedIn;
        public bool IsLoggedIn
        {
            get { return _isLoggedIn; }
            set
            {
                SetProperty(ref _isLoggedIn, value);

                if (value)
                {
                    var authData = LocalDataStorage.GetAuthData();
                    Username = authData.Username;
                    Email = authData.Email;
                }
            }
        }

        public List<LeftMenuItem> AccountItems { get; set; }

        public List<LeftMenuItem> LeftMenuItems { get; set; } = new List<LeftMenuItem>
        {
            new LeftMenuItem { Icon = "lnr-map-marker", Text = "Location Feeder", CommandType = CommandType.Navigation, Command = $"{nameof(Navigation)}/{nameof(MainPage)}/{nameof(LocationFeederTab)}" },
            new LeftMenuItem { Icon = "pokedex", IsImageIcon = true, Text = "Pokedex", CommandType = CommandType.Navigation, Command = $"{nameof(Navigation)}/{nameof(MainPage)}/{nameof(PokedexTab)}"  },
            new LeftMenuItem { Icon = "iv_percentage", IsImageIcon = true, Text = "IV Calculator", CommandType = CommandType.Navigation, Command = $"{nameof(Navigation)}/{nameof(MainPage)}/{nameof(IVCalculatorTab)}"  },
            new LeftMenuItem { Icon = "lnr-magic-wand", Text = "News & Gags", CommandType = CommandType.Navigation, Command = $"{nameof(Navigation)}/{nameof(MainPage)}/{nameof(NewsTab)}"  }
        };

        private ObservableRangeCollection<PokemonAccount> _pokemonAccounts;
        public ObservableRangeCollection<PokemonAccount> PokemonAccounts
        {
            get { return _pokemonAccounts ?? (_pokemonAccounts = new ObservableRangeCollection<PokemonAccount>()); }
            set { SetProperty(ref _pokemonAccounts, value); }
        }

        public DelegateCommand<string> NavigateCommand { get; set; }
        public DelegateCommand<PokemonAccount> SelectPokemonAccountCommand { get; set; }
        public DelegateCommand AddPokemonAccountCommand { get; set; }
        public DelegateCommand<LeftMenuItem> AccountItemTapCommand { get; set; }
        public DelegateCommand<LeftMenuItem> LeftMenuTabItemTapCommand { get; set; }
        public DelegateCommand RegisterCommand { get; set; }
        public DelegateCommand LoginCommand { get; set; }


        public LeftMenuViewModel(INavigationService navigationService, IPageDialogService pageDialogService, IAccountService accountService)
        {
            _navigationService = navigationService;
            _pageDialogService = pageDialogService;
            _accountService = accountService;

            // Setup account items
            var authData = LocalDataStorage.GetAuthData();
            IsLoggedIn = authData != null;
            BuildAccountItems();

            // Setup commands
            NavigateCommand = new DelegateCommand<string>(Navigate);
            SelectPokemonAccountCommand = new DelegateCommand<PokemonAccount>(ExecuteSelectPokemonAccountCommand);
            AddPokemonAccountCommand = DelegateCommand.FromAsyncHandler(ExecuteAddPokemonAccountCommand);
            AccountItemTapCommand = new DelegateCommand<LeftMenuItem>(async item => await item.Action());
            LeftMenuTabItemTapCommand = new DelegateCommand<LeftMenuItem>(ExecuteLeftMenuTabItemTapCommand);
            RegisterCommand = DelegateCommand.FromAsyncHandler(ExecuteRegisterCommand);
            LoginCommand = DelegateCommand.FromAsyncHandler(ExecuteLoginCommand);

            // Subscribe to pokemon accounts events
            MessagingCenter.Subscribe<PokemonAccount>(this, "DeletePokemonAccount", account =>
            {
                var accountToDelete = PokemonAccounts.FirstOrDefault(x => x.Id == account.Id);
                if (accountToDelete != null)
                {
                    PokemonAccounts.Remove(accountToDelete);

                    if (accountToDelete.IsSelected && PokemonAccounts.Any())
                    {
                        ExecuteSelectPokemonAccountCommand(PokemonAccounts.First());
                    }
                }

                // Store to local storage
                LocalDataStorage.SavePokemonAccounts(Username, PokemonAccounts.ToList());
            });

            MessagingCenter.Subscribe<PokemonAccount>(this, "AddPokemonAccount", account =>
            {
                PokemonAccounts.Add(account);
                ExecuteSelectPokemonAccountCommand(account);

                // Store to local storage
                LocalDataStorage.SavePokemonAccounts(Username, PokemonAccounts.ToList());
            });

            MessagingCenter.Subscribe<PokemonAccount>(this, "UpdatePokemonAccount", account =>
            {
                var accountToUpdate = PokemonAccounts.FirstOrDefault(x => x.Id == account.Id);
                if (accountToUpdate != null)
                {
                    accountToUpdate.Username = account.Username;
                    accountToUpdate.Password = account.Password;
                    accountToUpdate.Avatar = account.Avatar;
                    accountToUpdate.Longitude = account.Longitude;
                    accountToUpdate.Latitude = account.Latitude;
                }

                // Store to local storage
                LocalDataStorage.SavePokemonAccounts(Username, PokemonAccounts.ToList());
            });

            MessagingCenter.Subscribe<RegisterPageViewModel>(this, "RegisterSuccessful", async sender =>
            {
                UserDialogs.Instance.ShowLoading("Logging in ...");
                var result = await _accountService.LoginAsync(sender.Username, sender.Password);
                DoLoginSuccessful(result);
                UserDialogs.Instance.HideLoading();
            });

            MessagingCenter.Subscribe<LoginPageViewModel, AuthData>(this, "LoginSuccessful", (sender, result) =>
            {
                DoLoginSuccessful(result);

                // Store to local storage
                LocalDataStorage.SavePokemonAccounts(Username, PokemonAccounts.ToList());
            });
        }

        private async Task ExecuteLoginCommand()
        {
            var loginPage = new LoginPage
            {
                BindingContext = new LoginPageViewModel()
            };

            await PopupNavigation.PushAsync(loginPage);
        }

        private async Task ExecuteRegisterCommand()
        {
            var registerPage = new RegisterPage
            {
                BindingContext = new RegisterPageViewModel()
            };

            await PopupNavigation.PushAsync(registerPage);
        }

        private void Navigate(string name)
        {
            _navigationService.NavigateAsync(name);
        }

        private void ExecuteLeftMenuTabItemTapCommand(LeftMenuItem menuItem)
        {
            if (menuItem == null) return;
            switch (menuItem.CommandType)
            {
                case CommandType.Navigation:
                    if (!string.IsNullOrEmpty(menuItem.Command))
                    {
                        _navigationService.NavigateAsync(menuItem.Command);
                    }
                    break;
                case CommandType.Action:
                    menuItem.Action();
                    break;
            }
        }

        private void ExecuteSelectPokemonAccountCommand(PokemonAccount selectedAccount)
        {
            foreach (var pokeAcc in PokemonAccounts)
            {
                pokeAcc.IsSelected = false;
            }

            selectedAccount.IsSelected = true;
            LocalDataStorage.SaveActivePokemonAccount(selectedAccount);
        }

        private async Task ExecuteAddPokemonAccountCommand()
        {
            if (PokemonAccounts.Count == 2)
            {
                await _pageDialogService.DisplayAlertAsync("", string.Format(Resource.MaximumPokemonAccountsSetup, 2), Resource.OK);
                return;
            }

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

        private void BuildAccountItems()
        {
            AccountItems = new List<LeftMenuItem>
            {
                new LeftMenuItem()
                {
                    Icon = "lnr-user",
                    Text = Resource.PokemonGoAccounts,
                    IsActived = true,
                    CommandType = CommandType.Action,
                    Action = async () =>
                    {
                        if (!PokemonAccounts.Any())
                        {
                            await _pageDialogService.DisplayAlertAsync("", Resource.NoPokemonAccountsSetup, Resource.OK);
                            return;
                        }

                        var pokemonGoAccountPopup = new PokemonGoAccountManagementPopup
                        {
                            BindingContext = new PokemonGoAccountManagementPopupViewModel()
                        };

                        await PopupNavigation.PushAsync(pokemonGoAccountPopup);
                    }
                },
                new LeftMenuItem()
                {
                    Icon = "lnr-power-switch",
                    Text = Resource.Logout,
                    IsActived = true,
                    CommandType = CommandType.Action,
                    Action = DoMenuItemLogoutAction
                }
            };
        }

        private async Task DoMenuItemLogoutAction()
        {
            LocalDataStorage.SaveAuthData(null);
            IsLoggedIn = false;

            // need to trick like this to make the ExtendedScrollView collection changed event works
            var temp = PokemonAccounts.ToList();
            foreach (var account in temp)
            {
                PokemonAccounts.Remove(account);
            }
        }

        private void DoLoginSuccessful(AuthData authData)
        {
            LocalDataStorage.SaveAuthData(authData);
            IsLoggedIn = true;

            LoadPokemonAccounts();
        }

        private void LoadPokemonAccounts()
        {
            var pokemonAccounts = LocalDataStorage.GetPokemonAccounts(Username);
            if (pokemonAccounts == null || !pokemonAccounts.Any())
                return;

            var activePokemonAccount = LocalDataStorage.GetActivePokemonAccount();
            PokemonAccount selectedPokemonAccount;
            if (activePokemonAccount == null || pokemonAccounts.All(x => x.Id != activePokemonAccount.Id))
            {
                selectedPokemonAccount = pokemonAccounts.First();
            }
            else
            {
                selectedPokemonAccount = pokemonAccounts.Single(x => x.Id == activePokemonAccount.Id);
            }

            PokemonAccounts.AddRange(pokemonAccounts);
            ExecuteSelectPokemonAccountCommand(selectedPokemonAccount);
        }

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);

            if (IsLoggedIn)
            {
                LoadPokemonAccounts();
            }
        }
    }
}
