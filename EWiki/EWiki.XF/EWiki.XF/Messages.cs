using EWiki.XF.Models;
using System.Collections.Generic;

namespace EWiki.XF
{
    public class StartTestBackgroundServiceMessage
    {
    }

    public class StopTestBackgroundServiceMessage
    {
    }

    public class PokemonResultFetchedMessage
    {
        public List<SniperInfo> Pokemons { get; set; }
    }

    public class CancelledMessage
    {
        
    }
}
