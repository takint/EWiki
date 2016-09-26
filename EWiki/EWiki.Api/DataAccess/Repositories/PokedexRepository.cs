using EWiki.Api.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public class PokedexRepository : RepositoryBase<Character>, IPokedexRepository
    {
        public PokedexRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }

        public async Task<IEnumerable<Character>> GetAllWithAllIncludeAsync()
        {
            IQueryable<Character> query = Queryable().Include(c => c.Avatar)
                                                .Include(c => c.Types).ThenInclude(t => t.Type)
                                                .Include(c => c.Locations).ThenInclude(l => l.PokeLocation)
                                                .Include(c => c.NormalMoves).ThenInclude(nm => nm.PokeMove).ThenInclude(m => m.MoveCategory)
                                                .Include(c => c.SpecialMoves).ThenInclude(sm => sm.PokeSpecialMove).ThenInclude(m => m.MoveCategory);

            return await query.ToListAsync();
        }
    }
}
