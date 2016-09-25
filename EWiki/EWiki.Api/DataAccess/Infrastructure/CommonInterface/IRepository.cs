using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public interface IRepository<T> : IGenericRepository<T, int> where T : class, IEntity, new()
    {

    }
}
