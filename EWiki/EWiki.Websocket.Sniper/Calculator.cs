// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Calculator
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using POGOProtos.Data;
using POGOProtos.Enums;
using System;

namespace EWiki.Websocket.Sniper
{
  internal class Calculator
  {
    public static double SimpleIv(PokemonData poke)
    {
      return Math.Round((double) (poke.IndividualAttack + poke.IndividualDefense + poke.IndividualStamina) / 45.0 * 100.0);
    }

    public static double CalculatePokemonPerfection(PokemonData poke)
    {
      if ((double) poke.CpMultiplier + (double) poke.AdditionalCpMultiplier == 0.0)
        return (double) (poke.IndividualAttack * 2 + poke.IndividualDefense + poke.IndividualStamina) / 60.0 * 100.0;
      Calculator.GetBaseStats(poke.PokemonId);
      double maxCpMultiplier = Calculator.CalculateMaxCPMultiplier(poke);
      double minCpMultiplier = Calculator.CalculateMinCPMultiplier(poke);
      return (Calculator.CalculateCPMultiplier(poke) - minCpMultiplier) / (maxCpMultiplier - minCpMultiplier) * 100.0;
    }

    public static double CalculateMaxCPMultiplier(PokemonData poke)
    {
      Calculator.BaseStats baseStats = Calculator.GetBaseStats(poke.PokemonId);
      return (double) (baseStats.BaseAttack + 15) * Math.Sqrt((double) (baseStats.BaseDefense + 15)) * Math.Sqrt((double) (baseStats.BaseStamina + 15));
    }

    public static double CalculateMinCPMultiplier(PokemonData poke)
    {
      Calculator.BaseStats baseStats = Calculator.GetBaseStats(poke.PokemonId);
      return (double) baseStats.BaseAttack * Math.Sqrt((double) baseStats.BaseDefense) * Math.Sqrt((double) baseStats.BaseStamina);
    }

    public static double CalculateCPMultiplier(PokemonData poke)
    {
      Calculator.BaseStats baseStats = Calculator.GetBaseStats(poke.PokemonId);
      return (double) (baseStats.BaseAttack + poke.IndividualAttack) * Math.Sqrt((double) (baseStats.BaseDefense + poke.IndividualDefense)) * Math.Sqrt((double) (baseStats.BaseStamina + poke.IndividualStamina));
    }

    public static Calculator.BaseStats GetBaseStats(PokemonId id)
    {
      switch (id)
      {
        case PokemonId.Bulbasaur:
          return new Calculator.BaseStats(90, 126, 126);
        case PokemonId.Ivysaur:
          return new Calculator.BaseStats(120, 156, 158);
        case PokemonId.Venusaur:
          return new Calculator.BaseStats(160, 198, 200);
        case PokemonId.Charmander:
          return new Calculator.BaseStats(78, 128, 108);
        case PokemonId.Charmeleon:
          return new Calculator.BaseStats(116, 160, 140);
        case PokemonId.Charizard:
          return new Calculator.BaseStats(156, 212, 182);
        case PokemonId.Squirtle:
          return new Calculator.BaseStats(88, 112, 142);
        case PokemonId.Wartortle:
          return new Calculator.BaseStats(118, 144, 176);
        case PokemonId.Blastoise:
          return new Calculator.BaseStats(158, 186, 222);
        case PokemonId.Caterpie:
          return new Calculator.BaseStats(90, 62, 66);
        case PokemonId.Metapod:
          return new Calculator.BaseStats(100, 56, 86);
        case PokemonId.Butterfree:
          return new Calculator.BaseStats(120, 144, 144);
        case PokemonId.Weedle:
          return new Calculator.BaseStats(80, 68, 64);
        case PokemonId.Kakuna:
          return new Calculator.BaseStats(90, 62, 82);
        case PokemonId.Beedrill:
          return new Calculator.BaseStats(130, 144, 130);
        case PokemonId.Pidgey:
          return new Calculator.BaseStats(80, 94, 90);
        case PokemonId.Pidgeotto:
          return new Calculator.BaseStats(126, 126, 122);
        case PokemonId.Pidgeot:
          return new Calculator.BaseStats(166, 170, 166);
        case PokemonId.Rattata:
          return new Calculator.BaseStats(60, 92, 86);
        case PokemonId.Raticate:
          return new Calculator.BaseStats(110, 146, 150);
        case PokemonId.Spearow:
          return new Calculator.BaseStats(80, 102, 78);
        case PokemonId.Fearow:
          return new Calculator.BaseStats(130, 168, 146);
        case PokemonId.Ekans:
          return new Calculator.BaseStats(70, 112, 112);
        case PokemonId.Arbok:
          return new Calculator.BaseStats(120, 166, 166);
        case PokemonId.Pikachu:
          return new Calculator.BaseStats(70, 124, 108);
        case PokemonId.Raichu:
          return new Calculator.BaseStats(120, 200, 154);
        case PokemonId.Sandshrew:
          return new Calculator.BaseStats(100, 90, 114);
        case PokemonId.Sandslash:
          return new Calculator.BaseStats(150, 150, 172);
        case PokemonId.NidoranFemale:
          return new Calculator.BaseStats(110, 100, 104);
        case PokemonId.Nidorina:
          return new Calculator.BaseStats(140, 132, 136);
        case PokemonId.Nidoqueen:
          return new Calculator.BaseStats(180, 184, 190);
        case PokemonId.NidoranMale:
          return new Calculator.BaseStats(92, 110, 94);
        case PokemonId.Nidorino:
          return new Calculator.BaseStats(122, 142, 128);
        case PokemonId.Nidoking:
          return new Calculator.BaseStats(162, 204, 170);
        case PokemonId.Clefairy:
          return new Calculator.BaseStats(140, 116, 124);
        case PokemonId.Clefable:
          return new Calculator.BaseStats(190, 178, 178);
        case PokemonId.Vulpix:
          return new Calculator.BaseStats(76, 106, 118);
        case PokemonId.Ninetales:
          return new Calculator.BaseStats(146, 176, 194);
        case PokemonId.Jigglypuff:
          return new Calculator.BaseStats(230, 98, 54);
        case PokemonId.Wigglytuff:
          return new Calculator.BaseStats(280, 168, 108);
        case PokemonId.Zubat:
          return new Calculator.BaseStats(80, 88, 90);
        case PokemonId.Golbat:
          return new Calculator.BaseStats(150, 164, 164);
        case PokemonId.Oddish:
          return new Calculator.BaseStats(90, 134, 130);
        case PokemonId.Gloom:
          return new Calculator.BaseStats(120, 162, 158);
        case PokemonId.Vileplume:
          return new Calculator.BaseStats(150, 202, 190);
        case PokemonId.Paras:
          return new Calculator.BaseStats(70, 122, 120);
        case PokemonId.Parasect:
          return new Calculator.BaseStats(120, 162, 170);
        case PokemonId.Venonat:
          return new Calculator.BaseStats(120, 108, 118);
        case PokemonId.Venomoth:
          return new Calculator.BaseStats(140, 172, 154);
        case PokemonId.Diglett:
          return new Calculator.BaseStats(20, 108, 86);
        case PokemonId.Dugtrio:
          return new Calculator.BaseStats(70, 148, 140);
        case PokemonId.Meowth:
          return new Calculator.BaseStats(80, 104, 94);
        case PokemonId.Persian:
          return new Calculator.BaseStats(130, 156, 146);
        case PokemonId.Psyduck:
          return new Calculator.BaseStats(100, 132, 112);
        case PokemonId.Golduck:
          return new Calculator.BaseStats(160, 194, 176);
        case PokemonId.Mankey:
          return new Calculator.BaseStats(80, 122, 96);
        case PokemonId.Primeape:
          return new Calculator.BaseStats(130, 178, 150);
        case PokemonId.Growlithe:
          return new Calculator.BaseStats(110, 156, 110);
        case PokemonId.Arcanine:
          return new Calculator.BaseStats(180, 230, 180);
        case PokemonId.Poliwag:
          return new Calculator.BaseStats(80, 108, 98);
        case PokemonId.Poliwhirl:
          return new Calculator.BaseStats(130, 132, 132);
        case PokemonId.Poliwrath:
          return new Calculator.BaseStats(180, 180, 202);
        case PokemonId.Abra:
          return new Calculator.BaseStats(50, 110, 76);
        case PokemonId.Kadabra:
          return new Calculator.BaseStats(80, 150, 112);
        case PokemonId.Alakazam:
          return new Calculator.BaseStats(110, 186, 152);
        case PokemonId.Machop:
          return new Calculator.BaseStats(140, 118, 96);
        case PokemonId.Machoke:
          return new Calculator.BaseStats(160, 154, 144);
        case PokemonId.Machamp:
          return new Calculator.BaseStats(180, 198, 180);
        case PokemonId.Bellsprout:
          return new Calculator.BaseStats(100, 158, 78);
        case PokemonId.Weepinbell:
          return new Calculator.BaseStats(130, 190, 110);
        case PokemonId.Victreebel:
          return new Calculator.BaseStats(160, 222, 152);
        case PokemonId.Tentacool:
          return new Calculator.BaseStats(80, 106, 136);
        case PokemonId.Tentacruel:
          return new Calculator.BaseStats(160, 170, 196);
        case PokemonId.Geodude:
          return new Calculator.BaseStats(80, 106, 118);
        case PokemonId.Graveler:
          return new Calculator.BaseStats(110, 142, 156);
        case PokemonId.Golem:
          return new Calculator.BaseStats(160, 176, 198);
        case PokemonId.Ponyta:
          return new Calculator.BaseStats(100, 168, 138);
        case PokemonId.Rapidash:
          return new Calculator.BaseStats(130, 200, 170);
        case PokemonId.Slowpoke:
          return new Calculator.BaseStats(180, 110, 110);
        case PokemonId.Slowbro:
          return new Calculator.BaseStats(190, 184, 198);
        case PokemonId.Magnemite:
          return new Calculator.BaseStats(50, 128, 138);
        case PokemonId.Magneton:
          return new Calculator.BaseStats(100, 186, 180);
        case PokemonId.Farfetchd:
          return new Calculator.BaseStats(104, 138, 132);
        case PokemonId.Doduo:
          return new Calculator.BaseStats(70, 126, 96);
        case PokemonId.Dodrio:
          return new Calculator.BaseStats(120, 182, 150);
        case PokemonId.Seel:
          return new Calculator.BaseStats(130, 104, 138);
        case PokemonId.Dewgong:
          return new Calculator.BaseStats(180, 156, 192);
        case PokemonId.Grimer:
          return new Calculator.BaseStats(160, 124, 110);
        case PokemonId.Muk:
          return new Calculator.BaseStats(210, 180, 188);
        case PokemonId.Shellder:
          return new Calculator.BaseStats(60, 120, 112);
        case PokemonId.Cloyster:
          return new Calculator.BaseStats(100, 196, 196);
        case PokemonId.Gastly:
          return new Calculator.BaseStats(60, 136, 82);
        case PokemonId.Haunter:
          return new Calculator.BaseStats(90, 172, 118);
        case PokemonId.Gengar:
          return new Calculator.BaseStats(120, 204, 156);
        case PokemonId.Onix:
          return new Calculator.BaseStats(70, 90, 186);
        case PokemonId.Drowzee:
          return new Calculator.BaseStats(120, 104, 140);
        case PokemonId.Hypno:
          return new Calculator.BaseStats(170, 162, 196);
        case PokemonId.Krabby:
          return new Calculator.BaseStats(60, 116, 110);
        case PokemonId.Kingler:
          return new Calculator.BaseStats(110, 178, 168);
        case PokemonId.Voltorb:
          return new Calculator.BaseStats(80, 102, 124);
        case PokemonId.Electrode:
          return new Calculator.BaseStats(120, 150, 174);
        case PokemonId.Exeggcute:
          return new Calculator.BaseStats(120, 110, 132);
        case PokemonId.Exeggutor:
          return new Calculator.BaseStats(190, 232, 164);
        case PokemonId.Cubone:
          return new Calculator.BaseStats(100, 102, 150);
        case PokemonId.Marowak:
          return new Calculator.BaseStats(120, 140, 202);
        case PokemonId.Hitmonlee:
          return new Calculator.BaseStats(100, 148, 172);
        case PokemonId.Hitmonchan:
          return new Calculator.BaseStats(100, 138, 204);
        case PokemonId.Lickitung:
          return new Calculator.BaseStats(180, 126, 160);
        case PokemonId.Koffing:
          return new Calculator.BaseStats(80, 136, 142);
        case PokemonId.Weezing:
          return new Calculator.BaseStats(130, 190, 198);
        case PokemonId.Rhyhorn:
          return new Calculator.BaseStats(160, 110, 116);
        case PokemonId.Rhydon:
          return new Calculator.BaseStats(210, 166, 160);
        case PokemonId.Chansey:
          return new Calculator.BaseStats(500, 40, 60);
        case PokemonId.Tangela:
          return new Calculator.BaseStats(130, 164, 152);
        case PokemonId.Kangaskhan:
          return new Calculator.BaseStats(210, 142, 178);
        case PokemonId.Horsea:
          return new Calculator.BaseStats(60, 122, 100);
        case PokemonId.Seadra:
          return new Calculator.BaseStats(110, 176, 150);
        case PokemonId.Goldeen:
          return new Calculator.BaseStats(90, 112, 126);
        case PokemonId.Seaking:
          return new Calculator.BaseStats(160, 172, 160);
        case PokemonId.Staryu:
          return new Calculator.BaseStats(60, 130, 128);
        case PokemonId.Starmie:
          return new Calculator.BaseStats(120, 194, 192);
        case PokemonId.MrMime:
          return new Calculator.BaseStats(80, 154, 196);
        case PokemonId.Scyther:
          return new Calculator.BaseStats(140, 176, 180);
        case PokemonId.Jynx:
          return new Calculator.BaseStats(130, 172, 134);
        case PokemonId.Electabuzz:
          return new Calculator.BaseStats(130, 198, 160);
        case PokemonId.Magmar:
          return new Calculator.BaseStats(130, 214, 158);
        case PokemonId.Pinsir:
          return new Calculator.BaseStats(130, 184, 186);
        case PokemonId.Tauros:
          return new Calculator.BaseStats(150, 148, 184);
        case PokemonId.Magikarp:
          return new Calculator.BaseStats(40, 42, 84);
        case PokemonId.Gyarados:
          return new Calculator.BaseStats(190, 192, 196);
        case PokemonId.Lapras:
          return new Calculator.BaseStats(260, 186, 190);
        case PokemonId.Ditto:
          return new Calculator.BaseStats(96, 110, 110);
        case PokemonId.Eevee:
          return new Calculator.BaseStats(110, 114, 128);
        case PokemonId.Vaporeon:
          return new Calculator.BaseStats(260, 186, 168);
        case PokemonId.Jolteon:
          return new Calculator.BaseStats(130, 192, 174);
        case PokemonId.Flareon:
          return new Calculator.BaseStats(130, 238, 178);
        case PokemonId.Porygon:
          return new Calculator.BaseStats(130, 156, 158);
        case PokemonId.Omanyte:
          return new Calculator.BaseStats(70, 132, 160);
        case PokemonId.Omastar:
          return new Calculator.BaseStats(140, 180, 202);
        case PokemonId.Kabuto:
          return new Calculator.BaseStats(60, 148, 142);
        case PokemonId.Kabutops:
          return new Calculator.BaseStats(120, 190, 190);
        case PokemonId.Aerodactyl:
          return new Calculator.BaseStats(160, 182, 162);
        case PokemonId.Snorlax:
          return new Calculator.BaseStats(320, 180, 180);
        case PokemonId.Articuno:
          return new Calculator.BaseStats(180, 198, 242);
        case PokemonId.Zapdos:
          return new Calculator.BaseStats(180, 232, 194);
        case PokemonId.Moltres:
          return new Calculator.BaseStats(180, 242, 194);
        case PokemonId.Dratini:
          return new Calculator.BaseStats(82, 128, 110);
        case PokemonId.Dragonair:
          return new Calculator.BaseStats(122, 170, 152);
        case PokemonId.Dragonite:
          return new Calculator.BaseStats(182, 250, 212);
        case PokemonId.Mewtwo:
          return new Calculator.BaseStats(212, 284, 202);
        case PokemonId.Mew:
          return new Calculator.BaseStats(200, 220, 220);
        default:
          return new Calculator.BaseStats();
      }
    }

    public struct BaseStats
    {
      public int BaseAttack;
      public int BaseDefense;
      public int BaseStamina;

      public BaseStats(int baseStamina, int baseAttack, int baseDefense)
      {
        this.BaseAttack = baseAttack;
        this.BaseDefense = baseDefense;
        this.BaseStamina = baseStamina;
      }

      public override string ToString()
      {
        return string.Format("({0} atk,{1} def,{2} sta)", (object) this.BaseAttack, (object) this.BaseDefense, (object) this.BaseStamina);
      }
    }
  }
}
