using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PageRepository : RepositoryBase<Page>, IPageRepository
    {
        public PageRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}