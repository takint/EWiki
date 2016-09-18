using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class ArchiveRepository : RepositoryBase<Archive>, IArchiveRepository
    {
        public ArchiveRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
