using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Entities.Models
{
    public class CharacterSection : EntityBase
    {
        public string Title { get; set; }
        public string Slug { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public int Priority { get; set; }
        public int CharacterId { get; set; }
        public virtual Character Character { get; set; }
        public int CharacterSectionGroupId { get; set; }
        public virtual CharacterSectionGroup CharacterSectionGroup { get; set; }
    }
}
