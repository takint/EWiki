using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Entities.Models
{
    public class CharacterInfo : EntityBase
    {
        public string Name { get; set; }
        public int Priority { get; set; }
        public bool IsMain { get; set; }
        public virtual ICollection<InfoValue> InfoValues { get; set; }
        public int CharacterId { get; set; }
        public virtual Character Character { get; set; }
        public int CharacterInfoGroupId { get; set; }
        public virtual CharacterInfoGroup CharacterInfoGroup { get; set; }
    }
}
