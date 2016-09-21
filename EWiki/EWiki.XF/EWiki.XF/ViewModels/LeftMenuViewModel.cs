using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
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

        private string _username;

        public string UserName
        {
            get { return _username; }
            set
            {
                SetProperty(ref _username, value);
                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _password;

        public string Password
        {
            get { return _password; }
            set
            {
                SetProperty(ref _password, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _latitude = "40.76887944936599";

        public string Latitude
        {
            get { return _latitude; }
            set
            {
                SetProperty(ref _latitude, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _longitude = "-73.97816622302156";

        public string Longitude
        {
            get { return _longitude; }
            set
            {
                SetProperty(ref _longitude, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        public DelegateCommand<string> NavigateCommand { get; set; }
        public LeftMenuViewModel(INavigationService navigationService)
        {
            _navigationService = navigationService;
            NavigateCommand = new DelegateCommand<string>(Navigate);
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

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);
        }
    }
}
