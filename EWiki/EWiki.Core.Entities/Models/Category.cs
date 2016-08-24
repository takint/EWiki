using System.Collections.Generic;

namespace EWiki.Entities.Models
{
    public class Category : EntityBase
    {
        public string CatTitle { get; set; }
        public int CatPages { get; set; }
        public int NumberOfSubcat { get; set; }
    }
}
