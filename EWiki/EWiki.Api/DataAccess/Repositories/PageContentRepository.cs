using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PageContentRepository : RepositoryBase<PageContent>, IPageContentRepository
    {
        public PageContentRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}