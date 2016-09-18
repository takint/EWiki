using System.Collections.Generic;

namespace EWiki.XF.Droid.LocationFeeder.Common
{
    public class Filter
    {
        public string Pokemon { get; set; }
        public List<Channel> Channels;
        public bool VerifiedOnly { get; set; }
        public string Version { get; set; }
        public LatLngBounds AreaBounds;
        public double PokemonNotInFilterMinimumIV { get; set; } = 101;

        public double MinimumIV { get; set; } = 0.0;
        public bool UseUploadedPokemon { get; set; } = true;
        public bool UnverifiedOnly { get; set; } = false;
    }

    public class Channel
    {
        public string Server { get; set; }
        public string ChannelName { get; set; }
    }
}