using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("AllowEwikiBDOrigin")]
    public class WikiImageController : Controller
    {
        private readonly IWikiImageRepository imageRepository;

        public WikiImageController(IWikiImageRepository repo)
        {
            imageRepository = repo;
        }

        [HttpGet]
        public async Task<IActionResult> List(int skip = 0, int take = 10)
        {
            IEnumerable<WikiImage> imageData = await imageRepository.GetAllAsync();

            imageData = imageData
                        .OrderBy(img => img.ImageName)
                        .Skip(skip)
                        .Take(take);

            return Json(imageData);
        }

        [HttpGet("GetWikiImage")]
        public async Task<IActionResult> GetWikiImage(int imgId)
        {
            WikiImage cat = (await imageRepository.FindByAsync(p => p.Id == imgId)).FirstOrDefault();
            return Json(cat);
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchWikiImage(string searchTerm)
        {
            IQueryable<WikiImage> query = imageRepository.Queryable()
                .Where(c => c.ImageName.Contains(searchTerm) ||
                            c.ImageDescription.Contains(searchTerm) || 
                            c.ImageMediaType.Contains(searchTerm));

            List<WikiImage> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpPost("Update")]
        public async Task<IActionResult> UpdateWikiImage(WikiImage image)
        {
            imageRepository.Update(image);
            await imageRepository.CommitAsync();

            return Json(image);
        }

        [HttpPost("Add")]
        [EnableCors("AllowEwikiBDOrigin")]
        public async Task<IActionResult> AddWikiImage(WikiImage image)
        {
            imageRepository.Add(image);
            await imageRepository.CommitAsync();

            return Json(image);
        }
    }
}
