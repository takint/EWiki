using System.Collections.Generic;
using EWiki.XF.Service.Models.Enum;

namespace EWiki.XF.Service.Models
{
    public class PokemonSM
    {
        public PokemonId Id { get; set; }
        public string Name => Id.ToString();
        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)Id).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)Id}";
            }
        }
        public string Avatar => $"http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/{Number}{Name}.png";
        public string Avatar50x50 => $"http://res.cloudinary.com/ewiki-io/image/upload/c_scale,h_50,w_50/v1475134451/Pokemons/Avatars/{Number}{Name}.png";
        public string Description { get; set; }
        public float MaxCP { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Stamina { get; set; }
        public List<TypeSM> Types { get; set; }
    }
}
