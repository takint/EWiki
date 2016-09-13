using EWiki.XF.Views.Rerenders;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class MainPage : BottomTabbedPage
    {
        public MainPage()
        {
            InitializeComponent();
            Children.Add(new LocationFeederTab()
            {
                Icon = "lnr-map-marker"
            });
            Children.Add(new ContentPage()
            {
                Icon = "iv_percentage"
            });
            Children.Add(new ContentPage()
            {
                Icon = "lnr-magic-wand"
            });
            Children.Add(new PokedexTab());
        }
    }
}
