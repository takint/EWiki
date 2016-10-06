using EWiki.Api.Models;
using System.Collections.Generic;
using EWiki.Api.Dto.Enum;

namespace EWiki.Api
{
    public class PokedexDto : BaseDto
    {
        public PokemonId PokemonId { get; set; }
        public string Name { get; set; }
        public string Slug { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public float Weight { get; set; }
        public float Height { get; set; }
        public int Stamina { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Candy { get; set; }
        public float CPGain { get; set; }
        public float MaxCP { get; set; }
        public string Description { get; set; }
        public string EvolveFrom { get; set; }
        public string EvolveFromAvatar { get; set; }
        public int PageObjectId { get; set; }

        // For pokemon Evolve To only map necessary info
        public string EvolveIntoNumbers { get; set; }
        public ICollection<ICollection<PokemonEvolveDto>> EvolveIntos { get; set; }

        // For pokemon Evolve From only map necessary info
        public string EvolveFromNumbers { get; set; }
        public ICollection<PokemonEvolveDto> EvolveFroms { get; set; }

        public WikiImage Avatar { get; set; }

        public ICollection<LocationDto> Locations { get; set; }
        public ICollection<MoveDto> NormalMoves { get; set; }
        public ICollection<MoveDto> SpecialMoves { get; set; }
        public string[] Types { get; set; }
    }

    // Use for both Evolve from and Evolve into
    public class PokemonEvolveDto
    {
        public int EvolveId { get; set; }
        public string EvolveName { get; set; }
        public string EvolveNumber { get; set; }
        public string EvolveDescription { get; set; }
        public string EvolveAvatar { get; set; }
    }
}
