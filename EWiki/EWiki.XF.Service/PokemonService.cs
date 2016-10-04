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
        CalculateResult IVCalculateByStardust(PokemonId pokemonId, int cp, int hp, int trainerLvl, int stardust, bool powered);
        CalculateResult IVCalculateByPokemonLvl(PokemonId pokemonId, int cp, int hp, int trainerLvl, int pokemonLvl);
    }

    public class PokemonService : IPokemonService
    {
        HttpClient client = new HttpClient();

        public List<PokemonSM> LocalPokemons = new List<PokemonSM>()
        {
            new PokemonSM()
            {
                PokemonId = PokemonId.Bulbasaur,
                Attack = 126,
                Defense = 126,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Ivysaur,
                Attack = 156,
                Defense = 158,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Venusaur,
                Attack = 198,
                Defense = 200,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Charmander,
                Attack = 128,
                Defense = 108,
                Stamina = 78,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Charmeleon,
                Attack = 160,
                Defense = 140,
                Stamina = 116,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Charizard,
                Attack = 212,
                Defense = 182,
                Stamina = 156,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Squirtle,
                Attack = 112,
                Defense = 142,
                Stamina = 88,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Wartortle,
                Attack = 144,
                Defense = 176,
                Stamina = 118,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Blastoise,
                Attack = 186,
                Defense = 222,
                Stamina = 158,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Caterpie,
                Attack = 62,
                Defense = 66,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Metapod,
                Attack = 56,
                Defense = 86,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Butterfree,
                Attack = 144,
                Defense = 144,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Weedle,
                Attack = 68,
                Defense = 64,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kakuna,
                Attack = 62,
                Defense = 82,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Beedrill,
                Attack = 144,
                Defense = 130,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Pidgey,
                Attack = 94,
                Defense = 90,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Pidgeotto,
                Attack = 126,
                Defense = 122,
                Stamina = 126,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Pidgeot,
                Attack = 170,
                Defense = 166,
                Stamina = 166,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Rattata,
                Attack = 92,
                Defense = 86,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Raticate,
                Attack = 146,
                Defense = 150,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Spearow,
                Attack = 102,
                Defense = 78,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Fearow,
                Attack = 168,
                Defense = 146,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Ekans,
                Attack = 112,
                Defense = 112,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Arbok,
                Attack = 166,
                Defense = 166,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Pikachu,
                Attack = 124,
                Defense = 108,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Raichu,
                Attack = 200,
                Defense = 154,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Sandshrew,
                Attack = 90,
                Defense = 114,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Sandslash,
                Attack = 150,
                Defense = 172,
                Stamina = 150,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.NidoranFemale,
                Attack = 100,
                Defense = 104,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Nidorina,
                Attack = 132,
                Defense = 136,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Nidoqueen,
                Attack = 184,
                Defense = 190,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.NidoranMale,
                Attack = 110,
                Defense = 94,
                Stamina = 92,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Nidorino,
                Attack = 142,
                Defense = 128,
                Stamina = 122,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Nidoking,
                Attack = 204,
                Defense = 170,
                Stamina = 162,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Clefairy,
                Attack = 116,
                Defense = 124,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Clefable,
                Attack = 178,
                Defense = 178,
                Stamina = 190,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Vulpix,
                Attack = 106,
                Defense = 118,
                Stamina = 76,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Ninetales,
                Attack = 176,
                Defense = 194,
                Stamina = 146,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Jigglypuff,
                Attack = 98,
                Defense = 54,
                Stamina = 230,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Wigglytuff,
                Attack = 168,
                Defense = 108,
                Stamina = 280,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Zubat,
                Attack = 88,
                Defense = 90,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Golbat,
                Attack = 164,
                Defense = 164,
                Stamina = 150,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Oddish,
                Attack = 134,
                Defense = 130,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Gloom,
                Attack = 162,
                Defense = 158,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Vileplume,
                Attack = 202,
                Defense = 190,
                Stamina = 150,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Paras,
                Attack = 122,
                Defense = 120,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Parasect,
                Attack = 162,
                Defense = 170,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Venonat,
                Attack = 108,
                Defense = 118,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Venomoth,
                Attack = 172,
                Defense = 154,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Diglett,
                Attack = 108,
                Defense = 86,
                Stamina = 20,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dugtrio,
                Attack = 148,
                Defense = 140,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Meowth,
                Attack = 104,
                Defense = 94,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Persian,
                Attack = 156,
                Defense = 146,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Psyduck,
                Attack = 132,
                Defense = 112,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Golduck,
                Attack = 194,
                Defense = 176,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Mankey,
                Attack = 122,
                Defense = 96,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Primeape,
                Attack = 178,
                Defense = 150,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Growlithe,
                Attack = 156,
                Defense = 110,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Arcanine,
                Attack = 230,
                Defense = 180,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Poliwag,
                Attack = 108,
                Defense = 98,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Poliwhirl,
                Attack = 132,
                Defense = 132,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Poliwrath,
                Attack = 180,
                Defense = 202,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Abra,
                Attack = 110,
                Defense = 76,
                Stamina = 50,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kadabra,
                Attack = 150,
                Defense = 112,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Alakazam,
                Attack = 186,
                Defense = 152,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Machop,
                Attack = 118,
                Defense = 96,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Machoke,
                Attack = 154,
                Defense = 144,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Machamp,
                Attack = 198,
                Defense = 180,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Bellsprout,
                Attack = 158,
                Defense = 78,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Weepinbell,
                Attack = 190,
                Defense = 110,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Victreebel,
                Attack = 222,
                Defense = 152,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Tentacool,
                Attack = 106,
                Defense = 136,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Tentacruel,
                Attack = 170,
                Defense = 196,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Geodude,
                Attack = 106,
                Defense = 118,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Graveler,
                Attack = 142,
                Defense = 156,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Golem,
                Attack = 176,
                Defense = 198,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Ponyta,
                Attack = 168,
                Defense = 138,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Rapidash,
                Attack = 200,
                Defense = 170,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Slowpoke,
                Attack = 110,
                Defense = 110,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Slowbro,
                Attack = 184,
                Defense = 198,
                Stamina = 190,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Magnemite,
                Attack = 128,
                Defense = 138,
                Stamina = 50,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Magneton,
                Attack = 186,
                Defense = 180,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Farfetchd,
                Attack = 138,
                Defense = 132,
                Stamina = 104,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Doduo,
                Attack = 126,
                Defense = 96,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dodrio,
                Attack = 182,
                Defense = 150,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Seel,
                Attack = 104,
                Defense = 138,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dewgong,
                Attack = 156,
                Defense = 192,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Grimer,
                Attack = 124,
                Defense = 110,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Muk,
                Attack = 180,
                Defense = 188,
                Stamina = 210,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Shellder,
                Attack = 120,
                Defense = 112,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Cloyster,
                Attack = 196,
                Defense = 196,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Gastly,
                Attack = 136,
                Defense = 82,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Haunter,
                Attack = 172,
                Defense = 118,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Gengar,
                Attack = 204,
                Defense = 156,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Onix,
                Attack = 90,
                Defense = 186,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Drowzee,
                Attack = 104,
                Defense = 140,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Hypno,
                Attack = 162,
                Defense = 196,
                Stamina = 170,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Krabby,
                Attack = 116,
                Defense = 110,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kingler,
                Attack = 178,
                Defense = 168,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Voltorb,
                Attack = 102,
                Defense = 124,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Electrode,
                Attack = 150,
                Defense = 174,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Exeggcute,
                Attack = 110,
                Defense = 132,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Exeggutor,
                Attack = 232,
                Defense = 164,
                Stamina = 190,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Cubone,
                Attack = 102,
                Defense = 150,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Marowak,
                Attack = 140,
                Defense = 202,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Hitmonlee,
                Attack = 148,
                Defense = 172,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Hitmonchan,
                Attack = 138,
                Defense = 204,
                Stamina = 100,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Lickitung,
                Attack = 126,
                Defense = 160,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Koffing,
                Attack = 136,
                Defense = 142,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Weezing,
                Attack = 190,
                Defense = 198,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Rhyhorn,
                Attack = 110,
                Defense = 116,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Rhydon,
                Attack = 166,
                Defense = 160,
                Stamina = 210,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Chansey,
                Attack = 40,
                Defense = 60,
                Stamina = 500,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Tangela,
                Attack = 164,
                Defense = 152,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kangaskhan,
                Attack = 142,
                Defense = 178,
                Stamina = 210,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Horsea,
                Attack = 122,
                Defense = 100,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Seadra,
                Attack = 176,
                Defense = 150,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Goldeen,
                Attack = 112,
                Defense = 126,
                Stamina = 90,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Seaking,
                Attack = 172,
                Defense = 160,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Staryu,
                Attack = 130,
                Defense = 128,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Starmie,
                Attack = 194,
                Defense = 192,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.MrMime,
                Attack = 154,
                Defense = 196,
                Stamina = 80,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Scyther,
                Attack = 176,
                Defense = 180,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Jynx,
                Attack = 172,
                Defense = 134,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Electabuzz,
                Attack = 198,
                Defense = 160,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Magmar,
                Attack = 214,
                Defense = 158,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Pinsir,
                Attack = 184,
                Defense = 186,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Tauros,
                Attack = 148,
                Defense = 184,
                Stamina = 150,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Magikarp,
                Attack = 42,
                Defense = 84,
                Stamina = 40,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Gyarados,
                Attack = 192,
                Defense = 196,
                Stamina = 190,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Lapras,
                Attack = 186,
                Defense = 190,
                Stamina = 260,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Ditto,
                Attack = 110,
                Defense = 110,
                Stamina = 96,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Eevee,
                Attack = 114,
                Defense = 128,
                Stamina = 110,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Vaporeon,
                Attack = 186,
                Defense = 168,
                Stamina = 260,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Jolteon,
                Attack = 192,
                Defense = 174,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Flareon,
                Attack = 238,
                Defense = 178,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Porygon,
                Attack = 156,
                Defense = 158,
                Stamina = 130,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Omanyte,
                Attack = 132,
                Defense = 160,
                Stamina = 70,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Omastar,
                Attack = 180,
                Defense = 202,
                Stamina = 140,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kabuto,
                Attack = 148,
                Defense = 142,
                Stamina = 60,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Kabutops,
                Attack = 190,
                Defense = 190,
                Stamina = 120,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Aerodactyl,
                Attack = 182,
                Defense = 162,
                Stamina = 160,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Snorlax,
                Attack = 180,
                Defense = 180,
                Stamina = 320,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Articuno,
                Attack = 198,
                Defense = 242,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Zapdos,
                Attack = 232,
                Defense = 194,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Moltres,
                Attack = 242,
                Defense = 194,
                Stamina = 180,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dratini,
                Attack = 128,
                Defense = 110,
                Stamina = 82,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dragonair,
                Attack = 170,
                Defense = 152,
                Stamina = 122,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Dragonite,
                Attack = 250,
                Defense = 212,
                Stamina = 182,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Mewtwo,
                Attack = 284,
                Defense = 202,
                Stamina = 212,
            },
            new PokemonSM()
            {
                PokemonId = PokemonId.Mew,
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
                var response = await client.GetStringAsync($"{AppSettings.WEB_API_URL}pokedex?skip={rq.Skip}");
                var pokemons = JsonConvert.DeserializeObject<List<PokemonSM>>(response); ;
                return pokemons;
            }
            catch (Exception e)
            {
                return new List<PokemonSM>();
            }
        }

        public CalculateResult IVCalculateByStardust(PokemonId pokemonId, int cp, int hp, int trainerLvl, int stardust, bool powered)
        {
            var pokemon = LocalPokemons.FirstOrDefault(p => p.PokemonId == pokemonId);
            return Calculator.Calculate(pokemon, cp, hp, trainerLvl, stardust: stardust, powered: powered);
        }

        public CalculateResult IVCalculateByPokemonLvl(PokemonId pokemonId, int cp, int hp, int trainerLvl, int pokemonLvl)
        {
            var pokemon = LocalPokemons.FirstOrDefault(p => p.PokemonId == pokemonId);
            return Calculator.Calculate(pokemon, cp, hp, trainerLvl, pokemonLvl: pokemonLvl);
        }

        public async Task<int> GetPokemonsCount()
        {
            return 151;
        }
    }
}
