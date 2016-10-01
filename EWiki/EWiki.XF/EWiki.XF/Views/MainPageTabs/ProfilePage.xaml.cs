using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class ProfilePage : ContentPage
    {
        public ProfilePage()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            ((ProfilePageViewModel)BindingContext).LoadPokemonAccounts();
        }
    }
}
