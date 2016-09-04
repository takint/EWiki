using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class MoveRepository : RepositoryBase<Move>, IMoveRepository
    {
        public MoveRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
