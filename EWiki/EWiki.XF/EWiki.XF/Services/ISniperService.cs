using System.Threading.Tasks;
using EWiki.XF.Models.Enum;

namespace EWiki.XF.Services
{
    public interface ISniperService
    {
        Task Snipe(PokemonId pokemonId, double latitude, double longitude, string pokemonGoAccount);
    }
}
