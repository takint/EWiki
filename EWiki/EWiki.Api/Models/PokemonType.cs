namespace EWiki.Api.Models
{
    public class PokemonType
    {
        public int CharacterId { get; set; }
        public Character Pokemon { get; set; }

        public int TypeId { get; set; }
        public Category Type { get; set; }
    }
}
