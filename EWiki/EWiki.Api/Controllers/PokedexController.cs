using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;
using EWiki.DataAccess.Models;using EWiki.DataAccess.Services.ServiceInterfaces;

namespace EWiki.Api.Controllers
{
    public class PokedexController : ApiController
    {
        private readonly IPokedexService _pokedexService;

        public PokedexController(IPokedexService pokedexService)
        {
            _pokedexService = pokedexService;
        }

        [HttpPost]
        [Authorize]
        [Route("api/pokedex/create")]
        public async Task<string> CreatePokedex(NewPokedexDTO newPokedex)
        {
            ClaimsPrincipal principal = Request.GetRequestContext().Principal as ClaimsPrincipal;
            var userName = ClaimsPrincipal.Current.Identity.Name;
            return await _pokedexService.AddPokemon(newPokedex, userName);
        }

        [HttpPost]
        [Authorize]
        [Route("api/pokedex/update")]
        public async Task<string> UpdatePokedex(NewPokedexDTO updatePokedex)
        {
            ClaimsPrincipal principal = Request.GetRequestContext().Principal as ClaimsPrincipal;
            string userName = ClaimsPrincipal.Current.Identity.Name;

            return await _pokedexService.UpdatePokedex(updatePokedex, userName);
        }

        [HttpPost]
        [Authorize]
        [Route("api/pokedex/delete")]
        public async Task<string> DeletePokedex(NewPokedexDTO deletePokedex)
        {
            return await _pokedexService.DeletePokedex(deletePokedex);
        }

        [Route("api/pokedex/getpokedexes")]
        public async Task<IEnumerable<GetPokedexDTO>> GetPokedexes(int skip, int take)
        {
            return await _pokedexService.GetPokedexesAsync(skip, take, "", "");
        }

        [Route("api/pokedex/getpokemon")]
        public async Task<GetPokedexDTO> GetPokemon(string name)
        {
            return await _pokedexService.GetPokemonAsync(name);
        }
    }
}
