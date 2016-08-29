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
        public int? EvolveFromId { get; set; }

        [ForeignKey("EvolveFromId")]
        virtual public Character EvolveFrom { get; set; }
        // Location get from location data based on type
        virtual public ICollection<Location> Locations { get; set; }
        virtual public ICollection<Move> NormalMoves { get; set; }
        virtual public ICollection<Move> SpecialMoves { get; set; }
        virtual public ICollection<Character> EvolveInto { get; set; }
        virtual public ICollection<Category> Types { get; set; }
        public virtual ICollection<WikiImage> Avatars { get; set; }
        public virtual ICollection<CharacterInfoGroup> CharacterInfoGroups { get; set; }
        public virtual ICollection<CharacterSectionGroup> CharacterSectionGroups { get; set; }
        public virtual ICollection<Reference> References { get; set; }
        public virtual ICollection<WikiImage> Images { get; set; }
        public virtual ICollection<WikiVideo> Videos { get; set; }
    }
}
