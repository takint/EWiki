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
        private readonly IPageRepository pageRepository;

        public PokedexController(IPokedexRepository pokedexRepo, IPageRepository pageRepo)
        {
            pokedexRepository = pokedexRepo;
            pageRepository = pageRepo;
        }

        [HttpGet]
        public async Task<IActionResult> Get(int skip = 0, int take = 10, string lang = "en")
        {
            IEnumerable<Character> result = await pokedexRepository.GetAllWithAllIncludeAsync(skip, take);

            if (lang != Language.ENGLISH)
            {
                foreach (Character c in result)
                {
                    c.InfoContents = await pageRepository.Queryable()
                        .Include(p => p.CurrentContent)
                        .Where(p => p.ContentObjectId == c.InfoContentId && p.ContentLanguage == lang)
                        .ToListAsync();
                }
            }

            List<PokedexDto> responeData = result.Select(p => DtoMapper.MapPokedexDto(p)).ToList();

            return Json(responeData);
        }

        [HttpGet("GetPokemon")]
        public async Task<IActionResult> GetPokemon(int id, string name, string number)
        {
            Character pokemon = null;

            if (id != 0)
            {
                pokemon = await pokedexRepository.GetSingleAsync(id);
            }
            else if (!string.IsNullOrEmpty(name))
            {
                pokemon = (await pokedexRepository.FindByAsync(p => p.Name.Contains(name))).SingleOrDefault();
            }
            else if (!string.IsNullOrEmpty(number))
            {
                pokemon = (await pokedexRepository.FindByAsync(p => p.Number.Contains(number))).SingleOrDefault();
            }
            
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
