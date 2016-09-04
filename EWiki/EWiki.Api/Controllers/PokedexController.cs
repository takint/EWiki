using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    public class PokedexController : Controller
    {
        private readonly IPokedexRepository pokedexRepository;

        public PokedexController(IPokedexRepository repo)
        {
            pokedexRepository = repo;
        }

        [HttpGet]
        public async Task<JsonResult> Get()
        {
            IEnumerable<Character> result = await pokedexRepository.GetAllAsync();
            return Json(result);
        }

        [HttpGet("GetPokemon")]
        public async Task<JsonResult> GetPokemon(string name)
        {
            Character pokemon = (await pokedexRepository.FindByAsync(p => p.Name == name)).FirstOrDefault();
            return Json(pokemon);
        }
    }
}
