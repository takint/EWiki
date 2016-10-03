using EWiki.Api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public interface IPokedexRepository : IRepository<Character>
    {
        Task<IEnumerable<Character>> GetAllWithAllIncludeAsync(int skip, int take);
        Task<Character> GetPokemonByNumber(string number);
    }
}
