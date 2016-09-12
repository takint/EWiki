using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public List<string> Pokemons { get; set; }
    }

    public class CancelledMessage
    {
        
    }
}
