using System.Threading.Tasks;
using EWiki.DataAccess.Infrastructure;
using EWiki.DataAccess.Models;
using EWiki.Entities.Models;
using System.Collections.Generic;

namespace EWiki.DataAccess.Services.ServiceInterfaces
{
    public interface IPokedexService : IService<Pokedex>
    {
        Task<IEnumerable<GetPokedexDTO>> GetPokedexesAsync(int skip, int take, string userFilter, string name);
        Task<GetPokedexDTO> GetPokemonAsync(string name);
        Task<string> AddPokemon(NewPokedexDTO newPokemon, string userName);
        Task<string> UpdatePokedex(NewPokedexDTO updatePokemon, string userName);
        Task<string> DeletePokedex(NewPokedexDTO deletePokemon);
    }
}
