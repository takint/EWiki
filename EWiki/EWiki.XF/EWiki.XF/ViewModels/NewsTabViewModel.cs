using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Utilities;
using EWiki.XF.Views;
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
        private readonly INavigationService _navigationService;

        private ObservableCollection<NewsGroup> _newsGroups;
        public ObservableCollection<NewsGroup> NewsGroups
        {
            get { return _newsGroups ?? (_newsGroups = new ObservableCollection<NewsGroup>()); }
            set { SetProperty(ref _newsGroups, value); }
        }

        private ObservableCollection<News> _featuredNewsList;
        public ObservableCollection<News> FeaturedNewsList
        {
            get { return _featuredNewsList ?? (_featuredNewsList = new ObservableCollection<News>()); }
            set { SetProperty(ref _featuredNewsList, value); }
        }

        public DelegateCommand<NewsGroup> MoreNewsCommand { get; set; }

        public NewsTabViewModel(INewsService newsService, INavigationService navigationService)
        {
            _newsService = newsService;
            _navigationService = navigationService;

            MoreNewsCommand = new DelegateCommand<NewsGroup>(async (group) => await ExecuteMoreNewsCommandAsync(group));
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

            foreach (var news in _dummyData)
            {
                FeaturedNewsList.Add(news);
            }

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

        private async Task ExecuteMoreNewsCommandAsync(NewsGroup group)
        {
            var navParams = new NavigationParameters
            {
                {"Category", new NewsCategory { Title = group.Category } }
            };

            await _navigationService.NavigateAsync($"{nameof(NewsCategoryPage)}", navParams, false);
        }
    }

    public class NewsGroup : BindableBase
    {
        public string Category { get; set; }

        public ObservableCollection<News> NewsList { get; set; }
    }
}
