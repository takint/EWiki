using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class PageMeta : EntityBase
    {
        public int PageId { get; set; }
        public string MetaKey { get; set; }
        public string MetaValue { get; set; }

        public virtual Page PageInUse { get; set; }
    }
}
