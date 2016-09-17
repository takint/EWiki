using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class PageLang : EntityBase
    {
        public int PageId { get; set; }
        public string Language { get; set; }
        public string Title { get; set; }
    }
}
