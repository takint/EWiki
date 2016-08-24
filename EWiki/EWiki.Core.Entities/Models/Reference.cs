using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EWiki.Models.Enums;

namespace EWiki.Entities.Models
{
    public class Reference : EntityBase
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public LinkTo LinkTo { get; set; }
        public int LinkToId { get; set; }
        public string UrlFormat { get; set; }
        public int Priority { get; set; }
    }
}
