using EWiki.Api.Models;
using System;
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
        public string EvolveIntos { get; set; }
        public string[] EvolveIntoAvatars { get; set; }
        public int EvolveFromId { get; set; }
        public string EvolveFrom { get; set; }
        public string EvolveFromAvatar { get; set; }

        public WikiImage Avatar { get; set; }

        public ICollection<LocationDto> Locations { get; set; }
        public ICollection<MoveDto> NormalMoves { get; set; }
        public ICollection<MoveDto> SpecialMoves { get; set; }
        public string[] Types { get; set; }
    }
}
