using EWiki.Api.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using System;
using EWiki.Api.Utility;

namespace EWiki.Api.DataAccess
{
    public class PokedexRepository : RepositoryBase<Character>, IPokedexRepository
    {
        public PokedexRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }

        public async Task<IEnumerable<Character>> GetAllWithAllIncludeAsync(int skip, int take)
        {
            IQueryable<Character> query = Queryable().Include(c => c.Avatar)
                                                .Include(c => c.Types).ThenInclude(t => t.Type)
                                                .Include(c => c.Locations).ThenInclude(l => l.PokeLocation)
                                                .Include(c => c.NormalMoves).ThenInclude(nm => nm.PokeMove).ThenInclude(m => m.MoveCategory)
                                                .Include(c => c.NormalMoves).ThenInclude(nm => nm.PokeMove).ThenInclude(m => m.Type)
                                                .Include(c => c.SpecialMoves).ThenInclude(sm => sm.PokeSpecialMove).ThenInclude(m => m.MoveCategory)
                                                .Include(c => c.SpecialMoves).ThenInclude(sm => sm.PokeSpecialMove).ThenInclude(m => m.Type)
                                                .OrderBy(r => r.Number)
                                                .Skip(skip)
                                                .Take(take);

            IEnumerable<Character> result = await query.ToListAsync();

            foreach (Character c in result)
            {
                // Evolve to pokemon
                if (!string.IsNullOrEmpty(c.EvolveIntos))
                {
                    c.EvolveIntoPokemons = await GetEnvolvePokemon(c.EvolveIntos);
                }

                // Evolve from pokemon
                if (!string.IsNullOrEmpty(c.EvolveFroms))
                {
                    c.EvolveFromPokemons = await GetEnvolvePokemon(c.EvolveFroms);
                }
            }

            return result;
        }

        private async Task<ICollection<Character>> GetEnvolvePokemon(string evolveList)
        {
            string[] evolveNumbers = evolveList.Split(',');
            List<Character> evolvePokemons = new List<Character>();

            foreach (string number in evolveNumbers)
            {
                Character envolvePokemon = await GetPokemonByNumber(number);

                if (envolvePokemon != null)
                {
                    evolvePokemons.Add(envolvePokemon);
                }
            }

            return evolvePokemons;
        }

        public async Task<Character> GetPokemonByNumber(string number)
        {
            IQueryable<Character> query = Queryable().Where(p => p.Number.Contains(number))
                                                .Include(c => c.Avatar)
                                                .Include(c => c.Types).ThenInclude(t => t.Type)
                                                .Include(c => c.Locations).ThenInclude(l => l.PokeLocation)
                                                .Include(c => c.NormalMoves).ThenInclude(nm => nm.PokeMove).ThenInclude(m => m.MoveCategory)
                                                .Include(c => c.NormalMoves).ThenInclude(nm => nm.PokeMove).ThenInclude(m => m.Type)
                                                .Include(c => c.SpecialMoves).ThenInclude(sm => sm.PokeSpecialMove).ThenInclude(m => m.MoveCategory)
                                                .Include(c => c.SpecialMoves).ThenInclude(sm => sm.PokeSpecialMove).ThenInclude(m => m.Type);


            return await query.DefaultIfEmpty(null).SingleOrDefaultAsync();
        }
    }
}
