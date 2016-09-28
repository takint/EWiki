using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Service;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class RegisterPageViewModel : BaseViewModel
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }

        public DelegateCommand CancelCommand { get; set; }
        public DelegateCommand RegisterCommand { get; set; }


        public RegisterPageViewModel()
        {
            CancelCommand = DelegateCommand.FromAsyncHandler(ExecuteCancelCommand);
            RegisterCommand = DelegateCommand.FromAsyncHandler(ExecuteRegisterCommand);
        }

        private async Task ExecuteRegisterCommand()
        {
            var validateResult = await ValidateAsync();
            if (validateResult)
            {
                var accountService = new AccountService();

                try
                {
                    UserDialogs.Instance.ShowLoading("Registering ...");
                    await accountService.RegisterAsync(Username, Email, Password);
                    UserDialogs.Instance.HideLoading();
                    
                    MessagingCenter.Send(this, "RegisterSuccessful");
                    await PopupNavigation.PopAsync();
                }
                catch (Exception ex)
                {
                    UserDialogs.Instance.HideLoading();
                    await UserDialogs.Instance.AlertAsync(ex.Message, "Error", "Retry");
                }
            }
        }

        private async Task ExecuteCancelCommand()
        {
            await PopupNavigation.PopAsync();
        }

        private async Task<bool> ValidateAsync()
        {
            if (string.IsNullOrEmpty(Username))
            {
                await UserDialogs.Instance.AlertAsync("Please enter username", "", "OK");
                return false;
            }

            if (string.IsNullOrEmpty(Email))
            {
                await UserDialogs.Instance.AlertAsync("Please enter email", "", "OK");
                return false;
            }

            if (string.IsNullOrEmpty(Password))
            {
                await UserDialogs.Instance.AlertAsync("Please enter password", "", "OK");
                return false;
            }

            if (Password != ConfirmPassword)
            {
                await UserDialogs.Instance.AlertAsync("Confirm password does not match", "", "OK");
                return false;
            }

            return true;
        }
    }
}
