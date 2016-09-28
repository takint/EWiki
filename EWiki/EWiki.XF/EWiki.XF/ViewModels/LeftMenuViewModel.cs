using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.Settings;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Service.Models;
using EWiki.XF.Utilities;
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
                BuildAccountItems(value);

                if (value)
                {
                    var authData = Settings.Local.Get<AuthData>("AuthData");
                    Username = authData.Username;
                    Email = authData.Email;

                    PokemonAccounts.Clear();
                    var pokemonAccounts = LocalDataStorage.GetPokemonAccounts(Username);
                    if (pokemonAccounts != null)
                        PokemonAccounts.AddRange(pokemonAccounts);
                }
            }
        }

        private ObservableCollection<LeftMenuItem> _accountItems;
        public ObservableCollection<LeftMenuItem> AccountItems
        {
            get { return _accountItems; }
            set { SetProperty(ref _accountItems, value); }
        }

        private ObservableRangeCollection<PokemonAccount> _pokemonAccounts;
        public ObservableRangeCollection<PokemonAccount> PokemonAccounts
        {
            get { return _pokemonAccounts ?? (_pokemonAccounts = new ObservableRangeCollection<PokemonAccount>()); }
            set { SetProperty(ref _pokemonAccounts, value); }
        }

        public DelegateCommand<string> NavigateCommand { get; set; }
        public DelegateCommand<PokemonAccount> SelectPokemonAccountCommand { get; set; }
        public DelegateCommand AddPokemonAccountCommand { get; set; }
        public DelegateCommand<PokemonAccount> EditPokemonAccountCommand { get; set; }
        public DelegateCommand<LeftMenuItem> AccountItemTapCommand { get; set; }

        public LeftMenuViewModel(INavigationService navigationService, IPageDialogService pageDialogService, IAccountService accountService)
        {
            _navigationService = navigationService;
            _pageDialogService = pageDialogService;
            _accountService = accountService;

            // Setup account items
            var authData = LocalDataStorage.GetAuthData();
            IsLoggedIn = authData != null;

            // Setup commands
            NavigateCommand = new DelegateCommand<string>(Navigate);
            SelectPokemonAccountCommand = new DelegateCommand<PokemonAccount>(ExecuteSelectPokemonAccountCommand);
            AddPokemonAccountCommand = DelegateCommand.FromAsyncHandler(ExecuteAddPokemonAccountCommand);
            EditPokemonAccountCommand = new DelegateCommand<PokemonAccount>(async account => await ExecuteEditPokemonAccountCommand(account));
            AccountItemTapCommand = new DelegateCommand<LeftMenuItem>(async item => await item.Action());

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

        private void Navigate(string name)
        {
            _navigationService.NavigateAsync(name);
        }

        public void LeftMenuItemSelectedHandler(LeftMenuItem menuItem)
        {
            ItemSelectedHandler(menuItem);
        }

        public void AccountMenuItemSelectedHandler(LeftMenuItem menuItem)
        {
            ItemSelectedHandler(menuItem);
        }

        private void ItemSelectedHandler(LeftMenuItem menuItem)
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
            }
        }

        private void ExecuteSelectPokemonAccountCommand(PokemonAccount selectedAccount)
        {
            foreach (var pokeAcc in PokemonAccounts)
            {
                pokeAcc.IsSelected = false;
            }

            selectedAccount.IsSelected = true;
            App.PokemonGoAccount = $"{selectedAccount.Username}:{selectedAccount.Password}:{selectedAccount.Latitude}:{selectedAccount.Longitude}";
        }

        private async Task ExecuteAddPokemonAccountCommand()
        {
            if (PokemonAccounts.Count == 2)
            {
                await _pageDialogService.DisplayAlertAsync("", "You have setup maximum 2 Pokemon accounts!", "OK");
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

        private async Task ExecuteEditPokemonAccountCommand(PokemonAccount selectedAccount)
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

        private void BuildAccountItems(bool isLoggedIn)
        {
            if (isLoggedIn)
            {
                AccountItems = new ObservableCollection<LeftMenuItem>
                {
                    new LeftMenuItem()
                    {
                        Icon = "lnr-user",
                        Text = "Account",
                        IsActived = true,
                        Action = DoMenuItemAccountAction
                    },
                    new LeftMenuItem()
                    {
                        Icon = "lnr-power-switch",
                        Text = "Logout",
                        IsActived = true,
                        Action = DoMenuItemLogoutAction
                    }
                };
            }
            else
            {
                AccountItems = new ObservableCollection<LeftMenuItem>
                {
                    new LeftMenuItem()
                    {
                        Icon = "lnr-user",
                        Text = "Register",
                        IsActived = true,
                        Action = DoMenuItemRegisterAction
                    },
                    new LeftMenuItem()
                    {
                        Icon = "lnr-power-switch",
                        Text = "Login",
                        IsActived = true,
                        Action = DoMenuItemLoginAction
                    }
                };
            }
        }

        private async Task DoMenuItemAccountAction()
        {
            return;
        }

        private async Task DoMenuItemLogoutAction()
        {
            LocalDataStorage.SaveAuthData(null);
            IsLoggedIn = false;
        }

        private async Task DoMenuItemRegisterAction()
        {
            var registerPage = new RegisterPage
            {
                BindingContext = new RegisterPageViewModel()
            };

            await PopupNavigation.PushAsync(registerPage);
        }

        private async Task DoMenuItemLoginAction()
        {
            var loginPage = new LoginPage
            {
                BindingContext = new LoginPageViewModel()
            };

            await PopupNavigation.PushAsync(loginPage);
        }

        private void DoLoginSuccessful(AuthData authData)
        {
            LocalDataStorage.SaveAuthData(authData);
            IsLoggedIn = true;
        }

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override async void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);
        }
    }
}
