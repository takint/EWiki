using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Utilities;
using Prism.Commands;
using Prism.Mvvm;
using Prism.Navigation;

namespace EWiki.XF.ViewModels
{
    public class NewsTabViewModel : BaseViewModel
    {
        private List<News> _dummyData = new List<News>
        {
            new News
            {
                Title = "asfs aiudhj najsdnas asdja qnw",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 1"
            },
            new News
            {
                Title = "asdad qwkjewqe qwkje jqwqk fqjwdmaksd",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 1"
            },
            new News
            {
                Title = "qwr sdf erwaet tdr grgasf",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 2"
            },
            new News
            {
                Title = "weretert eesfs",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 2"
            },
            new News
            {
                Title = "f rr wearwa3w ewaere",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 2"
            },
            new News
            {
                Title = "safn aksjdfnsdl fkjsdfskdlnf kjdsfb sjk",
                ImageUrl = "https://s-media-cache-ak0.pinimg.com/736x/37/f7/56/37f7568269edc2aa4bbb3ac02c461a4a.jpg",
                Category = "Just do it 3"
            }
        };

        private readonly INewsService _newsService;

        private ObservableRangeCollection<NewsGroup> _newsGroups;
        public ObservableRangeCollection<NewsGroup> NewsGroups
        {
            get { return _newsGroups ?? (_newsGroups = new ObservableRangeCollection<NewsGroup>()); }
            set { SetProperty(ref _newsGroups, value); }
        }

        private ObservableRangeCollection<News> _featuredNewsList;
        public ObservableRangeCollection<News> FeaturedNewsList
        {
            get { return _featuredNewsList ?? (_featuredNewsList = new ObservableRangeCollection<News>()); }
            set { SetProperty(ref _featuredNewsList, value); }
        }

        private int _indicationPosition;
        public int IndicationPosition
        {
            get { return _indicationPosition; }
            set
            {
                SetProperty(ref _indicationPosition, value);
            }
        }

        public NewsTabViewModel(INewsService newsService)
        {
            _newsService = newsService;
        }

        //public override async void OnNavigatedTo(NavigationParameters parameters)
        //{
        //    base.OnNavigatedTo(parameters);

        //    await LoadNewsAsync();
        //}

        public async Task LoadNewsAsync()
        {
            if (FeaturedNewsList.Any())
                return;

            FeaturedNewsList.AddRange(_dummyData);

            var temp = _dummyData.Concat(_dummyData).Concat(_dummyData).ToList();
            foreach (var category in temp.Select(x => x.Category).Distinct())
            {
                var group = new NewsGroup
                {
                    Category = category,
                    NewsList = new ObservableCollection<News>(temp.Where(x => x.Category == category))
                };

                NewsGroups.Add(group);
            }
        }
    }

    public class NewsGroup : BindableBase
    {
        public string Category { get; set; }

        public ObservableCollection<News> NewsList { get; set; }
    }
}
