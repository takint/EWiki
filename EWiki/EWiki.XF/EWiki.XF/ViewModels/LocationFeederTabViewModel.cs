using System;
using System.Collections.ObjectModel;
using System.Linq;
using EWiki.XF.Models;
using EWiki.XF.Models.Enum;
using EWiki.XF.Service;
using Prism.Navigation;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class LocationFeederTabViewModel : BaseViewModel
    {
        private ObservableCollection<SniperInfo> _pokemons = new ObservableCollection<SniperInfo>();
        public ObservableCollection<SniperInfo> Pokemons => _pokemons;

        public LocationFeederTabViewModel()
        {
            MessagingCenter.Subscribe<PokemonResultFetchedMessage>(this, "PokemonResultFetched", message =>
            {
                foreach (var pokemon in message.Pokemons.OrderByDescending(p => p.IV))
                {
                    var existedPokemon =
                        _pokemons.FirstOrDefault(
                            p => p.Latitude.ToString() == pokemon.Latitude.ToString() && p.Longitude.ToString() == pokemon.Longitude.ToString() && p.Id == pokemon.Id);
                    if (existedPokemon == null)
                    {
                        _pokemons.Insert(0, pokemon);
                    }
                    else
                    {
                        existedPokemon.IV = pokemon.IV > 0 ? pokemon.IV : existedPokemon.IV;
                        existedPokemon.Move1 = pokemon.Move1 ?? existedPokemon.Move1;
                        existedPokemon.Move2 = pokemon.Move2 ?? existedPokemon.Move2;
                        existedPokemon.Verified = pokemon.Verified ? pokemon.Verified : existedPokemon.Verified;
                    }
                };
            });
        }
    }
}
