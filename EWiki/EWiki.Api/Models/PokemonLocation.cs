namespace EWiki.Api.Models
{
    public class PokemonLocation
    {
        public int CharacterId { get; set; }
        public Character Pokemon { get; set; }

        public int LocationId { get; set; }
        public Location PokeLocation { get; set; }
    }
}
