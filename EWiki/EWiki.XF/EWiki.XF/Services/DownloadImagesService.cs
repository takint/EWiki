using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Service.Models.Enum;
using FFImageLoading;

namespace EWiki.XF.Services
{
    public class DownloadImagesService
    {
        public static async Task DownloadPokemonImages()
        {
            var tasks = new List<Task>();

            foreach (PokemonId pokemonId in Enum.GetValues(typeof(PokemonId)))
            {
                if (pokemonId == PokemonId.Missingno)
                {
                    continue;
                }

                var pokemonName = pokemonId.ToString();
                var pokemonNumber = "";
                for (var i = 0; i < 3 - ((int)pokemonId).ToString().Length; i++)
                {
                    pokemonNumber += "0";
                }
                pokemonNumber = $"{pokemonNumber}{(int) pokemonId}";

                var avatar = $"http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/{pokemonNumber}{pokemonName}.png";
                var avatar50x50 = $"http://res.cloudinary.com/ewiki-io/image/upload/c_scale,h_50,w_50/v1475134451/Pokemons/Avatars/{pokemonNumber}{pokemonName}.png";

                var task = Task.Run(() =>
                {
                    ImageService.Instance.LoadUrl(avatar).Preload();
                    ImageService.Instance.LoadUrl(avatar50x50).Preload();
                });

                tasks.Add(task);
            }

            await Task.WhenAll(tasks);
        }
    }
}
