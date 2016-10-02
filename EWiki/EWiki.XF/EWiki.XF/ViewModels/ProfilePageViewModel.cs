using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Utilities;
using EWiki.XF.Views.Popups;
using Prism.Commands;
using Prism.Navigation;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class ProfilePageViewModel : BaseViewModel
    {
        private ObservableRangeCollection<PokemonAccount> _pokemonAccounts;
        public ObservableRangeCollection<PokemonAccount> PokemonAccounts
        {
            get { return _pokemonAccounts ?? (_pokemonAccounts = new ObservableRangeCollection<PokemonAccount>()); }
            set { SetProperty(ref _pokemonAccounts, value); }
        }

        public DelegateCommand<PokemonAccount> EditPokemonAccountCommand { get; set; }

        public ProfilePageViewModel()
        {
            EditPokemonAccountCommand = new DelegateCommand<PokemonAccount>(async account => await ExecuteEditPokemonAccountCommand(account));

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
            });
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

        public void LoadPokemonAccounts()
        {
            var authData = LocalDataStorage.GetAuthData();
            if (authData != null)
            {
                var pokemonAccounts = LocalDataStorage.GetPokemonAccounts(authData.Username);
                if (pokemonAccounts != null)
                    PokemonAccounts.AddRange(pokemonAccounts);
            }
        }
    }
}
