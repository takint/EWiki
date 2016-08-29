using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class UserNewtalk : EntityBase
    {
        public int UserId { get; set; }
        public string UserIp { get; set; }
        public DateTime UserLastSeen { get; set; }

        public virtual User UserSeen { get; set; }
    }
}
