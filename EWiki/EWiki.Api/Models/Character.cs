using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class Character : EntityBase
    {
        public string Name { get; set; }
        public string Slug { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public float? Weight { get; set; }
        public float? Height { get; set; }
        public int? Stamina { get; set; }
        public int? Attack { get; set; }
        public int? Defense { get; set; }
        public int? Candy { get; set; }
        public float? CPGain { get; set; }
        public float? MaxCP { get; set; }
        public string Description { get; set; }
        public string EvolveIntos { get; set; }

        [ForeignKey("EvolveFromId")]
        public virtual Character EvolveFrom { get; set; }
        [ForeignKey("AvatarImageId")]
        public virtual WikiImage Avatar { get; set; }
        // Location get from location data based on type
        public virtual ICollection<PokemonLocation> Locations { get; set; }
        public virtual ICollection<PokemonMove> NormalMoves { get; set; }
        public virtual ICollection<PokemonSpecialMove> SpecialMoves { get; set; }
        public virtual ICollection<Character> EvolveInto { get; set; }
        public virtual ICollection<PokemonType> Types { get; set; }
    }
}
