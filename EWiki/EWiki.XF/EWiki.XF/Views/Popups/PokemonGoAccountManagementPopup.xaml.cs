using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.ViewModels;
using Rg.Plugins.Popup.Pages;
using Xamarin.Forms;

namespace EWiki.XF.Views.Popups
{
    public partial class PokemonGoAccountManagementPopup : PopupPage
    {
        public PokemonGoAccountManagementPopup()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            ((PokemonGoAccountManagementPopupViewModel)BindingContext).LoadPokemonAccounts();
        }
    }
}
