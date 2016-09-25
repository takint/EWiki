using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class RepositoryBase<TEntity> : GenericRepositoryBase<TEntity, int> where TEntity : class, IEntity, new()
    {
        public RepositoryBase(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
