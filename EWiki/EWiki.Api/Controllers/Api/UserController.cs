using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("AllowEwikiBDOrigin")]
    public class UserController : Controller
    {
        private readonly IUserRepository userRepository;

        public UserController(IUserRepository repo)
        {
            userRepository = repo;
        }

        [HttpGet]
        public async Task<IActionResult> List(int skip = 0, int take = 10)
        {
            IEnumerable<User> userData = await userRepository.GetAllAsync();
            userData = userData.Skip(skip).Take(take);

            return Json(userData);
        }

        [HttpGet("GetUser")]
        public async Task<IActionResult> GetUser(string id)
        {
            User cat = (await userRepository.FindByAsync(p => p.Id == id)).FirstOrDefault();
            return Json(cat);
        }

        [HttpGet("Search")]
        public async Task<IActionResult> SearchUser(string searchTerm)
        {
            IQueryable<User> query = userRepository.Queryable()
                .Where(c => c.UserName.Contains(searchTerm));

            List<User> result = await query.ToListAsync();

            return Json(result);
        }

        [HttpPut("Update")]
        public async Task<IActionResult> UpdateUser(User user)
        {
            userRepository.Update(user);
            await userRepository.CommitAsync();

            return Json(user);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddUser(User user)
        {
            userRepository.Add(user);
            await userRepository.CommitAsync();

            return Json(user);
        }
    }
}
