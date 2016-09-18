// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Auto
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using Newtonsoft.Json;
using POGOProtos.Enums;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Net;
using System.Threading;
using System.Threading.Tasks;

namespace EWiki.Websocket.Sniper
{
  internal class Auto
  {
    private readonly List<int> _seenIds = new List<int>();
    private CancellationToken _updateCancellationToken;
    private CancellationTokenSource _updateCancellationTokenSource;
    private WebClient _webClient;

    public event Auto.NewPokemonEventHandler NewPokemon;

    public event Auto.ServerWentAwayEventHandler ServerWentAway;

    public Auto()
    {
      this._webClient = new WebClient();
      this._webClient.Headers.Add("User-Agent", "EWiki.Websocket.Sniper/1.12");
    }

    protected virtual void OnNewPokemon(List<PokeCoords> newPokemon)
    {
      // ISSUE: reference to a compiler-generated field
      Auto.NewPokemonEventHandler newPokemon1 = this.NewPokemon;
      if (newPokemon1 == null)
        return;
      List<PokeCoords> newPokemon2 = newPokemon;
      newPokemon1((object) this, newPokemon2);
    }

    protected virtual void OnServerWentAway()
    {
      // ISSUE: reference to a compiler-generated field
      Auto.ServerWentAwayEventHandler serverWentAway = this.ServerWentAway;
      if (serverWentAway == null)
        return;
      serverWentAway((object) this);
    }

    public void GetPokemon()
    {
      this._updateCancellationTokenSource = new CancellationTokenSource();
      this._updateCancellationToken = this._updateCancellationTokenSource.Token;
      Task.Run((Action) (() =>
      {
        int num = 0;
        bool flag = false;
        do
        {
          try
          {
            this.OnNewPokemon(this.ParseJsonResponse(JsonConvert.DeserializeObject<RootObject>(this._webClient.DownloadString(new Uri("http://pokesnipers.com/api/v1/pokemon.json")))));
            flag = true;
          }
          catch (Exception ex)
          {
            ++num;
            Thread.Sleep(3000 * num);
          }
        }
        while (!flag && num < 5);
        if (num < 5)
          return;
        this.OnServerWentAway();
      }), this._updateCancellationToken);
    }

    private List<PokeCoords> ParseJsonResponse(RootObject response)
    {
      List<PokeCoords> pokeCoordsList = new List<PokeCoords>();
      foreach (Result result1 in response.results)
      {
        PokeCoords pokeCoords = new PokeCoords();
        if (!this._seenIds.Contains(result1.id))
        {
          this._seenIds.Add(result1.id);
          string name = result1.name;
          PokemonId result2;
          if (!(name == "Mr. Mime"))
          {
            if (name == "Farfetch'd")
              result2 = PokemonId.Farfetchd;
            else if (!System.Enum.TryParse<PokemonId>(result1.name, true, out result2))
              continue;
          }
          else
            result2 = PokemonId.MrMime;
          Console.WriteLine("{0} {1} {2}", (object) result1.name, (object) result1.coords, (object) result1.until);
          string[] strArray = result1.coords.Split(',');
          double result3;
          double result4;
          if (strArray.Length == 2 && double.TryParse(strArray[0], NumberStyles.Any, (IFormatProvider) CultureInfo.InvariantCulture, out result3) && double.TryParse(strArray[1], NumberStyles.Any, (IFormatProvider) CultureInfo.InvariantCulture, out result4))
          {
            pokeCoords.PokemonId = result2;
            pokeCoords.Latitude = result3;
            pokeCoords.Longitude = result4;
            pokeCoords.Until = DateTime.Parse(result1.until).ToUniversalTime();
            pokeCoordsList.Add(pokeCoords);
          }
        }
      }
      return pokeCoordsList;
    }

    public delegate void NewPokemonEventHandler(object sender, List<PokeCoords> newPokemon);

    public delegate void ServerWentAwayEventHandler(object sender);
  }
}
