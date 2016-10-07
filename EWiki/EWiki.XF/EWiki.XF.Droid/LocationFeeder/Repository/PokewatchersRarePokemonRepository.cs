using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using EWiki.XF.Droid.LocationFeeder.Common;
using EWiki.XF.Droid.LocationFeeder.Helper;
using Android.Util;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class PokeWatchersRarePokemonRepository : IRarePokemonRepository
    {
        //private const int timeout = 20000;

        private const string URL = "https://pokewatchers.com/grab/";
        public const string Channel = "PokeWatchers";

        public PokeWatchersRarePokemonRepository()
        {
        }

        public List<SniperInfo> FindAll()
        {
            try
            {
                var userAgent = UserAgentHelper.GetRandomUseragent();
                var  content = getContent(userAgent);
                return GetJsonList(content);
            }
            catch (Exception e)
            {
                return FallbackFindAll();
            }
        }


        public List<SniperInfo> FallbackFindAll()
        {
            try
            {
                var userAgent = UserAgentHelper.GetRandomUseragent();
                var content = getContent(userAgent);
                var cookie = CreateCookie(content);
                if (cookie != null)
                {
                    content = getContent(userAgent, cookie);
                    return GetJsonList(content);
                }
                else
                {
                    Log.Debug("", "Could find a cookie for PokeWatchers");
                }
            }
            catch (Exception e)
            {
                Log.Debug("Pokewatchers API error: {0}", e.Message);
            }
            return null;
        }

        private string CreateCookie(string content)
        {
            var match = Regex.Match(content, @"<script>(1?.*)<\/script>");
            if (match.Success)
            {
                var script = match.Groups[1].Value;
                var replace = Regex.Replace(script, @"e\(r\)",
                    @"e(r.replace('document.cookie', 'F' ).replace('location.reload();', '' ))");
                replace += "WScript.Echo (F);";
                var tempFileName = Path.GetTempPath() + $"{DateTime.Now.Millisecond}_pokefeeder.js";

                using (StreamWriter sw = new StreamWriter(tempFileName))
                {
                    sw.WriteLine(replace);
                }
                var cookieText = ExecuteAndRead(tempFileName);
                return cookieText;
            }
            return null;
        }

        private string getContent(string userAgent, string cookieText = null)
        {
            var request = WebRequest.CreateHttp(URL);

            request.UserAgent = userAgent;
            request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";
            request.Method = "GET";
            request.Timeout = 15000;
            request.Host = "pokewatchers.com";
            request.ReadWriteTimeout = 32000;

            if (cookieText != null)
            {
                cookieText = cookieText.Replace("\r", "").Replace("\n", "");
                var cookieMonster = new CookieContainer();
                var cookies = cookieText.Split(';');
                foreach (var cookie in cookies)
                {
                    var matcher = Regex.Match(cookie, @"(1?sucuri.*)\s?=\s?(2?.*)");
                    if (matcher.Success)
                    {
                        cookieMonster.Add(new Cookie(matcher.Groups[1].Value,
                            matcher.Groups[2].Value,
                            "/",
                            "pokewatchers.com"));
                    }
                }
                request.CookieContainer = cookieMonster;
            }
            using (var resp = request.GetResponse())
            {
                using (var reader = new StreamReader(resp.GetResponseStream()))
                {
                    var content = reader.ReadToEnd();
                    return content;
                }
            }
        }

        private string ExecuteAndRead(string filePath)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo();
            Process p = new Process();

            startInfo.CreateNoWindow = true;
            startInfo.RedirectStandardOutput = true;
            startInfo.RedirectStandardInput = true;

            startInfo.UseShellExecute = false;
            startInfo.Arguments = $"//NoLogo {filePath}";
            startInfo.FileName = "Cscript";

            p.StartInfo = startInfo;
            p.Start();

            p.WaitForExit();
            var output = p.StandardOutput.ReadToEnd();

            return output;
        }

        private List<SniperInfo> GetJsonList(string reader)
        {
            var results = JsonConvert.DeserializeObject<List<PokewatchersResult>>(reader, new JsonSerializerSettingsCultureInvariant());
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

        private SniperInfo Map(PokewatchersResult result)
        {
            var sniperInfo = new SniperInfo();
            var pokemonId = PokemonParser.ParsePokemon(result.name);
            sniperInfo.PokemonId = pokemonId;
            var geoCoordinates = GeoCoordinatesParser.ParseGeoCoordinates(result.coords);
            if (geoCoordinates == null)
            {
                return null;
            }
            sniperInfo.Latitude = Math.Round(geoCoordinates.Latitude, 7);
            sniperInfo.Longitude = Math.Round(geoCoordinates.Longitude, 7);

            var timeStamp = DateTime.Now.AddTicks(result.until);
            sniperInfo.ExpirationTimestamp = DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) < timeStamp ? 
                DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) : timeStamp;
            sniperInfo.ChannelInfo = new ChannelInfo { server = Channel };

            sniperInfo.IV = Convert.ToDouble(result.IV);

            return sniperInfo;
        }
    }


    internal class PokewatchersResult
    {

        [JsonProperty("pokemon")]
        public string name { get; set; }

        [JsonProperty("cords")]
        public string coords { get; set; }

        [JsonProperty("timeend")]
        public long until { get; set; }

        [JsonProperty("icon")]
        public string icon { get; set; }

        [JsonProperty("iv")]
        public string IV { get; set; }

        [JsonProperty("move1")]
        public string Move1 { get; set; }

        [JsonProperty("move2")]
        public string Move2 { get; set; }
    }

}
