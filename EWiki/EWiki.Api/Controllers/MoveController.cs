using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    public class MoveController : Controller
    {
        private readonly IMoveRepository moveRepository;

        public MoveController(IMoveRepository repo)
        {
            moveRepository = repo;
        }

        [HttpGet]
        public async Task<JsonResult> Get(int skip = 0, int take = 10)
        {
            IEnumerable<Move> result = await moveRepository.AllIncludingAsync(c => c.Type);
            result = result.Skip(skip).Take(take);

            return Json(result);
        }

        [HttpGet("GetMove")]
        public async Task<JsonResult> GetMove(int moveId)
        {
            Move move = (await moveRepository.FindByAsync(p => p.Id == moveId)).FirstOrDefault();
            return Json(move);
        }

        [HttpGet("Search")]
        public async Task<JsonResult> SearchMove(string searchTerm)
        {
            IQueryable<Move> query = moveRepository.Queryable()
                .Where(c => c.Name.Contains(searchTerm));

            List<Move> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpGet("Update")]
        public async Task<JsonResult> UpdateMove(Move move)
        {
            moveRepository.Update(move);
            await moveRepository.CommitAsync();

            return Json(move);
        }

        [HttpGet("Add")]
        public async Task<JsonResult> AddPokemon(Move move)
        {
            moveRepository.Add(move);
            await moveRepository.CommitAsync();

            return Json(move);
        }
    }
}
