using System.Collections.Generic;
using EWiki.XF.Droid.LocationFeeder.Config;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class RarePokemonRepositoryFactory
    {
        public static List<IRarePokemonRepository> CreateRepositories(GlobalSettings globalSettings)
        {
            var rarePokemonRepositories = new List<IRarePokemonRepository>();
            if (GlobalSettings.UsePokeSnipers)
            {
                rarePokemonRepositories.Add(new PokeSnipersRarePokemonRepository());
            }
            if (GlobalSettings.UseTrackemon)
            {
                rarePokemonRepositories.Add(new TrackemonRarePokemonRepository());
            }
            if (GlobalSettings.UsePokezz)
            {
                rarePokemonRepositories.Add(new PokezzRarePokemonRepository());
            }
            if (GlobalSettings.UsePokewatchers)
            {
                rarePokemonRepositories.Add(new PokeWatchersRarePokemonRepository());
            }
            if (GlobalSettings.UsePokemonGoIVClub)
            {
                rarePokemonRepositories.Add(new PokemonGoIVClubRarePokemonRepository());
            }
            if (GlobalSettings.UsePokeSnipe)
            {
                rarePokemonRepositories.Add(new PokeSnipeRarePokemonRepository());
            }
            return rarePokemonRepositories;
        }
    }
}
