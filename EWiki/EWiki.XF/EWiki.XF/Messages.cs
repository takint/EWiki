using EWiki.XF.Models;
using System.Collections.Generic;

namespace EWiki.XF
{
    public class StartLocationFeederBackgroundServiceMessage
    {
    }

    public class StopLocationFeederBackgroundServiceMessage
    {
    }

    public class StartPokeFeederBackgroundServiceMessage
    {
    }

    public class StopPokeFeederBackgroundServiceMessage
    {
    }

    public class PokemonResultFetchedMessage
    {
        public List<SniperInfo> Pokemons { get; set; }
    }

    public class CancelledMessage
    {
        
    }

    public class SniperMessage
    {
        public string Message { get; set; }
    }
}
