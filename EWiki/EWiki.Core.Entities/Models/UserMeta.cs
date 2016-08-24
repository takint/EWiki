using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class UserMeta : EntityBase
    {
        public int UserId { get; set; }
        public string MetaKey { get; set; }
        public string MetaValue { get; set; }

        public virtual User UserInUse { get; set; }
    }
}
