using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class NewsTab : ContentPage
    {
        public NewsTab()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            var context = BindingContext as NewsTabViewModel;
            if (context != null) await context.LoadNewsAsync();
            base.OnAppearing();
        }
    }
}
