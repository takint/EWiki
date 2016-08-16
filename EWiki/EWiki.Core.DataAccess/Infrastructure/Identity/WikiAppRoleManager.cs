using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;

namespace WikiApp.DataAccess.Infrastructure.Identity
{
    public class WikiAppRoleManager : RoleManager<IdentityRole>
    {
        public WikiAppRoleManager(IRoleStore<IdentityRole, string> roleStore)
            : base(roleStore)
        {
        }

        public static WikiAppRoleManager Create(IdentityFactoryOptions<WikiAppRoleManager> options, IOwinContext context)
        {
            WikiAppRoleManager wikiAppRoleManager = new WikiAppRoleManager(new RoleStore<IdentityRole>(context.Get<WikiAppIdentityContext>()));

            return wikiAppRoleManager;
        }
    }
}
