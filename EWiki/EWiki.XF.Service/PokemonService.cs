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
            var response = await client.GetStringAsync("http://192.168.1.9:2675/api/pokedex");
            var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
            return pokemons;
        }

        public async Task<int> GetPokemonsCount()
        {
            return 100;
        }
    }
}
