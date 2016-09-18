using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Requests.News;

namespace EWiki.XF.Service
{
    public interface INewsService
    {
        Task<List<NewsSM>> GetNews(GetNewsRq rq);
    }

    public class NewsService : INewsService
    {
        public async Task<List<NewsSM>> GetNews(GetNewsRq rq)
        {
            var news = await WebApiClient.Instance.GetAsync<List<NewsSM>>("news");
            return news;
        }
    }
}
