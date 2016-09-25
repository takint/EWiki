using EWiki.Api.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public static class DataSeeder
    {
        private const string SYSADMIN_ROLE = "SysAdmin";
        private const string STANDARD_USER_ROLE = "StandardUser";

        // TODO: Move this code when seed data is implemented in EF 7

        /// <summary>
        /// This is a workaround for missing seed data functionality in EF 7.0-rc1
        /// More info: https://github.com/aspnet/EntityFramework/issues/629
        /// </summary>
        /// <param name="app">
        /// An instance that provides the mechanisms to get instance of the database context.
        /// </param>
        public static async Task SeedData(this IApplicationBuilder app)
        {
            var db = app.ApplicationServices.GetService(typeof(EWikiContext)) as EWikiContext;
            UserManager<User> userManager = app.ApplicationServices.GetService(typeof(UserManager<User>)) as UserManager<User>;
            RoleManager<IdentityRole> roleManager = app.ApplicationServices.GetService(typeof(RoleManager<IdentityRole>)) as RoleManager<IdentityRole>;

            // Initial credentials
            const string adminEmail = "sysadmin.ewiki@gmail.com";
            const string adminPassword = "^6^@.tb:1@*;1@G";
            const string adminName = "EwikiAdmin";
            const string adminRoleName = SYSADMIN_ROLE;

            // Initial roles
            string[] roles = new[] { STANDARD_USER_ROLE, SYSADMIN_ROLE };
            foreach (string roleName in roles)
            {
                IdentityRole role = await roleManager.FindByNameAsync(adminRoleName);
                if (role == null)
                {
                    role = new IdentityRole(roleName);
                    IdentityResult roleresult = await roleManager.CreateAsync(role);
                }
            }

            // Get Admin role
            IdentityRole adminRole = await roleManager.FindByNameAsync(adminRoleName);

            User user = await userManager.FindByNameAsync(adminName);
            if (user == null)
            {
                user = new User { UserName = adminName, Email = adminEmail, EmailConfirmed = true, LockoutEnabled = false };
                IdentityResult result = await userManager.CreateAsync(user, adminPassword);
            }

            // Add user admin to Role Admin if not already added
            IList<string> rolesForUser = await userManager.GetRolesAsync(user);
            if (!rolesForUser.Contains(adminRole.Name))
            {
                var result = userManager.AddToRoleAsync(user, adminRole.Name);
            }

            await db.SaveChangesAsync();
        }
    }
}
