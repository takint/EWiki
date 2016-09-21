using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class CharacterInfo : EntityBase
    {
        public string Name { get; set; }
        public int Priority { get; set; }
        public bool IsMain { get; set; }

        [ForeignKey("CharacterInfoGroupId")]
        public virtual CharacterInfoGroup CharacterInfoGroup { get; set; }
        public virtual ICollection<InfoValue> InfoValues { get; set; }
    }
}
