using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Requests.Pokemon;
using System.Net.Http;
using EWiki.XF.Service.IVCalculator;
using EWiki.XF.Service.Models.Enum;
using Newtonsoft.Json;

namespace EWiki.XF.Service
{
    public interface IPokemonService
    {
        Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq);
        Task<int> GetPokemonsCount();
        CalculateResult IVCalculate(PokemonId pokemonId, int cp, int hp, int stardust, bool powered);
    }

    public class PokemonService : IPokemonService
    {
        HttpClient client = new HttpClient();

        public List<PokemonSM> LocalPokemons = new List<PokemonSM>()
        {
            new PokemonSM()
            {
                Id = PokemonId.Bulbasaur,
                Attack = 126,
                Defense = 126,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Ivysaur,
                Attack = 156,
                Defense = 158,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Venusaur,
                Attack = 198,
                Defense = 200,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Charmander,
                Attack = 128,
                Defense = 108,
                Stamina = 78,
            },
            new PokemonSM()
            {
                Id = PokemonId.Charmeleon,
                Attack = 160,
                Defense = 140,
                Stamina = 116,
            },
            new PokemonSM()
            {
                Id = PokemonId.Charizard,
                Attack = 212,
                Defense = 182,
                Stamina = 156,
            },
            new PokemonSM()
            {
                Id = PokemonId.Squirtle,
                Attack = 112,
                Defense = 142,
                Stamina = 88,
            },
            new PokemonSM()
            {
                Id = PokemonId.Wartortle,
                Attack = 144,
                Defense = 176,
                Stamina = 118,
            },
            new PokemonSM()
            {
                Id = PokemonId.Blastoise,
                Attack = 186,
                Defense = 222,
                Stamina = 158,
            },
            new PokemonSM()
            {
                Id = PokemonId.Caterpie,
                Attack = 62,
                Defense = 66,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Metapod,
                Attack = 56,
                Defense = 86,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Butterfree,
                Attack = 144,
                Defense = 144,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Weedle,
                Attack = 68,
                Defense = 64,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kakuna,
                Attack = 62,
                Defense = 82,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Beedrill,
                Attack = 144,
                Defense = 130,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Pidgey,
                Attack = 94,
                Defense = 90,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Pidgeotto,
                Attack = 126,
                Defense = 122,
                Stamina = 126,
            },
            new PokemonSM()
            {
                Id = PokemonId.Pidgeot,
                Attack = 170,
                Defense = 166,
                Stamina = 166,
            },
            new PokemonSM()
            {
                Id = PokemonId.Rattata,
                Attack = 92,
                Defense = 86,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Raticate,
                Attack = 146,
                Defense = 150,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Spearow,
                Attack = 102,
                Defense = 78,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Fearow,
                Attack = 168,
                Defense = 146,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Ekans,
                Attack = 112,
                Defense = 112,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Arbok,
                Attack = 166,
                Defense = 166,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Pikachu,
                Attack = 124,
                Defense = 108,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Raichu,
                Attack = 200,
                Defense = 154,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Sandshrew,
                Attack = 90,
                Defense = 114,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Sandslash,
                Attack = 150,
                Defense = 172,
                Stamina = 150,
            },
            new PokemonSM()
            {
                Id = PokemonId.NidoranFemale,
                Attack = 100,
                Defense = 104,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Nidorina,
                Attack = 132,
                Defense = 136,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Nidoqueen,
                Attack = 184,
                Defense = 190,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.NidoranMale,
                Attack = 110,
                Defense = 94,
                Stamina = 92,
            },
            new PokemonSM()
            {
                Id = PokemonId.Nidorino,
                Attack = 142,
                Defense = 128,
                Stamina = 122,
            },
            new PokemonSM()
            {
                Id = PokemonId.Nidoking,
                Attack = 204,
                Defense = 170,
                Stamina = 162,
            },
            new PokemonSM()
            {
                Id = PokemonId.Clefairy,
                Attack = 116,
                Defense = 124,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Clefable,
                Attack = 178,
                Defense = 178,
                Stamina = 190,
            },
            new PokemonSM()
            {
                Id = PokemonId.Vulpix,
                Attack = 106,
                Defense = 118,
                Stamina = 76,
            },
            new PokemonSM()
            {
                Id = PokemonId.Ninetales,
                Attack = 176,
                Defense = 194,
                Stamina = 146,
            },
            new PokemonSM()
            {
                Id = PokemonId.Jigglypuff,
                Attack = 98,
                Defense = 54,
                Stamina = 230,
            },
            new PokemonSM()
            {
                Id = PokemonId.Wigglytuff,
                Attack = 168,
                Defense = 108,
                Stamina = 280,
            },
            new PokemonSM()
            {
                Id = PokemonId.Zubat,
                Attack = 88,
                Defense = 90,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Golbat,
                Attack = 164,
                Defense = 164,
                Stamina = 150,
            },
            new PokemonSM()
            {
                Id = PokemonId.Oddish,
                Attack = 134,
                Defense = 130,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Gloom,
                Attack = 162,
                Defense = 158,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Vileplume,
                Attack = 202,
                Defense = 190,
                Stamina = 150,
            },
            new PokemonSM()
            {
                Id = PokemonId.Paras,
                Attack = 122,
                Defense = 120,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Parasect,
                Attack = 162,
                Defense = 170,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Venonat,
                Attack = 108,
                Defense = 118,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Venomoth,
                Attack = 172,
                Defense = 154,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Diglett,
                Attack = 108,
                Defense = 86,
                Stamina = 20,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dugtrio,
                Attack = 148,
                Defense = 140,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Meowth,
                Attack = 104,
                Defense = 94,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Persian,
                Attack = 156,
                Defense = 146,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Psyduck,
                Attack = 132,
                Defense = 112,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Golduck,
                Attack = 194,
                Defense = 176,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Mankey,
                Attack = 122,
                Defense = 96,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Primeape,
                Attack = 178,
                Defense = 150,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Growlithe,
                Attack = 156,
                Defense = 110,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Arcanine,
                Attack = 230,
                Defense = 180,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Poliwag,
                Attack = 108,
                Defense = 98,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Poliwhirl,
                Attack = 132,
                Defense = 132,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Poliwrath,
                Attack = 180,
                Defense = 202,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Abra,
                Attack = 110,
                Defense = 76,
                Stamina = 50,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kadabra,
                Attack = 150,
                Defense = 112,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Alakazam,
                Attack = 186,
                Defense = 152,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Machop,
                Attack = 118,
                Defense = 96,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Machoke,
                Attack = 154,
                Defense = 144,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Machamp,
                Attack = 198,
                Defense = 180,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Bellsprout,
                Attack = 158,
                Defense = 78,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Weepinbell,
                Attack = 190,
                Defense = 110,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Victreebel,
                Attack = 222,
                Defense = 152,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Tentacool,
                Attack = 106,
                Defense = 136,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Tentacruel,
                Attack = 170,
                Defense = 196,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Geodude,
                Attack = 106,
                Defense = 118,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Graveler,
                Attack = 142,
                Defense = 156,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Golem,
                Attack = 176,
                Defense = 198,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Ponyta,
                Attack = 168,
                Defense = 138,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Rapidash,
                Attack = 200,
                Defense = 170,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Slowpoke,
                Attack = 110,
                Defense = 110,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Slowbro,
                Attack = 184,
                Defense = 198,
                Stamina = 190,
            },
            new PokemonSM()
            {
                Id = PokemonId.Magnemite,
                Attack = 128,
                Defense = 138,
                Stamina = 50,
            },
            new PokemonSM()
            {
                Id = PokemonId.Magneton,
                Attack = 186,
                Defense = 180,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Farfetchd,
                Attack = 138,
                Defense = 132,
                Stamina = 104,
            },
            new PokemonSM()
            {
                Id = PokemonId.Doduo,
                Attack = 126,
                Defense = 96,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dodrio,
                Attack = 182,
                Defense = 150,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Seel,
                Attack = 104,
                Defense = 138,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dewgong,
                Attack = 156,
                Defense = 192,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Grimer,
                Attack = 124,
                Defense = 110,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Muk,
                Attack = 180,
                Defense = 188,
                Stamina = 210,
            },
            new PokemonSM()
            {
                Id = PokemonId.Shellder,
                Attack = 120,
                Defense = 112,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Cloyster,
                Attack = 196,
                Defense = 196,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Gastly,
                Attack = 136,
                Defense = 82,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Haunter,
                Attack = 172,
                Defense = 118,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Gengar,
                Attack = 204,
                Defense = 156,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Onix,
                Attack = 90,
                Defense = 186,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Drowzee,
                Attack = 104,
                Defense = 140,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Hypno,
                Attack = 162,
                Defense = 196,
                Stamina = 170,
            },
            new PokemonSM()
            {
                Id = PokemonId.Krabby,
                Attack = 116,
                Defense = 110,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kingler,
                Attack = 178,
                Defense = 168,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Voltorb,
                Attack = 102,
                Defense = 124,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Electrode,
                Attack = 150,
                Defense = 174,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Exeggcute,
                Attack = 110,
                Defense = 132,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Exeggutor,
                Attack = 232,
                Defense = 164,
                Stamina = 190,
            },
            new PokemonSM()
            {
                Id = PokemonId.Cubone,
                Attack = 102,
                Defense = 150,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Marowak,
                Attack = 140,
                Defense = 202,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Hitmonlee,
                Attack = 148,
                Defense = 172,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Hitmonchan,
                Attack = 138,
                Defense = 204,
                Stamina = 100,
            },
            new PokemonSM()
            {
                Id = PokemonId.Lickitung,
                Attack = 126,
                Defense = 160,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Koffing,
                Attack = 136,
                Defense = 142,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Weezing,
                Attack = 190,
                Defense = 198,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Rhyhorn,
                Attack = 110,
                Defense = 116,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Rhydon,
                Attack = 166,
                Defense = 160,
                Stamina = 210,
            },
            new PokemonSM()
            {
                Id = PokemonId.Chansey,
                Attack = 40,
                Defense = 60,
                Stamina = 500,
            },
            new PokemonSM()
            {
                Id = PokemonId.Tangela,
                Attack = 164,
                Defense = 152,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kangaskhan,
                Attack = 142,
                Defense = 178,
                Stamina = 210,
            },
            new PokemonSM()
            {
                Id = PokemonId.Horsea,
                Attack = 122,
                Defense = 100,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Seadra,
                Attack = 176,
                Defense = 150,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Goldeen,
                Attack = 112,
                Defense = 126,
                Stamina = 90,
            },
            new PokemonSM()
            {
                Id = PokemonId.Seaking,
                Attack = 172,
                Defense = 160,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Staryu,
                Attack = 130,
                Defense = 128,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Starmie,
                Attack = 194,
                Defense = 192,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.MrMime,
                Attack = 154,
                Defense = 196,
                Stamina = 80,
            },
            new PokemonSM()
            {
                Id = PokemonId.Scyther,
                Attack = 176,
                Defense = 180,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Jynx,
                Attack = 172,
                Defense = 134,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Electabuzz,
                Attack = 198,
                Defense = 160,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Magmar,
                Attack = 214,
                Defense = 158,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Pinsir,
                Attack = 184,
                Defense = 186,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Tauros,
                Attack = 148,
                Defense = 184,
                Stamina = 150,
            },
            new PokemonSM()
            {
                Id = PokemonId.Magikarp,
                Attack = 42,
                Defense = 84,
                Stamina = 40,
            },
            new PokemonSM()
            {
                Id = PokemonId.Gyarados,
                Attack = 192,
                Defense = 196,
                Stamina = 190,
            },
            new PokemonSM()
            {
                Id = PokemonId.Lapras,
                Attack = 186,
                Defense = 190,
                Stamina = 260,
            },
            new PokemonSM()
            {
                Id = PokemonId.Ditto,
                Attack = 110,
                Defense = 110,
                Stamina = 96,
            },
            new PokemonSM()
            {
                Id = PokemonId.Eevee,
                Attack = 114,
                Defense = 128,
                Stamina = 110,
            },
            new PokemonSM()
            {
                Id = PokemonId.Vaporeon,
                Attack = 186,
                Defense = 168,
                Stamina = 260,
            },
            new PokemonSM()
            {
                Id = PokemonId.Jolteon,
                Attack = 192,
                Defense = 174,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Flareon,
                Attack = 238,
                Defense = 178,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Porygon,
                Attack = 156,
                Defense = 158,
                Stamina = 130,
            },
            new PokemonSM()
            {
                Id = PokemonId.Omanyte,
                Attack = 132,
                Defense = 160,
                Stamina = 70,
            },
            new PokemonSM()
            {
                Id = PokemonId.Omastar,
                Attack = 180,
                Defense = 202,
                Stamina = 140,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kabuto,
                Attack = 148,
                Defense = 142,
                Stamina = 60,
            },
            new PokemonSM()
            {
                Id = PokemonId.Kabutops,
                Attack = 190,
                Defense = 190,
                Stamina = 120,
            },
            new PokemonSM()
            {
                Id = PokemonId.Aerodactyl,
                Attack = 182,
                Defense = 162,
                Stamina = 160,
            },
            new PokemonSM()
            {
                Id = PokemonId.Snorlax,
                Attack = 180,
                Defense = 180,
                Stamina = 320,
            },
            new PokemonSM()
            {
                Id = PokemonId.Articuno,
                Attack = 198,
                Defense = 242,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Zapdos,
                Attack = 232,
                Defense = 194,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Moltres,
                Attack = 242,
                Defense = 194,
                Stamina = 180,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dratini,
                Attack = 128,
                Defense = 110,
                Stamina = 82,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dragonair,
                Attack = 170,
                Defense = 152,
                Stamina = 122,
            },
            new PokemonSM()
            {
                Id = PokemonId.Dragonite,
                Attack = 250,
                Defense = 212,
                Stamina = 182,
            },
            new PokemonSM()
            {
                Id = PokemonId.Mewtwo,
                Attack = 284,
                Defense = 202,
                Stamina = 212,
            },
            new PokemonSM()
            {
                Id = PokemonId.Mew,
                Attack = 220,
                Defense = 220,
                Stamina = 200,
            }
        };
        public PokemonService()
        {

        }

        public async Task<List<PokemonSM>> GetPokemons(GetPokemonsRq rq)
        {
            try
            {
                var response = await client.GetStringAsync("http://esquare.io/api/pokedex");
                var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
                return pokemons;
            }
            catch (Exception)
            {
                var response =
                    "[{\"name\":\"Bulbasaur\",\"slug\":\"bulbasaur\",\"number\":\"#001\",\"species\":\"Pokémon Hạt Giống\",\"weight\":6.9,\"height\":0.7,\"stamina\":90,\"attack\":126,\"defense\":126,\"candy\":25,\"cpGain\":13.8,\"maxCP\":1071.0,\"description\":\"Trên lưng của Bulbasaur có một hạt giống có thể nở nhờ ánh sáng nên nó thường ngủ trưa dưới ánh mặt trời. \",\"evolveIntos\":\"#002\",\"evolveFrom\":null,\"locations\":null,\"normalMoves\":null,\"specialMoves\":null,\"evolveInto\":[{\"name\":\"Ivysaur\",\"slug\":\"ivysaur\",\"number\":\"#002\",\"species\":\"Pokémon Hạt Giống\",\"weight\":13.0,\"height\":1.0,\"stamina\":120,\"attack\":156,\"defense\":158,\"candy\":100,\"cpGain\":21.6,\"maxCP\":1632.0,\"description\":\"Sau khi tiến hoá từ Bulbasaur, hạt giống trên lưng trở thành nụ hoa. Vì vậy nó dành nhiều hơn thời gian dưới ánh mặt trời để tiến hoá.\",\"evolveIntos\":\"#003\"}]}]";
                var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
                return pokemons;
            }
        }

        public CalculateResult IVCalculate(PokemonId pokemonId, int cp, int hp, int stardust, bool powered)
        {
            var pokemon = LocalPokemons.FirstOrDefault(p => p.Id == pokemonId);
            return Calculator.Calculate(pokemon, cp, hp, stardust, powered);
        }

        public async Task<int> GetPokemonsCount()
        {
            return 100;
        }
    }
}
