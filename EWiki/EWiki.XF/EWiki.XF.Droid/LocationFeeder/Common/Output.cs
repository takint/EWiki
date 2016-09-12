using EWiki.XF.Droid.LocationFeeder.Helper;

namespace EWiki.XF.Droid.LocationFeeder.Common
{
    public interface IOutput
    {
        void PrintPokemon(SniperInfo info);
        void SetStatus(string message);
        void RemoveListExtras();
    }
}
