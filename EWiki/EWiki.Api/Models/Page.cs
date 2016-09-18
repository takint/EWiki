using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public class Page : EntityBase
    {
        public int NameSpace { get; set; }
        public string Title { get; set; }
        public bool IsRedirect { get; set; }
        public bool IsNewPage { get; set; }
        /// <summary>
        /// Related to revision table
        /// </summary>
        public int? NewestContent { get; set; }
        public decimal PageLength { get; set; }
        public int? ContentLanguage { get; set; }

        /// <summary>
        /// Restrict may be are edit, view, create or add content, etc...
        /// </summary>
        public virtual ICollection<PageRestriction> PageRestrictions { get; set; }
        public virtual ICollection<PageLang> PageLangs { get; set; }
        public virtual ICollection<PageMeta> PageMetas { get; set; }
        public virtual ICollection<Revision> Revisions { get; set; }
    }
}
