using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class LocationRepository : RepositoryBase<Location>, ILocationRepository
    {
        public LocationRepository(IDbFactory dbFactory)
            : base(dbFactory)
        { }
    }
}
