using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PageLangRepository : RepositoryBase<PageLang>, IPageLangRepository
    {
        public PageLangRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}