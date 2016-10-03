using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Resources;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class PokemonGoAccountPopupViewModel : BaseViewModel
    {
        public PokemonAccount Account { get; set; }

        public bool IsEdit { get; set; }

        public DelegateCommand CancelCommand { get; set; }
        public DelegateCommand DeleteCommand { get; set; }
        public DelegateCommand AddCommand { get; set; }
        public DelegateCommand UpdateCommand { get; set; }


        public PokemonGoAccountPopupViewModel()
        {
            CancelCommand = DelegateCommand.FromAsyncHandler(ExecuteCancelCommand);
            DeleteCommand = DelegateCommand.FromAsyncHandler(ExecuteDeleteCommand);
            AddCommand = DelegateCommand.FromAsyncHandler(ExecuteAddCommand);
            UpdateCommand = DelegateCommand.FromAsyncHandler(ExecuteUpdateCommand);
        }

        private async Task ExecuteDeleteCommand()
        {
            MessagingCenter.Send(Account, "DeletePokemonAccount");
            await PopupNavigation.PopAsync();
        }

        private async Task ExecuteAddCommand()
        {
            var validateResult = await ValidateAsync();
            if (validateResult)
            {
                MessagingCenter.Send(Account, "AddPokemonAccount");
                await PopupNavigation.PopAsync();
            }
        }

        private async Task ExecuteUpdateCommand()
        {
            var validateResult = await ValidateAsync();
            if (validateResult)
            {
                MessagingCenter.Send(Account, "UpdatePokemonAccount");
                await PopupNavigation.PopAsync();
            }
        }

        private async Task ExecuteCancelCommand()
        {
            await PopupNavigation.PopAsync();
        }

        private async Task<bool> ValidateAsync()
        {
            if (string.IsNullOrEmpty(Account.Username))
            {
                await UserDialogs.Instance.AlertAsync(Resource.EnterUsername, "", Resource.OK);
                return false;
            }

            if (string.IsNullOrEmpty(Account.Password))
            {
                await UserDialogs.Instance.AlertAsync(Resource.EnterPassword, "", Resource.OK);
                return false;
            }

            return true;
        }
    }
}
