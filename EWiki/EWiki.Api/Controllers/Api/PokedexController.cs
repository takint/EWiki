using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using EWiki.Api.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        public async Task<IActionResult> Get(int skip = 0, int take = 10)
        {
            IEnumerable<Character> result = await pokedexRepository.GetAllWithAllIncludeAsync();

            result = result.OrderBy(r => r.Number)
                .Skip(skip)
                .Take(take);

            List<PokedexDto> responeData = result.Select(p => DtoMapper.MapPokedexDto(p)).ToList();

            return Json(responeData);
        }

        [HttpGet("GetPokemon")]
        public async Task<IActionResult> GetPokemon(string name)
        {
            Character pokemon = (await pokedexRepository.FindByAsync(p => p.Name == name)).FirstOrDefault();
            return Json(DtoMapper.MapPokedexDto(pokemon));
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchPokemon(string searchTerm)
        {
            IQueryable<Character> query = pokedexRepository.Queryable()
                .Where(c => c.Name.Contains(searchTerm) ||
                c.Description.Contains(searchTerm) ||
                c.Number.Contains(searchTerm));

            List<Character> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpGet("Update")]
        public async Task<IActionResult> UpdatePokemon(Character pokemon)
        {
            pokedexRepository.Update(pokemon);
            await pokedexRepository.CommitAsync();

            return Json(pokemon);
        }

        [HttpGet("Add")]
        public async Task<IActionResult> AddPokemon(Character pokemon)
        {
            pokedexRepository.Add(pokemon);
            await pokedexRepository.CommitAsync();

            return Json(pokemon);
        }
    }
}
