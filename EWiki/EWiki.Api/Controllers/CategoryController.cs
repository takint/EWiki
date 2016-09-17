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
    public class CategoryController : Controller
    {
        private readonly ICategoryRepository categoryRepository;

        public CategoryController(ICategoryRepository repo)
        {
            categoryRepository = repo;
        }

        [HttpGet]
        public async Task<IActionResult> List(int skip = 0, int take = 10)
        {
            IEnumerable<Category> result = await categoryRepository.GetAllAsync();
            result = result.Skip(skip).Take(take);

            return Json(result);
        }

        [HttpGet("GetCategory")]
        public async Task<IActionResult> GetCategory(int catId)
        {
            Category cat = (await categoryRepository.FindByAsync(p => p.Id == catId)).FirstOrDefault();
            return Json(cat);
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchCategory(string searchTerm)
        {
            IQueryable<Category> query = categoryRepository.Queryable()
                .Where(c => c.CatTitle.Contains(searchTerm) ||
                c.CatTitleVI.Contains(searchTerm));

            List<Category> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpGet("Update")]
        public async Task<IActionResult> UpdateCategory(Category category)
        {
            categoryRepository.Update(category);
            await categoryRepository.CommitAsync();

            return Json(category);
        }

        [HttpGet("Add")]
        public async Task<IActionResult> AddCategory(Category category)
        {
            categoryRepository.Add(category);
            await categoryRepository.CommitAsync();

            return Json(category);
        }
    }
}
