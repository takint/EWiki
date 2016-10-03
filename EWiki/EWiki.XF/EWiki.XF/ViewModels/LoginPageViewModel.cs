using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.UserDialogs;
using EWiki.XF.Resources;
using EWiki.XF.Service;
using EWiki.XF.Service.Models;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LoginPageViewModel : BaseViewModel
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public DelegateCommand CancelCommand { get; set; }
        public DelegateCommand LoginCommand { get; set; }


        public LoginPageViewModel()
        {
            CancelCommand = DelegateCommand.FromAsyncHandler(ExecuteCancelCommand);
            LoginCommand = DelegateCommand.FromAsyncHandler(ExecuteRegisterCommand);
        }

        private async Task ExecuteRegisterCommand()
        {
            var validateResult = await ValidateAsync();
            if (validateResult)
            {
                var accountService = new AccountService();

                try
                {
                    UserDialogs.Instance.ShowLoading(Resource.LoggingIn);
                    var result = await accountService.LoginAsync(Username, Password);
                    UserDialogs.Instance.HideLoading();
                    
                    MessagingCenter.Send(this, "LoginSuccessful", result);
                    await PopupNavigation.PopAsync();
                }
                catch (Exception ex)
                {
                    UserDialogs.Instance.HideLoading();
                    await UserDialogs.Instance.AlertAsync(ex.Message, Resource.ErrorTitle, Resource.Retry);
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
                await UserDialogs.Instance.AlertAsync(Resource.EnterUsername, "", Resource.OK);
                return false;
            }


            if (string.IsNullOrEmpty(Password))
            {
                await UserDialogs.Instance.AlertAsync(Resource.EnterPassword, "", Resource.OK);
                return false;
            }

            return true;
        }
    }
}
