using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PageRestrictionRepository : RepositoryBase<PageRestriction>, IPageRestrictionRepository
    {
        public PageRestrictionRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}