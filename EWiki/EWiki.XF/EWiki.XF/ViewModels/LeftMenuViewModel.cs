using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.Settings;
using EWiki.XF.Models;
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

        public ObservableCollection<LeftMenuItem> AccountItems
        {
            get
            {
                var accountItems = new ObservableCollection<LeftMenuItem>()
                {
                   new LeftMenuItem()
                   {
                       Icon = "lnr-user",
                       Text = "Hồ sơ",
                       IsActived = true
                   },
                   new LeftMenuItem()
                   {
                       Icon = "lnr-power-switch",
                       Text = "Đăng xuất",
                       IsActived = true
                   }
                };
                return accountItems;
            }

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

        public LeftMenuViewModel(INavigationService navigationService, IPageDialogService pageDialogService)
        {
            _navigationService = navigationService;
            _pageDialogService = pageDialogService;
            NavigateCommand = new DelegateCommand<string>(Navigate);
            SelectPokemonAccountCommand = new DelegateCommand<PokemonAccount>(ExecuteSelectPokemonAccountCommand);
            AddPokemonAccountCommand = DelegateCommand.FromAsyncHandler(ExecuteAddPokemonAccountCommand);
            EditPokemonAccountCommand = new DelegateCommand<PokemonAccount>(async account => await ExecuteEditPokemonAccountCommand(account));

            MessagingCenter.Subscribe<PokemonAccount>(this, "DeletePokemonAccount", account =>
            {
                var accountToDelete = PokemonAccounts.FirstOrDefault(x => x.Id == account.Id);
                if (accountToDelete != null)
                {
                    PokemonAccounts.Remove(accountToDelete);

                    if (accountToDelete.IsSelected && PokemonAccounts.Any())
                        PokemonAccounts.First().IsSelected = true;
                }

                // Store to local storage
                Settings.Local.Set("PokemonAccounts", PokemonAccounts.ToList());
            });

            MessagingCenter.Subscribe<PokemonAccount>(this, "AddPokemonAccount", account =>
            {
                account.IsSelected = true;
                PokemonAccounts.Add(account);

                // Store to local storage
                Settings.Local.Set("PokemonAccounts", PokemonAccounts.ToList());
            });

            MessagingCenter.Subscribe<PokemonAccount>(this, "UpdatePokemonAccount", account =>
            {
                var accountToUpdate = PokemonAccounts.FirstOrDefault(x => x.Id == account.Id);
                if (accountToUpdate != null)
                {
                    accountToUpdate.Username = account.Username;
                    accountToUpdate.Password = account.Password;
                    accountToUpdate.Avatar = account.Avatar;
                    accountToUpdate.Longtitude = account.Longtitude;
                    accountToUpdate.Latitude = account.Latitude;
                }

                // Store to local storage
                Settings.Local.Set("PokemonAccounts", PokemonAccounts.ToList());
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

        private async Task LoadPokemonAccountsAsync()
        {
            var pokemonAccounts = Settings.Local.Get<List<PokemonAccount>>("PokemonAccounts");
            if(pokemonAccounts != null)
                PokemonAccounts.AddRange(pokemonAccounts);
        }

        private void ExecuteSelectPokemonAccountCommand(PokemonAccount selectedAccount)
        {
            foreach (var pokeAcc in PokemonAccounts)
            {
                pokeAcc.IsSelected = false;
            }

            selectedAccount.IsSelected = true;
        }

        private async Task ExecuteAddPokemonAccountCommand()
        {
            if (PokemonAccounts.Count == 5)
            {
                await _pageDialogService.DisplayAlertAsync("", "You have setup maximum 5 Pokemon accounts!", "OK");
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
                        Longtitude = selectedAccount.Longtitude,
                        Avatar = selectedAccount.Avatar
                    },
                    IsEdit = true
                }
            };

            await PopupNavigation.PushAsync(pokemonGoAccountPopup);
        }

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override async void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);

            await LoadPokemonAccountsAsync();
        }
    }
}
