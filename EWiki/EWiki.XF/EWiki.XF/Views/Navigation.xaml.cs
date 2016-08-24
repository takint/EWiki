using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class Navigation : NavigationPage, INavigationPageOptions
    {
        public Navigation(NavigationPage root) : base(root)
        {
            InitializeComponent();
        }

        public bool ClearNavigationStackOnNavigation => true;
    }
}
