using System;
using System.Collections.Generic;
using System.Net.Http;
using Newtonsoft.Json;
using EWiki.XF.Droid.LocationFeeder.Helper;
using Android.Util;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class PokeSnipeRarePokemonRepository : IRarePokemonRepository
    {
        //private const int timeout = 20000;

        private const string URL = "http://pokeapi.pokesnipe.de/";
        public const string Channel = "pokesnipe.de";

        public PokeSnipeRarePokemonRepository()
        {
        }

        public List<SniperInfo> FindAll()
        {
            try
            {
                using (var client = new HttpClient())
                {

                    var content = client.GetStringAsync(URL).Result;
                    return GetJsonList(content);
                }
            }
            catch (Exception e)
            {
                Log.Debug("Pokesnipe API error: {0}", e.Message);
                return null;
            }
        }

        public string GetChannel()
        {
            return Channel;
        }

        private List<SniperInfo> GetJsonList(string reader)
        {
            var results = JsonConvert.DeserializeObject<List<PokeSnipeResult>>(reader, new JsonSerializerSettingsCultureInvariant());
            var list = new List<SniperInfo>();
            foreach (var result in results)
            {
                var sniperInfo = Map(result);
                if (sniperInfo != null)
                {
                    list.Add(sniperInfo);
                }
            }
            return list;
        }

        private SniperInfo Map(PokeSnipeResult result)
        {
            var sniperInfo = new SniperInfo();
            var pokemonId = PokemonParser.ParsePokemon(result.name);
            sniperInfo.PokemonId = pokemonId;
            sniperInfo.Latitude = result.lat;
            sniperInfo.Longitude = result.lon;
            sniperInfo.IV = Convert.ToDouble(result.IV);

            sniperInfo.ChannelInfo = new ChannelInfo { server = Channel };
            return sniperInfo;
        }
    }


    internal class PokeSnipeResult
    {

        [JsonProperty("name")]
        public string name { get; set; }

        [JsonProperty("lat")]
        public double lat { get; set; }

        [JsonProperty("lon")]
        public double lon { get; set; }

        [JsonProperty("IV")]
        public string IV { get; set; }
    }

}
