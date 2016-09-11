using System.Collections.Generic;

namespace EWiki.Api.Models
{
    public class Category : EntityBase
    {
        public string CatTitle { get; set; }
        public string CatTitleVI { get; set; }
        public int? CatPages { get; set; }
        public int NumberOfSubcat { get; set; }

        public virtual ICollection<PokemonType> PokemoTypes { get; set; }
    }
}
