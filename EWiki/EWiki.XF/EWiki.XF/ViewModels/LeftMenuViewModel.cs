using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Utilities;
using Prism.Commands;
using Prism.Navigation;

namespace EWiki.XF.ViewModels
{
    public class LeftMenuViewModel : BaseViewModel
    {
        INavigationService _navigationService;
        public ObservableCollection<LeftMenuItem> MenuItems
        {
            get
            {
                var menuItems = new ObservableCollection<LeftMenuItem>()
                {
                    new LeftMenuItem()
                   {
                       Icon = "lnr-home",
                       Text = "Trang chủ",
                       Command = "Navigation/MainPage/PlantListTab",
                       IsActived = true
                   }
                };
                return menuItems;
            }

        }

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

        private bool _isPokemonAccountsExpand;
        public bool IsPokemonAccountsExpand
        {
            get { return _isPokemonAccountsExpand; }
            set { SetProperty(ref _isPokemonAccountsExpand, value); }
        }

        public DelegateCommand<string> NavigateCommand { get; set; }
        public DelegateCommand<PokemonAccount> SelectAccountCommand { get; set; }
        public DelegateCommand TogglePokemonAccountsCommand { get; set; }


        public LeftMenuViewModel(INavigationService navigationService)
        {
            _navigationService = navigationService;
            NavigateCommand = new DelegateCommand<string>(Navigate);
            SelectAccountCommand = new DelegateCommand<PokemonAccount>(ExecuteSelectAccountCommand);
            TogglePokemonAccountsCommand = new DelegateCommand(() => IsPokemonAccountsExpand = !IsPokemonAccountsExpand);
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
            PokemonAccounts.AddRange(new List<PokemonAccount>
            {
                new PokemonAccount { Username = "abcdef", Avatar = "no_avatar"},
                new PokemonAccount { Username = "abcdef", Avatar = "no_avatar"},
                new PokemonAccount { Username = "abcdef", Avatar = "no_avatar"},
                new PokemonAccount { Username = "abcdef", Avatar = "no_avatar"},
                new PokemonAccount { Username = "abcdef", Avatar = "no_avatar"}
            });
        }

        private void ExecuteSelectAccountCommand(PokemonAccount selectedAccount)
        {
            foreach (var pokeAcc in PokemonAccounts)
            {
                pokeAcc.IsSelected = false;
            }

            selectedAccount.IsSelected = true;
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
