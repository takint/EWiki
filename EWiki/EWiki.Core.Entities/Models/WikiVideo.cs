using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EWiki.Models.Enums;

namespace EWiki.Entities.Models
{
    public class WikiVideo : EntityBase
    {
        public string Title { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string Picture { get; set; }
        public int Priority { get; set; }
        public VideoType VideoType { get; set; }
    }
}
