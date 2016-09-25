using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.ViewModels;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class NewsCategoryPage : ContentPage
    {
        public NewsCategoryPage()
        {
            InitializeComponent();

            CalculateGridNewsItemSize();
        }

        protected override async void OnAppearing()
        {
            var context = BindingContext as NewsCategoryPageViewModel;
            if (context != null) await context.LoadNewsAsync();
            base.OnAppearing();
        }

        private void CalculateGridNewsItemSize()
        {
            GridNews.ItemWidth = (double)Acr.DeviceInfo.DeviceInfo.Hardware.ScreenWidth/2 - 10;
            GridNews.ItemHeight = GridNews.ItemWidth*1.2;
        }
    }
}
