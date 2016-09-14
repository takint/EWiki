using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Requests.Pokemon;
using System.Net.Http;
using Newtonsoft.Json;

namespace EWiki.XF.Service
{
    public interface IPokemonService
    {
        Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq);
        Task<int> GetPokemonsCount();
    }

    public class PokemonService : IPokemonService
    {
        HttpClient client = new HttpClient();
        public PokemonService()
        {

        }

        public async Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq)
        {
            try
            {
                var response = await client.GetStringAsync("http://192.168.1.9:2675/api/pokedex");
                var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
                return pokemons;
            }
            catch (Exception)
            {
                var response =
                    "[{\"name\":\"Bulbasaur\",\"slug\":\"bulbasaur\",\"number\":\"#001\",\"species\":\"Pokémon Hạt Giống\",\"weight\":6.9,\"height\":0.7,\"stamina\":90,\"attack\":126,\"defense\":126,\"candy\":25,\"cpGain\":13.8,\"maxCP\":1071.0,\"description\":\"Trên lưng của Bulbasaur có một hạt giống có thể nở nhờ ánh sáng nên nó thường ngủ trưa dưới ánh mặt trời. \",\"evolveIntos\":\"#002\",\"evolveFrom\":null,\"locations\":null,\"normalMoves\":null,\"specialMoves\":null,\"evolveInto\":[{\"name\":\"Ivysaur\",\"slug\":\"ivysaur\",\"number\":\"#002\",\"species\":\"Pokémon Hạt Giống\",\"weight\":13.0,\"height\":1.0,\"stamina\":120,\"attack\":156,\"defense\":158,\"candy\":100,\"cpGain\":21.6,\"maxCP\":1632.0,\"description\":\"Sau khi tiến hoá từ Bulbasaur, hạt giống trên lưng trở thành nụ hoa. Vì vậy nó dành nhiều hơn thời gian dưới ánh mặt trời để tiến hoá.\",\"evolveIntos\":\"#003\"}]}]";
                var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
                return pokemons;
            }
        }

        public async Task<int> GetPokemonsCount()
        {
            return 100;
        }
    }
}
