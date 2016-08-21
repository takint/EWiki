using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class ProtectedTitle : EntityBase
    {
        public int NameSpace { get; set; }
        public string Title { get; set; }
        public int? UserId { get; set; }
        public string ProtectReason { get; set; }
        public decimal ProtectExpiry { get; set; }

        public virtual User UserProtected { get; set; }
    }
}
