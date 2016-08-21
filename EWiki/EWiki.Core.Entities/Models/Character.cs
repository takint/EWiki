using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class Character : EntityBase
    {
        public string Name { get; set; }
        public string Slug { get; set; }
        public virtual ICollection<WikiImage> Avatars { get; set; }
        public virtual ICollection<CharacterInfoGroup> CharacterInfoGroups { get; set; }
        public virtual ICollection<CharacterSectionGroup> CharacterSectionGroups { get; set; }
        public virtual ICollection<Reference> References { get; set; }
        public virtual ICollection<WikiImage> Images { get; set; }
        public virtual ICollection<WikiVideo> Videos { get; set; }
    }
}
