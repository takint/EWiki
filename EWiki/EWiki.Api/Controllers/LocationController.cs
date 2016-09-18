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
    public class LocationController : Controller
    {
        private readonly ILocationRepository locationRepository;

        public LocationController(ILocationRepository repo)
        {
            locationRepository = repo;
        }

        [HttpGet]
        public async Task<IActionResult> List(int skip = 0, int take = 10)
        {
            IEnumerable<Location> result = await locationRepository.AllIncludingAsync(c => c.Type);
            result = result.OrderBy(r => r.Name)
                .Skip(skip)
                .Take(take);

            return Json(result);
        }

        [HttpGet("GetLocation")]
        public async Task<IActionResult> GetLocation(int locationId)
        {
            Location locate = (await locationRepository.FindByAsync(p => p.Id == locationId)).FirstOrDefault();
            return Json(locate);
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchLocation(string searchTerm)
        {
            IQueryable<Location> query = locationRepository.Queryable()
                .Include(c => c.Type)
                .Where(c => c.Name.Contains(searchTerm) ||
                c.Description.Contains(searchTerm) ||
                c.Type.CatTitle.Contains(searchTerm) ||
                c.Type.CatTitleVI.Contains(searchTerm));

            List<Location> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpGet("Update")]
        public async Task<IActionResult> UpdateLocation(Location location)
        {
            locationRepository.Update(location);
            await locationRepository.CommitAsync();

            return Json(location);
        }

        [HttpGet("Add")]
        public async Task<IActionResult> AddLocation(Location location)
        {
            locationRepository.Add(location);
            await locationRepository.CommitAsync();

            return Json(location);
        }
    }
}
