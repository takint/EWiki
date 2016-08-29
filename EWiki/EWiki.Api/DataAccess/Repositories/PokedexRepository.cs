using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PokedexRepository : RepositoryBase<Character>, IPokedexRepository
    {
        public PokedexRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
