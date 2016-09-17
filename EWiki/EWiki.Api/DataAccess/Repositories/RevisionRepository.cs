using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class RevisionRepository : RepositoryBase<Revision>, IRevisionRepository
    {
        public RevisionRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}