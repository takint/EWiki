using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Utilities;
using Prism.Navigation;

namespace EWiki.XF.ViewModels
{
    public class NewsCategoryPageViewModel : BaseViewModel
    {
        private List<News> _dummyData = new List<News>
        {
            new News
            {
                Title = "asfs aiudhj najsdnas asdja qnw",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            },
            new News
            {
                Title = "asdad qwkjewqe qwkje jqwqk fqjwdmaksd",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            },
            new News
            {
                Title = "qwr sdf erwaet tdr grgasf",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            },
            new News
            {
                Title = "weretert eesfs",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            },
            new News
            {
                Title = "f rr wearwa3w ewaere",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            },
            new News
            {
                Title = "safn aksjdfnsdl fkjsdfskdlnf kjdsfb sjk",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
            }
        };

        private ObservableRangeCollection<News> _newsList;
        public ObservableRangeCollection<News> NewsList
        {
            get { return _newsList ?? (_newsList = new ObservableRangeCollection<News>()); }
            set { SetProperty(ref _newsList, value); }
        }

        public NewsCategoryPageViewModel()
        {
            NewsList.AddRange(_dummyData);
        }

        public override void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);

            var category = (NewsCategory) parameters["Category"];
            Title = category.Title;
        }

        public async Task LoadNewsAsync()
        {
            if (NewsList.Any())
                return;

            NewsList.AddRange(_dummyData);
        }
    }
}
