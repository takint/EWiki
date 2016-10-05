using EWiki.Api.DataAccess;
using EWiki.Api.Models;
using EWiki.Api.TokenProvider;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using SimpleTokenProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Api
{
    public partial class Startup
    {
        // The secret key every token will be signed with.
        // Keep this safe on the server!
        private static readonly string secretKey = "mysupersecret_secretkey!123";

        private void ConfigureAuth(IApplicationBuilder app)
        {
            var signingKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secretKey));

            app.UseSimpleTokenProvider(new TokenProviderOptions
            {
                Path = "/api/token",
                Audience = "EWikiAudience",
                Issuer = "EWikiIssuer",
                SigningCredentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256),
                IdentityResolver = async (username, password) => await GetIdentity(username, password, app)
            });

            var tokenValidationParameters = new TokenValidationParameters
            {
                // The signing key must match!
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = signingKey,

                // Validate the JWT Issuer (iss) claim
                ValidateIssuer = true,
                ValidIssuer = "EWikiIssuer",

                // Validate the JWT Audience (aud) claim
                ValidateAudience = true,
                ValidAudience = "EWikiAudience",

                // Validate the token expiry
                ValidateLifetime = true,

                // If you want to allow a certain amount of clock drift, set that here:
                ClockSkew = TimeSpan.Zero
            };

            app.UseJwtBearerAuthentication(new JwtBearerOptions
            {
                AutomaticAuthenticate = true,
                AutomaticChallenge = true,
                TokenValidationParameters = tokenValidationParameters
            });

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AutomaticAuthenticate = true,
                AutomaticChallenge = true,
                AuthenticationScheme = "Cookie",
                CookieName = "access_token",
                TicketDataFormat = new CustomJwtDataFormat(
                    SecurityAlgorithms.HmacSha256,
                    tokenValidationParameters)
            });
        }

        private async Task<ClaimsIdentity> GetIdentity(string username, string password, IApplicationBuilder app)
        {
            UserManager<User> userManager = app.ApplicationServices.GetService(typeof(UserManager<User>)) as UserManager<User>;
            var db = app.ApplicationServices.GetService(typeof(EWikiContext)) as EWikiContext;

            // Find user by username
            User user = await userManager.FindByNameAsync(username);
            bool isValidPassowrd = await userManager.CheckPasswordAsync(user, password);

            if (isValidPassowrd)
            {
                string userData = string.Empty;
                var dbUser = userManager.Users.Include(x => x.Roles).FirstOrDefault(x => x.Id == user.Id);
                var firstUserRole = dbUser.Roles.FirstOrDefault();

                if (firstUserRole != null)
                {
                    ApplicationRole firstRole = db.Roles.Include(x => x.RoleSettings)
                        .FirstOrDefault(x => x.Id == firstUserRole.RoleId);

                    // Get user role settings
                    var userRoleSettings = firstRole.RoleSettings
                        .ToDictionary(x => x.SettingName, x => x.SettingValue);

                    Dictionary<string, Dictionary<string, string>> userDataDict = new Dictionary<string, Dictionary<string, string>>
                    {
                        { "RoleSettings", userRoleSettings }
                    };

                    userData = JsonConvert.SerializeObject(userDataDict);
                }

                return await Task.FromResult(new ClaimsIdentity(new GenericIdentity(username, "Token"), new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier, user.Id),
                    new Claim(ClaimTypes.Email, user.Email),
                    new Claim(ClaimTypes.Role, string.Join("|", user.Roles)),
                    new Claim(ClaimTypes.UserData, userData)
                }));
            }

            // Credentials are invalid, or account doesn't exist
            return await Task.FromResult<ClaimsIdentity>(null);
        }
    }
}
