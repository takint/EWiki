using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class WatchList : EntityBase
    {
        public int UserId { get; set; }
        public int NameSpace { get; set; }
        public string WatchTitle { get; set; }

        public virtual User WatchedUser { get; set; }
    }
}
