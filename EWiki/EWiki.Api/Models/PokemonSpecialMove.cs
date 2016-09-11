namespace EWiki.Api.Models
{
    public class PokemonSpecialMove
    {
        public int CharacterId { get; set; }
        public Character Pokemon { get; set; }

        public int MoveId { get; set; }
        public Move PokeSpecialMove { get; set; }
    }
}
