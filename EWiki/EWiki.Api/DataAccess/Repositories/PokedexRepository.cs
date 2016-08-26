using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class PokedexRepository : RepositoryBase<Pokedex>, IPokedexRepository
    {
        public PokedexRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
