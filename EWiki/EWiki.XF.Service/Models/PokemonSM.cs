using System.Collections.Generic;
using System.Collections.ObjectModel;
using EWiki.XF.Service.Models.Enum;
using Newtonsoft.Json;

namespace EWiki.XF.Service.Models
{
    public class PokemonSM
    {
        public PokemonId PokemonId { get; set; }
        public string Name => PokemonId.ToString();
        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)PokemonId).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)PokemonId}";
            }
        }
        [JsonIgnore]
        public string Avatar => $"http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/{Number}{Name}.png";
        public string Avatar50x50 => $"http://res.cloudinary.com/ewiki-io/image/upload/c_scale,h_50,w_50/v1475134451/Pokemons/Avatars/{Number}{Name}.png";
        public string Description { get; set; }
        public double MaxCP { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public double Weight { get; set; }
        public double Height { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Stamina { get; set; }
        public string[] Types { get; set; }
        public ObservableCollection<MoveSM> NormalMoves { get; set; }
        public ObservableCollection<MoveSM> SpecialMoves { get; set; }
        public ObservableCollection<LocationSM> Locations { get; set; }
        public string[] EvolveIntoAvatars { get; set; }
        public string EvolveFromAvatar { get; set; }
    }
}
