using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class PageLang : Tracking
    {
        public int Id { get; set; }
        public int PageId { get; set; }
        public string Language { get; set; }
        public string Title { get; set; }

        public virtual Page LangPage { get; set; }
    }
}
