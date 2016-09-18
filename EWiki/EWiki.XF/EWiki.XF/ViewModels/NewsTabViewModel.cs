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
                Title = "aaa",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "111"
            },
            new News
            {
                Title = "bbb",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "111"
            },
            new News
            {
                Title = "ccc",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "222"
            },
            new News
            {
                Title = "ddd",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "222"
            },
            new News
            {
                Title = "eee",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "222"
            },
            new News
            {
                Title = "fff",
                ImageUrl = "http://pngfever.com/wp-content/uploads/2016/08/Sunny-Leone-Spicy-Photo.jpg",
                Category = "333"
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

        public NewsTabViewModel(INewsService newsService)
        {
            _newsService = newsService;
        }

        public override async void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);

            await LoadNews();
        }

        private async Task LoadNews()
        {
            FeaturedNewsList.AddRange(_dummyData);

            foreach (var category in _dummyData.Select(x => x.Category).Distinct())
            {
                var group = new NewsGroup
                {
                    Category = category,
                    NewsList = new ObservableCollection<News>(_dummyData.Where(x => x.Category == category))
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
