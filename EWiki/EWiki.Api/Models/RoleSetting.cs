using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public class RoleSetting : EntityBase
    {
        public string RoleId { get; set; }
        public string SettingName { get; set; }
        public string SettingValue { get; set; }

        [ForeignKey("RoleId")]
        public virtual ApplicationRole Role { get; set; }
    }
}