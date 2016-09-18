using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class WikiImageRepository : RepositoryBase<WikiImage>, IWikiImageRepository
    {
        public WikiImageRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}