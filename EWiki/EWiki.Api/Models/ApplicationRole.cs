using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System.Collections.Generic;

namespace EWiki.Api.Models
{
    public class ApplicationRole : IdentityRole
    {
        public ApplicationRole() : base()
        {
            RoleSettings = new List<RoleSetting>();
        }

        public ApplicationRole(string roleName) : base(roleName)
        {
        }

        public virtual ICollection<RoleSetting> RoleSettings { get; set; }
    }
}
