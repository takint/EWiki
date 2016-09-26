using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace EWiki.Api.Models
{
    public class User : IdentityUser, IGenericEntity<string>
    {

    }
}
