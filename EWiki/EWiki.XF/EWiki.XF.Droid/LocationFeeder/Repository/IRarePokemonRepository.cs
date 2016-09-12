using System.Collections.Generic;
using EWiki.XF.Droid.LocationFeeder.Helper;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public interface IRarePokemonRepository
    {
        List<SniperInfo> FindAll();
    }
}
