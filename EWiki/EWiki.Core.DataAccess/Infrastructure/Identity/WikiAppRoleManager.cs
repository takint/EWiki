using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;

namespace EWiki.DataAccess.Infrastructure.Identity
{
    public class EWikiRoleManager : RoleManager<IdentityRole>
    {
        public EWikiRoleManager(IRoleStore<IdentityRole, string> roleStore)
            : base(roleStore)
        {
        }

        public static EWikiRoleManager Create(IdentityFactoryOptions<EWikiRoleManager> options, IOwinContext context)
        {
            EWikiRoleManager EWikiRoleManager = new EWikiRoleManager(new RoleStore<IdentityRole>(context.Get<EWikiIdentityContext>()));

            return EWikiRoleManager;
        }
    }
}
