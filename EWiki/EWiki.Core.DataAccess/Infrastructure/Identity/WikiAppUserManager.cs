using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Infrastructure.Identity
{
    public class EWikiUserManager : UserManager<User>
    {
        public EWikiUserManager(IUserStore<User> store)
            : base(store)
        {
    }

    public static EWikiUserManager Create(IdentityFactoryOptions<EWikiUserManager> options, IOwinContext context)
    {
        EWikiIdentityContext EWikiIdentityContext = context.Get<EWikiIdentityContext>();
        EWikiUserManager EWikiUserManager = new EWikiUserManager(new UserStore<User>(EWikiIdentityContext));

        return EWikiUserManager;
    }
}
}
