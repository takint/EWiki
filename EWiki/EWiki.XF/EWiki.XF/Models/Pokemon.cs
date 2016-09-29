using EWiki.XF.Service.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Models
{
    public class Pokemon
    {
        public PokemonId Id { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string Description { get; set; }
        public float MaxCP { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public List<TypeSM> Types { get; set; }
        public bool IsEven { get; set; }
    }
}
