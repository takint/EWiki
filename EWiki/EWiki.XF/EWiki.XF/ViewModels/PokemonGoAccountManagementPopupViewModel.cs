using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Resources;
using EWiki.XF.Utilities;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class PokemonGoAccountManagementPopupViewModel : BaseViewModel
    {
        private ObservableRangeCollection<PokemonAccount> _pokemonAccounts;
        public ObservableRangeCollection<PokemonAccount> PokemonAccounts
        {
            get { return _pokemonAccounts ?? (_pokemonAccounts = new ObservableRangeCollection<PokemonAccount>()); }
            set { SetProperty(ref _pokemonAccounts, value); }
        }

        private PokemonAccount _selectedAccount;
        public PokemonAccount SelectedAccount
        {
            get { return _selectedAccount; }
            set { SetProperty(ref _selectedAccount, value); }
        }

        public DelegateCommand<PokemonAccount> SelectPokemonAccountCommand { get; set; }
        public DelegateCommand CancelCommand { get; set; }
        public DelegateCommand DeleteCommand { get; set; }
        public DelegateCommand UpdateCommand { get; set; }

        public PokemonGoAccountManagementPopupViewModel()
        {
            SelectPokemonAccountCommand = new DelegateCommand<PokemonAccount>(ExecuteSelectPokemonAccountCommand);
            CancelCommand = DelegateCommand.FromAsyncHandler(ExecuteCancelCommand);
            DeleteCommand = DelegateCommand.FromAsyncHandler(ExecuteDeleteCommand);
            UpdateCommand = DelegateCommand.FromAsyncHandler(ExecuteUpdateCommand);
        }

        private void ExecuteSelectPokemonAccountCommand(PokemonAccount selectedAccount)
        {
            foreach (var pokeAcc in PokemonAccounts)
            {
                pokeAcc.IsSelected = false;
            }

            selectedAccount.IsSelected = true;
            SelectedAccount = selectedAccount;
        }

        private async Task ExecuteDeleteCommand()
        {
            MessagingCenter.Send(SelectedAccount, "DeletePokemonAccount");
            await PopupNavigation.PopAsync();
        }

        private async Task ExecuteUpdateCommand()
        {
            var validateResult = await ValidateAsync();
            if (validateResult)
            {
                MessagingCenter.Send(SelectedAccount, "UpdatePokemonAccount");
                await PopupNavigation.PopAsync();
            }
        }

        private async Task ExecuteCancelCommand()
        {
            await PopupNavigation.PopAsync();
        }

        public void LoadPokemonAccounts()
        {
            var authData = LocalDataStorage.GetAuthData();
            if (authData == null)
                return;

            var pokemonAccounts = LocalDataStorage.GetPokemonAccounts(authData.Username);
            if (pokemonAccounts == null || !pokemonAccounts.Any())
                return;

            PokemonAccounts.AddRange(pokemonAccounts);
            ExecuteSelectPokemonAccountCommand(PokemonAccounts.First());
        }

        private async Task<bool> ValidateAsync()
        {
            if (string.IsNullOrEmpty(SelectedAccount.Username))
            {
                await UserDialogs.Instance.AlertAsync(Resource.EnterUsername, "", Resource.OK);
                return false;
            }

            if (string.IsNullOrEmpty(SelectedAccount.Password))
            {
                await UserDialogs.Instance.AlertAsync(Resource.EnterPassword, "", Resource.OK);
                return false;
            }

            return true;
        }
    }
}
