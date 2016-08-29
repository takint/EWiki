using System.Collections.Generic;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Requests.Pokemon;

namespace EWiki.XF.Service
{
    public interface IPokemonService
    {
        Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq);
        Task<int> GetPokemonsCount();
    }

    public class PokemonService : IPokemonService
    {
        public PokemonService()
        {

        }

        public async Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq)
        {
            var pokemons = new List<PokemonSM>()
                {
                    new PokemonSM()
                    {
                        Name = "Bulbasaur",
                        Description = "Trên lưng của Bulbasaur có một hạt giống có thể nở nhờ ánh sáng nên nó thường ngủ trưa dưới ánh mặt trời. ",
                        Avatar = "p002.png",
                        MaxCP = 1530
                    }
                };
            return pokemons;
        }

        public async Task<int> GetPokemonsCount()
        {
            return 100;
        }
    }
}
