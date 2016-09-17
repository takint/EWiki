using EWiki.Api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public interface IPageRepository : IRepository<Page>
    {
        Task<IEnumerable<Page>> GetAllPageWithContentAsync();
    }
}
