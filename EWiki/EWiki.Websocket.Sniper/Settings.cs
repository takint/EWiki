// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Settings
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using System;
using System.IO;
using System.Xml.Serialization;
using Newtonsoft.Json;

namespace EWiki.Websocket.Sniper
{
  public class Settings
  {
    public const string DEAR_READER = "Never gonna give you up.";

    public static UserSettingsXml OpenUser()
    {
      try
      {
        return JsonConvert.DeserializeObject<UserSettingsXml>(
                    "{\"AuthType\":\"Ptc\",\"DefaultLatitude\":\"52.379189\",\"DefaultLongitude\":\"4.899431\",\"DefaultAltitude\":\"10\",\"PtcPassword\":\"Asdcxz1+\",\"PtcUsername\":\"shzoro\",\"GoogleUsername\":\"bongvl.vn@gmail.com\",\"GooglePassword\":\"Asdcxz1+\",\"ShowUsernameInTitle\":\"false\",\"RequireURLConfirmation\":\"false\",\"AutoSniper\":{\"MinCPToCatch\":\"0\",\"MinIVToCatch\":\"0\",\"Delay\":\"10000\",\"CheckPokemon\":\"true\",\"CatchEverything\":\"false\",\"PokemonToCatch\":{\"PokemonId\":[\"Mew\",\"Mewtwo\",\"Zapdos\",\"Moltres\",\"Articuno\",\"Vaporeon\",\"Flareon\",\"Jolteon\",\"Charizard\",\"Blastoise\",\"Venusaur\",\"Raichu\",\"Nidoqueen\",\"Nidoking\",\"Arcanine\",\"Machamp\",\"Exeggutor\",\"Gyarados\",\"Lapras\",\"Snorlax\",\"Dragonair\",\"Dragonite\"]}}  }");
      }
      catch (Exception ex)
      {
        return (UserSettingsXml) null;
      }
    }
  }
}
