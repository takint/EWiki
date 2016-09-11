using System.Collections.Generic;

namespace EWiki.XF.Service.Models
{
    public class PokemonSM
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float MaxCP { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public List<TypeSM> Types { get; set; }
    }
}
