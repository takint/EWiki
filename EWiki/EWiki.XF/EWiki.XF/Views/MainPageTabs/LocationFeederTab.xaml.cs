using EWiki.XF.Models;
using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class LocationFeederTab : ContentPage
    {
        public LocationFeederTab()
        {
            InitializeComponent();
            SniperInfoListView.ItemAppearing += (sender, args) =>
            {
                if (ActivityIndicator.IsVisible)
                {
                    ActivityIndicator.IsRunning = false;
                    ActivityIndicator.IsVisible = false;
                    Message.IsVisible = false;
                }
            };
        }
    }
}
