using EWiki.Api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public interface IPokedexRepository : IRepository<Character>
    {
        Task<IEnumerable<Character>> GetAllWithAllIncludeAsync(int skip = 0, int take = 10);
        Task<Character> GetPokemonByNumber(string number);
    }
}
