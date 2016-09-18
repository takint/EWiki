using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using EWiki.XF.Droid.LocationFeeder.Config;
using EWiki.XF.Droid.LocationFeeder.Helper;
using EWiki.XF.Droid.LocationFeeder.Repository;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Droid.LocationFeeder.Common
{
    public class FilterFactory
    {
        public static Filter Create(List<ChannelParser.DiscordChannels> discordChannels = null)
        {
            List<PokemonId> pokemons = GlobalSettings.UseFilter
                ? PokemonParser.ParsePokemons(new List<string>(GlobalSettings.PokekomsToFeedFilter))
                : Enum.GetValues(typeof(PokemonId)).Cast<PokemonId>().ToList();
            var pokemonsBinary = PokemonFilterToBinary.ToBinary(pokemons);
            List<Channel> channelInfos = new List<Channel>();
            if (discordChannels != null && discordChannels.Any())
            {
                foreach (ChannelParser.DiscordChannels discordChannel in discordChannels)
                {
                    channelInfos.Add(new Channel() {Server = discordChannel.Server, ChannelName = discordChannel.Name});
                }
            }
            if (GlobalSettings.UsePokeSnipers)
            {
                channelInfos.Add(new Channel() { Server = PokeSnipersRarePokemonRepository.Channel });
            }
            if (GlobalSettings.UsePokemonGoIVClub)
            {
                channelInfos.Add(new Channel() { Server = PokemonGoIVClubRarePokemonRepository.Channel });
            }
            if (GlobalSettings.UsePokewatchers)
            {
                channelInfos.Add(new Channel() { Server = PokeWatchersRarePokemonRepository.Channel });
            }
            if (GlobalSettings.UseTrackemon)
            {
                channelInfos.Add(new Channel() { Server = TrackemonRarePokemonRepository.Channel });
            }
            if (GlobalSettings.UsePokezz)
            {
                channelInfos.Add(new Channel() { Server = PokezzRarePokemonRepository.Channel });
            }
            if (GlobalSettings.UsePokeSnipe)
            {
                channelInfos.Add(new Channel() { Server = PokeSnipeRarePokemonRepository.Channel });
            }
            channelInfos.Add(new Channel() { Server = Constants.PogoFeeder });
            channelInfos.Add(new Channel() { Server = Constants.Bot });

            var filter = new Filter();
            filter.Channels = channelInfos;
            filter.Pokemon = pokemonsBinary;
            filter.VerifiedOnly = GlobalSettings.VerifiedOnly;
            filter.Version = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            filter.AreaBounds = GlobalSettings.UseGeoLocationBoundsFilter ? GlobalSettings.GeoLocationBounds : null;
            filter.MinimumIV = GlobalSettings.MinimumIV;
            filter.UnverifiedOnly = GlobalSettings.UnverifiedOnly;
            filter.UseUploadedPokemon = GlobalSettings.UseUploadedPokemon;
            filter.PokemonNotInFilterMinimumIV = GlobalSettings.PokemonNotInFilterMinimumIV;
            return filter;
        }
    }
}