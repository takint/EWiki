using System;
using System.Collections.ObjectModel;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Models.Enum;
using EWiki.XF.Views.Popups;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class IVCalculatorDetailsPopupViewModel : BaseViewModel
    {
        private ObservableCollection<IVDetail> _details = new ObservableCollection<IVDetail>();

        public ObservableCollection<IVDetail> Details
        {
            get { return _details; }
            set { SetProperty(ref _details, value); }
        }
    }
}
