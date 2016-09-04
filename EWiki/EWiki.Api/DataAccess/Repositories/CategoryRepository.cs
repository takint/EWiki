using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class CategoryRepository : RepositoryBase<Category>, ICategoryRepository
    {
        public CategoryRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
