using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System;
using WikiApp.Entities.Models;

namespace WikiApp.DataAccess.Infrastructure.Identity
{
    public class WikiAppUserManager : UserManager<User>
    {
        public WikiAppUserManager(IUserStore<User> store)
            : base(store)
        {
    }

    public static WikiAppUserManager Create(IdentityFactoryOptions<WikiAppUserManager> options, IOwinContext context)
    {
        WikiAppIdentityContext wikiAppIdentityContext = context.Get<WikiAppIdentityContext>();
        WikiAppUserManager wikiAppUserManager = new WikiAppUserManager(new UserStore<User>(wikiAppIdentityContext));

        return wikiAppUserManager;
    }
}
}
