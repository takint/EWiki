using System;
using System.Collections.Generic;
using System.Text;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Droid.LocationFeeder.Common
{
    public class PokemonFilterToBinary
    {

        public static string ToBinary(List<PokemonId> pokemonIds)
        {
            StringBuilder stringBuilder = new StringBuilder();
            foreach (PokemonId pokemonId in Enum.GetValues(typeof(PokemonId)))
            {
                stringBuilder.Append(pokemonIds.Contains(pokemonId) ? "1" : "0");
            }
            return stringBuilder.ToString();
        }

        public static string ToBinary()
        {
            throw new NotImplementedException();
        }
    }
}