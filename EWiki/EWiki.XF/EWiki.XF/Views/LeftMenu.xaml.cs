using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class LeftMenu : MasterDetailPage, IMasterDetailPageOptions
    {
        public LeftMenu()
        {
            InitializeComponent();
        }

        public bool IsPresentedAfterNavigation => Device.Idiom != TargetIdiom.Phone;
    }
}