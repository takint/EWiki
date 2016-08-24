using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace EWiki.Entities.Models
{
    public class User : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        /// <summary>
        /// The last time a user made a change on the site, 
        /// including logins, changes to pages (any namespace), 
        /// watchlistings, and preference changes.
        /// </summary>
        public string UserTouched { get; set; }
        public DateTime JoinedDate { get; set; }
        public int? UserEditcount { get; set; }
        public bool IsActived { get; set; }

        public virtual ICollection<Archive> Archives { get; set; }
        public virtual ICollection<FileArchive> FileArchives { get; set; }
        public virtual ICollection<WikiImage> Images { get; set; }
        public virtual ICollection<BlockedIp> BlockedIPs { get; set; }
        public virtual ICollection<ProtectedTitle> ProtectedTitles { get; set; }
        public virtual ICollection<Revision> Revisions { get; set; }
        public virtual ICollection<UserNewtalk> UserNewTalks { get; set; }
        public virtual ICollection<WatchList> WatchLists { get; set; }
        public virtual ICollection<RecentChange> RecentChanges { get; set; }
        public virtual ICollection<UserMeta> UserMetas { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager, string authenticationType)
        {
            ClaimsIdentity userIdentity = await manager.CreateIdentityAsync(this, authenticationType);

            // Add custom user claims here
            return userIdentity;
        }
    }
}
