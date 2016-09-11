namespace EWiki.Api.Models
{
    public class PokemonMove
    {
        public int CharacterId { get; set; }
        public Character Pokemon { get; set; }

        public int MoveId { get; set; }
        public Move PokeMove { get; set; }
    }
}
