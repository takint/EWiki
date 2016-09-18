using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PageMetaRepository : RepositoryBase<PageMeta>, IPageMetaRepository
    {
        public PageMetaRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}