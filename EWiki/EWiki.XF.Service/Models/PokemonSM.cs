using System.Collections.Generic;
using EWiki.XF.Service.Models.Enum;

namespace EWiki.XF.Service.Models
{
    public class PokemonSM
    {
        public PokemonId Id { get; set; }
        public string Name => Id.ToString();
        public string Avatar => $"No_{Name}";
        public string Description { get; set; }
        public float MaxCP { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Stamina { get; set; }
        public List<TypeSM> Types { get; set; }
    }
}
