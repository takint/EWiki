using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using EWiki.Api.Models;
using EWiki.Api.DataAccess;
using Microsoft.Data.Entity;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    public class PokedexController : Controller
    {
        [HttpGet]
        public async Task<JsonResult> GetPokedex()
        {
            EWikiContext _db = new EWikiContext();
            List<Pokedex> result = await _db.Pokedexes.ToListAsync();
            return new JsonResult(result);
        }

        [HttpGet("{id}")]
        public JsonResult GetPokemon(string name)
        {
            return new JsonResult(new Pokedex());
        }
    }
}
