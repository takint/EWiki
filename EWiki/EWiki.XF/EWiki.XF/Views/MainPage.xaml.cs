using System.Linq;
using EWiki.XF.Views.Rerenders;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class MainPage : BottomTabbedPage
    {
        public MainPage()
        {
            InitializeComponent();
            CurrentPageChanged += UpdateTitle;
        }

        private void UpdateTitle()
        {
            Title = CurrentPage.Title;
        }
    }
}
