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
    public class ArticleController : Controller
    {
        private readonly IPageRepository pageRepository;

        public ArticleController(IPageRepository repo)
        {
            pageRepository = repo;
        }

        [HttpGet]
        public async Task<IActionResult> List(int skip = 0, int take = 10)
        {
            IEnumerable<Page> pageData = await pageRepository.GetAllPageWithContentAsync();
            pageData = pageData.Skip(skip).Take(take);

            return Json(pageData);
        }

        [HttpGet("GetCategory")]
        public async Task<IActionResult> GetCategory(int catId)
        {
            Page cat = (await pageRepository.FindByAsync(p => p.Id == catId)).FirstOrDefault();
            return Json(cat);
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchCategory(string searchTerm)
        {
            IQueryable<Page> query = pageRepository.Queryable()
                .Where(c => c.Title.Contains(searchTerm));

            List<Page> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpGet("Update")]
        public async Task<IActionResult> UpdateCategory(Page page)
        {
            pageRepository.Update(page);
            await pageRepository.CommitAsync();

            return Json(page);
        }

        [HttpGet("Add")]
        public async Task<IActionResult> AddCategory(Page page)
        {
            pageRepository.Add(page);
            await pageRepository.CommitAsync();

            return Json(page);
        }
    }
}
