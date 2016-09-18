using System;
using System.Collections.Generic;
using System.Net.Http;
using CloudFlareUtilities;
using Newtonsoft.Json;
using EWiki.XF.Droid.LocationFeeder.Common;
using EWiki.XF.Droid.LocationFeeder.Helper;
using Android.Util;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class PokeSnipersRarePokemonRepository : IRarePokemonRepository
    {
        //private const int timeout = 20000;

        private const string URL = "http://www.pokesnipers.com/api/v1/pokemon.json?referrer=home";
        public const string Channel = "Pokesnipers";

        public PokeSnipersRarePokemonRepository()
        {
        }

        public List<SniperInfo> FindAll()
        {
            try
            {
                var handler = new ClearanceHandler();

                // Create a HttpClient that uses the handler.
                using (var client = new HttpClient(handler))
                {

                    // Use the HttpClient as usual. Any JS challenge will be solved automatically for you.
                    var content = client.GetStringAsync(URL).Result;
                    return GetJsonList(content);
                }
            }
            catch (Exception e)
            {
                Log.Debug("Pokesnipers API error: {0}", e.Message);
                return null;
            }
        }

        public string GetChannel()
        {
            return Channel;
        }

        private List<SniperInfo> GetJsonList(string reader)
        {
            var wrapper = JsonConvert.DeserializeObject<Wrapper>(reader, new JsonSerializerSettingsCultureInvariant());
            var list = new List<SniperInfo>();
            foreach (var result in wrapper.results)
            {
                var sniperInfo = Map(result);
                if (sniperInfo != null)
                {
                    list.Add(sniperInfo);
                }
            }
            return list;
        }

        private SniperInfo Map(Result result)
        {
            var sniperInfo = new SniperInfo();
            var pokemonId = PokemonParser.ParsePokemon(result.name);
            sniperInfo.Id = pokemonId;
            var geoCoordinates = GeoCoordinatesParser.ParseGeoCoordinates(result.coords);
            if (geoCoordinates == null)
            {
                return null;
            }
            sniperInfo.Latitude = Math.Round(geoCoordinates.Latitude, 7);
            sniperInfo.Longitude = Math.Round(geoCoordinates.Longitude, 7);

            var timeStamp = Convert.ToDateTime(result.until);
            sniperInfo.ExpirationTimestamp = DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) < timeStamp ?
                DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) : timeStamp;

            sniperInfo.ChannelInfo = new ChannelInfo { server = Channel };
            sniperInfo.IV = Convert.ToDouble(result.IV);
            return sniperInfo;
        }
    }


    internal class Result
    {
        [JsonProperty("id")]
        public long id { get; set; }

        [JsonProperty("name")]
        public string name { get; set; }

        [JsonProperty("coords")]
        public string coords { get; set; }

        [JsonProperty("until")]
        public string until { get; set; }

        [JsonProperty("icon")]
        public string icon { get; set; }

        [JsonProperty("iv")]
        public string IV { get; set; }

        [JsonProperty("attacks")]
        public string[] Attacks { get; set; }
    }

    internal class Wrapper
    {
        [JsonProperty("results")]
        public List<Result> results { get; set; }
    }
}
