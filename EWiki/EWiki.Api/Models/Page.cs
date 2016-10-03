using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public class Page : EntityBase
    {
        public string Title { get; set; }
        public bool IsNewPage { get; set; }
        public string ContentLanguage { get; set; }
        public int ContentObjectId { get; set; }

        [ForeignKey("NewestContent")]
        public virtual PageContent CurrentContent { get; set; }

        [ForeignKey("FeatureImageId")]
        public virtual WikiImage FeaturesImage { get; set; }

        public virtual ICollection<PageRestriction> PageRestrictions { get; set; }
        public virtual ICollection<PageLang> PageLangs { get; set; }
        public virtual ICollection<PageMeta> PageMetas { get; set; }
    }
}
