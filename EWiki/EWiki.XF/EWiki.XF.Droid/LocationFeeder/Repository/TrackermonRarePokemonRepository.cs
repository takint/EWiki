﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using EWiki.XF.Droid.LocationFeeder.Common;
using EWiki.XF.Droid.LocationFeeder.Helper;
using EWiki.XF.Models.Enum;
using Android.Util;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class TrackemonRarePokemonRepository : IRarePokemonRepository
    {
        private const int Timeout = 20000;
        public const string Channel = "Trackemon";
        private readonly List<PokemonId> _pokemonIdsToFind;

        public TrackemonRarePokemonRepository()
        {
            this._pokemonIdsToFind = RarePokemonsFactory.CreateRarePokemonList();
        }

        public List<SniperInfo> FindAll()
        {
            var session = FindSessionId();
            if (session == null || !session.Validate())
            {
                session = FindSessionId();
                if (session == null)
                {
                    Log.Debug("", "Trackemon: No valid session found!");
                    return null;
                }
            }
            var list = new List<SniperInfo>();

            var pokemonTypeIdPartitions = _pokemonIdsToFind.Partition(5);
            foreach (var partition in pokemonTypeIdPartitions)
            {
                var resultList = FindSubSetOfPokemon(partition, session);
                if (resultList != null)
                {
                    list.AddRange(resultList);
                }
            }

            return list;
        }

        private static List<SniperInfo> FindSubSetOfPokemon(List<PokemonId> pokemomnIds, TrackemonSession session)
        {
            var pokemonTypeIds = BuildPokemonTypeIds(pokemomnIds);
            var list = new List<SniperInfo>();

            string URL =
                $"https://www.trackemon.com/fetch/rare?pokedexTypeId={pokemonTypeIds}&sessionId={session.sessionId}";
            try
            {
                var request = WebRequest.CreateHttp(URL);
                request.Accept = "*/*";
                request.Method = "GET";
                request.Timeout = Timeout;
                request.Headers.Add("Cookie:" + session.cookieHeader);
                using (var response = request.GetResponse())
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        var resultList = JsonConvert.DeserializeObject<List<TrackemonResult>>(reader.ReadToEnd());
                        foreach (var result in resultList)
                        {
                            var sniperInfo = Map(result);
                            if (sniperInfo != null)
                            {
                                list.Add(sniperInfo);
                            }
                        }
                    }

                    return list;
                }
            }
            catch (Exception e)
            {
                Log.Debug("Trackemon API error: {0}", e.Message);
                return null;
            }
        }

        private static SniperInfo Map(TrackemonResult result)
        {
            var sniperInfo = new SniperInfo();
            var pokemonId = PokemonParser.ParseById(result.id);
            sniperInfo.PokemonId = pokemonId;

            sniperInfo.Latitude = Math.Round(result.latitude, 7);
            sniperInfo.Longitude = Math.Round(result.longitude, 7);
            sniperInfo.ChannelInfo = new ChannelInfo { server = Channel };

            var timeStamp = DateTime.Now.AddTicks(result.expiration);
            sniperInfo.ExpirationTimestamp = DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) < timeStamp ? 
                DateTime.Now.AddMinutes(Constants.MaxExpirationInTheFuture) : timeStamp;
            return sniperInfo;
        }

        public TrackemonSession FindSessionId()
        {
            var trackemonSession = new TrackemonSession();
            try
            {
                var cookieContainer = new CookieContainer();
                const string homepageUrl = "https://www.trackemon.com";
                var request = WebRequest.CreateHttp(homepageUrl);
                request.Method = "GET";
                request.Timeout = Timeout;
                request.CookieContainer = cookieContainer;
                using (var response = request.GetResponse())
                {
                    var cookieHeader = cookieContainer.GetCookieHeader(new Uri("https://www.trackemon.com"));
                    trackemonSession.cookieHeader = cookieHeader;
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        string line;

                        while ((line = reader.ReadLine()) != null)
                        {
                            var match = Regex.Match(line, @"var\s+sessionId\s*=\s*\'(1?.*)\'\s*;");
                            if (match.Success)
                            {
                                trackemonSession.sessionId = match.Groups[1].Value;
                                return trackemonSession;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Log.Debug("Error trying to get a sessionId for Trackemon: {0}", e.Message);
            }
            return null;
        }


        private static string BuildPokemonTypeIds(List<PokemonId> pokemonIds)
        {
            return string.Join(",", pokemonIds.ConvertAll(p => (long) p));
        }
    }


    internal class TrackemonResult
    {
        [JsonProperty("pokedexTypeId")]
        public long id { get; set; }

        [JsonProperty("Longitude")]
        public double longitude { get; set; }

        [JsonProperty("Latitude")]
        public double latitude { get; set; }

        [JsonProperty("expirationTime")]
        public long expiration { get; set; }
    }

    public class TrackemonSession
    {
        public string cookieHeader { get; set; }
        public string sessionId { get; set; }

        public bool Validate()
        {
            if (cookieHeader == null)
            {
                return false;
            }
            return sessionId != null;
        }
    }
}
