using EWiki.Api.Models;

namespace EWiki.Api.DataAccess
{
    public class UserRepository : GenericRepositoryBase<User, string>, IUserRepository
    {
        public UserRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }
    }
}
