using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public class Location : EntityBase
    {
        public string Name { get; set; }
        public string Description { get; set; }

        [ForeignKey("LocationType")]
        public virtual Category Type { get; set; }
        public virtual ICollection<PokemonLocation> PokemonLocations { get; set; }
    }
}
