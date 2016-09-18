// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Core
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using POGOProtos.Data;
using POGOProtos.Data.Capture;
using POGOProtos.Enums;
using POGOProtos.Inventory;
using POGOProtos.Inventory.Item;
using POGOProtos.Map;
using POGOProtos.Map.Pokemon;
using POGOProtos.Networking.Responses;
using PokemonGo.RocketAPI;
using PokemonGo.RocketAPI.Extensions;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Websocket.Sniper
{
  internal class Core
  {
    private readonly Client _client;
    private readonly UserSettingsXml.AutoSniperSettingsXml _autoSniperSettings;

    public event Core.ErrorEventHandler Error;

    public event Core.ReportEventHandler Report;

    public event Core.SnipeFinishedEventHandler SnipeFinished;

    public event Core.LoginEventHandler Login;

    public event Core.CriticalStateEventHandler CriticalState;

    public Core(ISettings settings, UserSettingsXml.AutoSniperSettingsXml autoSniperSettings = null)
    {
      this._autoSniperSettings = autoSniperSettings;
      this._client = new Client(settings);
    }

    protected virtual void OnError(Exception exception)
    {
      // ISSUE: reference to a compiler-generated field
      Core.ErrorEventHandler error = this.Error;
      if (error == null)
        return;
      Exception exception1 = exception;
      error((object) this, exception1);
    }

    protected virtual void OnReport(string message, Core.MessageType messageType)
    {
      // ISSUE: reference to a compiler-generated field
      Core.ReportEventHandler report = this.Report;
      if (report == null)
        return;
      string message1 = message;
      int num = (int) messageType;
      report((object) this, message1, (Core.MessageType) num);
    }

    protected virtual void OnSnipeFinished()
    {
      // ISSUE: reference to a compiler-generated field
      Core.SnipeFinishedEventHandler snipeFinished = this.SnipeFinished;
      if (snipeFinished == null)
        return;
      snipeFinished((object) this);
    }

    protected virtual void OnLogin(bool success)
    {
      // ISSUE: reference to a compiler-generated field
      Core.LoginEventHandler login = this.Login;
      if (login == null)
        return;
      int num = success ? 1 : 0;
      login((object) this, num != 0);
    }

    protected virtual void OnCriticalState(Core.CriticalStateType type)
    {
      // ISSUE: reference to a compiler-generated field
      Core.CriticalStateEventHandler criticalState = this.CriticalState;
      if (criticalState == null)
        return;
      int num = (int) type;
      criticalState((object) this, (Core.CriticalStateType) num);
    }

    public async Task DoLogin()
    {
      this.OnReport("Logging in...", Core.MessageType.Default);
      try
      {
        await this._client.Login.DoLogin();
      }
      catch (Exception ex)
      {
        this.OnLogin(false);
        this.OnError(ex);
        this.OnCriticalState(Core.CriticalStateType.Error);
        return;
      }
      this.OnLogin(true);
    }

    public async Task Snipe(PokemonId pokemon, double latitude, double longitude)
    {
      this.OnReport(pokemon != PokemonId.Missingno ? string.Format("Looking for a {0} at {1}, {2}.", (object) pokemon, (object) latitude.ToString((IFormatProvider) CultureInfo.InvariantCulture), (object) longitude.ToString((IFormatProvider) CultureInfo.InvariantCulture)) : string.Format("Looking for all Pokemon at {0}, {1}.", (object) latitude.ToString((IFormatProvider) CultureInfo.InvariantCulture), (object) longitude.ToString((IFormatProvider) CultureInfo.InvariantCulture)), Core.MessageType.Default);
      try
      {
        await this.SnipePokemon(pokemon, latitude, longitude);
        this.OnSnipeFinished();
      }
      catch (Exception ex)
      {
        this.OnError(ex);
        this.OnCriticalState(Core.CriticalStateType.Error);
      }
    }

    private bool CheckIgnoredPokemon(PokemonData pokemon)
    {
      if (pokemon == null)
        return true;
      bool flag = false;
      string str1 = "";
      double pokemonPerfection = Calculator.CalculatePokemonPerfection(pokemon);
      string str2 = Convert.ToString((object) pokemon.PokemonId);
      if (!this._autoSniperSettings.PokemonToCatch.Contains(pokemon.PokemonId))
      {
        flag = true;
        str1 = "Pokemon is not in the catch list.";
      }
      if (!flag && pokemon.Cp < this._autoSniperSettings.MinCPToCatch && pokemonPerfection < (double) this._autoSniperSettings.MinIVToCatch)
      {
        flag = true;
        str1 = string.Format("Pokemon is below {0} CP and {1} IV.", (object) this._autoSniperSettings.MinCPToCatch, (object) this._autoSniperSettings.MinIVToCatch);
      }
      if (!flag && pokemon.Cp < this._autoSniperSettings.MinCPToCatch)
      {
        flag = true;
        str1 = string.Format("Pokemon is below {0} CP.", (object) this._autoSniperSettings.MinCPToCatch);
      }
      if (!flag && pokemonPerfection < (double) this._autoSniperSettings.MinIVToCatch)
      {
        flag = true;
        str1 = string.Format("Pokemon is below {0} IV.", (object) this._autoSniperSettings.MinIVToCatch);
      }
      if (flag)
      {
        this.OnReport(string.Format("Ignored a {0}. {1}\n - CP: {2}\n - IV: {3}\n - Move 1: {4}\n - Move 2: {5}", (object) str2, (object) str1, (object) pokemon.Cp, (object) pokemonPerfection, (object) pokemon.Move1, (object) pokemon.Move2), Core.MessageType.PokemonIgnored);
        this.OnReport("If you wish to snipe this Pokemon anyway, open EWiki.Websocket.Sniper in manual mode.", Core.MessageType.PokemonIgnored);
      }
      return flag;
    }

    public static double GetRandomAltitude()
    {
      return new Random().NextDouble() * 130.0 + 20.0;
    }

    public static async Task GetRandomDelay()
    {
      await Task.Delay(new Random(new Guid().GetHashCode()).Next(150, 300));
    }

    private async Task SnipePokemon(PokemonId pokemonId, double latitude, double longitude)
    {
      double randomAltitude = 10.0;
      PlayerUpdateResponse playerUpdateResponse1 = await this._client.Player.UpdatePlayerLocation(latitude, longitude, randomAltitude);
      Tuple<GetMapObjectsResponse, GetHatchedEggsResponse, GetInventoryResponse, CheckAwardedBadgesResponse, DownloadSettingsResponse> mapObjects = await this._client.Map.GetMapObjects();
      IEnumerable<WildPokemon> pokemons = pokemonId == PokemonId.Missingno ? mapObjects.Item1.MapCells.SelectMany<MapCell, WildPokemon>((Func<MapCell, IEnumerable<WildPokemon>>) (i => (IEnumerable<WildPokemon>) i.WildPokemons)) : mapObjects.Item1.MapCells.SelectMany<MapCell, WildPokemon>((Func<MapCell, IEnumerable<WildPokemon>>) (i => (IEnumerable<WildPokemon>) i.WildPokemons)).Where<WildPokemon>((Func<WildPokemon, bool>) (x => x.PokemonData.PokemonId == pokemonId));
      PlayerUpdateResponse playerUpdateResponse2 = await this._client.Player.UpdatePlayerLocation(this._client.Settings.DefaultLatitude, this._client.Settings.DefaultLongitude, this._client.Settings.DefaultAltitude);
      IList<WildPokemon> wildPokemons = pokemons as IList<WildPokemon> ?? (IList<WildPokemon>) pokemons.ToList<WildPokemon>();
      if (!wildPokemons.Any<WildPokemon>())
      {
        if (pokemonId != PokemonId.Missingno)
        {
          this.OnReport(string.Format("There is no {0} here.", (object) pokemonId), Core.MessageType.PokemonGotAway);
          this.OnReport("The Pokemon might have already been caught by you, or you could be API limited.", Core.MessageType.PokemonGotAway);
        }
        else
          this.OnReport("There are no Pokemon here.", Core.MessageType.PokemonGotAway);
      }
      else
      {
        foreach (WildPokemon wildPokemon1 in (IEnumerable<WildPokemon>) wildPokemons)
        {
          WildPokemon wildPokemon = wildPokemon1;
          PlayerUpdateResponse playerUpdateResponse3 = await this._client.Player.UpdatePlayerLocation(latitude, longitude, randomAltitude);
          EncounterResponse encounterPokemonResponse = await this._client.Encounter.EncounterPokemon(wildPokemon.EncounterId, wildPokemon.SpawnPointId);
          PlayerUpdateResponse playerUpdateResponse4 = await this._client.Player.UpdatePlayerLocation(this._client.Settings.DefaultLatitude, this._client.Settings.DefaultLongitude, this._client.Settings.DefaultAltitude);
          if (encounterPokemonResponse.Status != EncounterResponse.Types.Status.EncounterSuccess)
          {
            switch (encounterPokemonResponse.Status)
            {
              case EncounterResponse.Types.Status.EncounterClosed:
                this.OnReport(string.Format("Encounter has been closed for this {0}.", (object) wildPokemon.PokemonData.PokemonId), Core.MessageType.PokemonGotAway);
                continue;
              case EncounterResponse.Types.Status.EncounterAlreadyHappened:
                this.OnReport(string.Format("We caught this {0} already.", (object) wildPokemon.PokemonData.PokemonId), Core.MessageType.PokemonCaught);
                continue;
              case EncounterResponse.Types.Status.PokemonInventoryFull:
                this.OnReport("There is no space for new Pokemon, your Pokemon inventory is full.", Core.MessageType.PokemonGotAway);
                this.OnCriticalState(Core.CriticalStateType.FullPokemonInventory);
                continue;
              default:
                continue;
            }
          }
          else if (this._autoSniperSettings == null || !this.CheckIgnoredPokemon(encounterPokemonResponse.WildPokemon.PokemonData))
          {
            ItemId bestBerry = await this.GetBestBerry(encounterPokemonResponse);
            if (bestBerry != ItemId.ItemUnknown)
            {
              UseItemCaptureResponse itemCaptureResponse = await this._client.Encounter.UseCaptureItem(wildPokemon.EncounterId, bestBerry, wildPokemon.SpawnPointId);
              string str = bestBerry.ToString().Replace("Item", "");
              if (itemCaptureResponse.Success)
                this.OnReport(string.Format("Using a {0}.", (object) str), Core.MessageType.Default);
              else
                this.OnReport(string.Format("Tried to use a {0}, but failed.", (object) str), Core.MessageType.Default);
              await Core.GetRandomDelay();
            }
            CatchPokemonResponse caughtPokemonResponse;
            do
            {
              ItemId bestBall = await this.GetBestBall(encounterPokemonResponse);
              if (bestBall == ItemId.ItemUnknown)
              {
                this.OnReport("Got into the fight without any Pokeballs.", Core.MessageType.PokemonGotAway);
                this.OnCriticalState(Core.CriticalStateType.NoBalls);
                return;
              }
              caughtPokemonResponse = await this._client.Encounter.CatchPokemon(wildPokemon.EncounterId, wildPokemon.SpawnPointId, bestBall, false, new Random().NextDouble() * 0.3 + 1.0, 0.0, 1.0);
              await Core.GetRandomDelay();
            }
            while (caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchMissed || caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchEscape);
            double pokemonPerfection = Calculator.CalculatePokemonPerfection(encounterPokemonResponse.WildPokemon.PokemonData);
            string str1 = Convert.ToString((object) encounterPokemonResponse.WildPokemon.PokemonData.PokemonId);
            string message;
            if (caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchSuccess)
            {
              string format = "We caught a {0}.\n - CP: {1}\n - IV: {2}\n - Move 1: {3}\n - Move 2: {4}";
              object[] objArray = new object[5];
              objArray[0] = (object) str1;
              int index1 = 1;
              EncounterResponse encounterResponse1 = encounterPokemonResponse;
              int? nullable1;
              if (encounterResponse1 == null)
              {
                nullable1 = new int?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse1.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable1 = new int?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable1 = pokemonData != null ? new int?(pokemonData.Cp) : new int?();
                }
              }
              // ISSUE: variable of a boxed type
              var local1 = (ValueType) nullable1;
              objArray[index1] = (object) local1;
              int index2 = 2;
              // ISSUE: variable of a boxed type
              var local2 = (ValueType) pokemonPerfection;
              objArray[index2] = (object) local2;
              int index3 = 3;
              EncounterResponse encounterResponse2 = encounterPokemonResponse;
              PokemonMove? nullable2;
              if (encounterResponse2 == null)
              {
                nullable2 = new PokemonMove?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse2.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable2 = new PokemonMove?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable2 = pokemonData != null ? new PokemonMove?(pokemonData.Move1) : new PokemonMove?();
                }
              }
              // ISSUE: variable of a boxed type
              var local3 = (ValueType) nullable2;
              objArray[index3] = (object) local3;
              int index4 = 4;
              EncounterResponse encounterResponse3 = encounterPokemonResponse;
              PokemonMove? nullable3;
              if (encounterResponse3 == null)
              {
                nullable3 = new PokemonMove?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse3.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable3 = new PokemonMove?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable3 = pokemonData != null ? new PokemonMove?(pokemonData.Move2) : new PokemonMove?();
                }
              }
              // ISSUE: variable of a boxed type
              var local4 = (ValueType) nullable3;
              objArray[index4] = (object) local4;
              message = string.Format(format, objArray);
            }
            else
            {
              string format = "{0} got away.\n - CP: {1}\n - IV: {2}\n - Move 1: {3}\n - Move 2: {4}";
              object[] objArray = new object[5];
              objArray[0] = (object) str1;
              int index1 = 1;
              EncounterResponse encounterResponse1 = encounterPokemonResponse;
              int? nullable1;
              if (encounterResponse1 == null)
              {
                nullable1 = new int?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse1.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable1 = new int?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable1 = pokemonData != null ? new int?(pokemonData.Cp) : new int?();
                }
              }
              // ISSUE: variable of a boxed type
              var local1 = (ValueType) nullable1;
              objArray[index1] = (object) local1;
              int index2 = 2;
              // ISSUE: variable of a boxed type
              var local2 = (ValueType) pokemonPerfection;
              objArray[index2] = (object) local2;
              int index3 = 3;
              EncounterResponse encounterResponse2 = encounterPokemonResponse;
              PokemonMove? nullable2;
              if (encounterResponse2 == null)
              {
                nullable2 = new PokemonMove?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse2.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable2 = new PokemonMove?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable2 = pokemonData != null ? new PokemonMove?(pokemonData.Move1) : new PokemonMove?();
                }
              }
              // ISSUE: variable of a boxed type
              var local3 = (ValueType) nullable2;
              objArray[index3] = (object) local3;
              int index4 = 4;
              EncounterResponse encounterResponse3 = encounterPokemonResponse;
              PokemonMove? nullable3;
              if (encounterResponse3 == null)
              {
                nullable3 = new PokemonMove?();
              }
              else
              {
                WildPokemon wildPokemon2 = encounterResponse3.WildPokemon;
                if (wildPokemon2 == null)
                {
                  nullable3 = new PokemonMove?();
                }
                else
                {
                  PokemonData pokemonData = wildPokemon2.PokemonData;
                  nullable3 = pokemonData != null ? new PokemonMove?(pokemonData.Move2) : new PokemonMove?();
                }
              }
              // ISSUE: variable of a boxed type
              var local4 = (ValueType) nullable3;
              objArray[index4] = (object) local4;
              message = string.Format(format, objArray);
            }
            this.OnReport(message, caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchSuccess ? Core.MessageType.PokemonCaught : Core.MessageType.PokemonGotAway);
            if (caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchFlee)
              this.OnReport("The Pokemon fled. Make sure you are not softbanned, otherwise you can not catch any Pokemon.", Core.MessageType.PokemonGotAway);
            if (caughtPokemonResponse.Status == CatchPokemonResponse.Types.CatchStatus.CatchError)
              this.OnReport("The Pokemon fled. Trying to catch the Pokemon ended in a catch error.", Core.MessageType.PokemonGotAway);
            GetInventoryResponse inventory = await this._client.Inventory.GetInventory();
            List<ItemData> list1 = inventory.InventoryDelta.InventoryItems.Select<InventoryItem, ItemData>((Func<InventoryItem, ItemData>) (i =>
            {
              InventoryItemData inventoryItemData = i.InventoryItemData;
              if (inventoryItemData == null)
                return (ItemData) null;
              return inventoryItemData.Item;
            })).Where<ItemData>((Func<ItemData, bool>) (p => p != null)).ToList<ItemData>();
            List<PokemonData> list2 = inventory.InventoryDelta.InventoryItems.Select<InventoryItem, PokemonData>((Func<InventoryItem, PokemonData>) (i =>
            {
              InventoryItemData inventoryItemData = i.InventoryItemData;
              if (inventoryItemData == null)
                return (PokemonData) null;
              return inventoryItemData.PokemonData;
            })).Where<PokemonData>((Func<PokemonData, bool>) (p =>
            {
              if (p != null)
                return p.PokemonId > PokemonId.Missingno;
              return false;
            })).ToList<PokemonData>();
            int ballCount = this.GetBallCount(list1);
            int berryCount = this.GetBerryCount(list1);
            this.OnReport(string.Format("We have {0} Pokeballs and {1} berries left. We have {2} Pokemon.", (object) ballCount, (object) berryCount, (object) list2.Count), Core.MessageType.PokemonCaught);
            if (ballCount == 0)
              this.OnCriticalState(Core.CriticalStateType.NoBalls);
            if (wildPokemons.Count > 1)
              await Task.Delay(1000);
            encounterPokemonResponse = (EncounterResponse) null;
            caughtPokemonResponse = (CatchPokemonResponse) null;
            wildPokemon = (WildPokemon) null;
          }
        }
        this.OnReport("Caught everything we could find.", Core.MessageType.Default);
      }
    }

    private int GetBallCount(List<ItemData> items)
    {
      int itemAmountByType1 = this.GetItemAmountByType(items, ItemId.ItemPokeBall);
      int itemAmountByType2 = this.GetItemAmountByType(items, ItemId.ItemGreatBall);
      int itemAmountByType3 = this.GetItemAmountByType(items, ItemId.ItemUltraBall);
      int itemAmountByType4 = this.GetItemAmountByType(items, ItemId.ItemMasterBall);
      int num = itemAmountByType2;
      return itemAmountByType1 + num + itemAmountByType3 + itemAmountByType4;
    }

    private int GetBerryCount(List<ItemData> items)
    {
      int itemAmountByType1 = this.GetItemAmountByType(items, ItemId.ItemRazzBerry);
      int itemAmountByType2 = this.GetItemAmountByType(items, ItemId.ItemBlukBerry);
      int itemAmountByType3 = this.GetItemAmountByType(items, ItemId.ItemNanabBerry);
      int itemAmountByType4 = this.GetItemAmountByType(items, ItemId.ItemWeparBerry);
      int itemAmountByType5 = this.GetItemAmountByType(items, ItemId.ItemPinapBerry);
      int num = itemAmountByType2;
      return itemAmountByType1 + num + itemAmountByType3 + itemAmountByType4 + itemAmountByType5;
    }

    private async Task<ItemId> GetBestBerry(EncounterResponse encounter)
    {
      EncounterResponse encounterResponse1 = encounter;
      int? nullable1;
      if (encounterResponse1 == null)
      {
        nullable1 = new int?();
      }
      else
      {
        WildPokemon wildPokemon = encounterResponse1.WildPokemon;
        if (wildPokemon == null)
        {
          nullable1 = new int?();
        }
        else
        {
          PokemonData pokemonData = wildPokemon.PokemonData;
          nullable1 = pokemonData != null ? new int?(pokemonData.Cp) : new int?();
        }
      }
      int? pokemonCp = nullable1;
      EncounterResponse encounterResponse2 = encounter;
      float? nullable2;
      if (encounterResponse2 == null)
      {
        nullable2 = new float?();
      }
      else
      {
        CaptureProbability captureProbability = encounterResponse2.CaptureProbability;
        nullable2 = captureProbability != null ? new float?(captureProbability.CaptureProbability_.First<float>()) : new float?();
      }
      float? proba = nullable2;
      List<ItemData> items = await this.GetItems();
      IEnumerable<ItemData> source = items.Where<ItemData>((Func<ItemData, bool>) (i =>
      {
        if (i.ItemId == ItemId.ItemRazzBerry || i.ItemId == ItemId.ItemBlukBerry || (i.ItemId == ItemId.ItemNanabBerry || i.ItemId == ItemId.ItemWeparBerry) || i.ItemId == ItemId.ItemPinapBerry)
          return i.Count > 0;
        return false;
      }));
      Func<ItemData, ItemId> func = (Func<ItemData, ItemId>) (i => i.ItemId);
      Func<ItemData, ItemId> keySelector = null;
      if (source.GroupBy<ItemData, ItemId>(keySelector).ToList<IGrouping<ItemId, ItemData>>().Count != 0)
      {
        int? nullable3 = pokemonCp;
        int num1 = 350;
        if ((nullable3.GetValueOrDefault() <= num1 ? (nullable3.HasValue ? 1 : 0) : 0) == 0)
        {
          int itemAmountByType1 = this.GetItemAmountByType(items, ItemId.ItemRazzBerry);
          int itemAmountByType2 = this.GetItemAmountByType(items, ItemId.ItemBlukBerry);
          int itemAmountByType3 = this.GetItemAmountByType(items, ItemId.ItemNanabBerry);
          int itemAmountByType4 = this.GetItemAmountByType(items, ItemId.ItemWeparBerry);
          if (this.GetItemAmountByType(items, ItemId.ItemPinapBerry) > 0)
          {
            nullable3 = pokemonCp;
            int num2 = 2000;
            if ((nullable3.GetValueOrDefault() >= num2 ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
              return ItemId.ItemPinapBerry;
          }
          if (itemAmountByType4 > 0)
          {
            nullable3 = pokemonCp;
            int num2 = 1500;
            if ((nullable3.GetValueOrDefault() >= num2 ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
              return ItemId.ItemWeparBerry;
          }
          double? nullable4;
          if (itemAmountByType3 > 0)
          {
            nullable3 = pokemonCp;
            int num2 = 1000;
            if ((nullable3.GetValueOrDefault() >= num2 ? (nullable3.HasValue ? 1 : 0) : 0) == 0)
            {
              float? nullable5 = proba;
              nullable4 = nullable5.HasValue ? new double?((double) nullable5.GetValueOrDefault()) : new double?();
              double num3 = 0.4;
              if ((nullable4.GetValueOrDefault() < num3 ? (nullable4.HasValue ? 1 : 0) : 0) == 0)
                goto label_22;
            }
            return ItemId.ItemNanabBerry;
          }
label_22:
          if (itemAmountByType2 > 0)
          {
            nullable3 = pokemonCp;
            int num2 = 500;
            if ((nullable3.GetValueOrDefault() >= num2 ? (nullable3.HasValue ? 1 : 0) : 0) == 0)
            {
              float? nullable5 = proba;
              nullable4 = nullable5.HasValue ? new double?((double) nullable5.GetValueOrDefault()) : new double?();
              double num3 = 0.5;
              if ((nullable4.GetValueOrDefault() < num3 ? (nullable4.HasValue ? 1 : 0) : 0) == 0)
                goto label_26;
            }
            return ItemId.ItemBlukBerry;
          }
label_26:
          if (itemAmountByType1 > 0)
          {
            nullable3 = pokemonCp;
            int num2 = 150;
            if ((nullable3.GetValueOrDefault() >= num2 ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
              return ItemId.ItemRazzBerry;
          }
          return ItemId.ItemUnknown;
        }
      }
      return ItemId.ItemUnknown;
    }

    private async Task<ItemId> GetBestBall(EncounterResponse encounter)
    {
      WildPokemon wildPokemon = encounter.WildPokemon;
      int? nullable1;
      if (wildPokemon == null)
      {
        nullable1 = new int?();
      }
      else
      {
        PokemonData pokemonData = wildPokemon.PokemonData;
        nullable1 = pokemonData != null ? new int?(pokemonData.Cp) : new int?();
      }
      int? pokemonCp = nullable1;
      EncounterResponse encounterResponse = encounter;
      float? nullable2;
      if (encounterResponse == null)
      {
        nullable2 = new float?();
      }
      else
      {
        CaptureProbability captureProbability = encounterResponse.CaptureProbability;
        nullable2 = captureProbability != null ? new float?(captureProbability.CaptureProbability_.First<float>()) : new float?();
      }
      float? probability = nullable2;
      List<ItemData> items = await this.GetItems();
      int itemAmountByType1 = this.GetItemAmountByType(items, ItemId.ItemPokeBall);
      int itemAmountByType2 = this.GetItemAmountByType(items, ItemId.ItemGreatBall);
      int itemAmountByType3 = this.GetItemAmountByType(items, ItemId.ItemUltraBall);
      int itemAmountByType4 = this.GetItemAmountByType(items, ItemId.ItemMasterBall);
      int? nullable3;
      if (itemAmountByType4 > 0)
      {
        nullable3 = pokemonCp;
        int num = 1200;
        if ((nullable3.GetValueOrDefault() >= num ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemMasterBall;
      }
      if (itemAmountByType3 > 0)
      {
        nullable3 = pokemonCp;
        int num = 1000;
        if ((nullable3.GetValueOrDefault() >= num ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemUltraBall;
      }
      if (itemAmountByType2 > 0)
      {
        nullable3 = pokemonCp;
        int num = 750;
        if ((nullable3.GetValueOrDefault() >= num ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemGreatBall;
      }
      double? nullable4;
      if (itemAmountByType3 > 0)
      {
        float? nullable5 = probability;
        nullable4 = nullable5.HasValue ? new double?((double) nullable5.GetValueOrDefault()) : new double?();
        double num = 0.4;
        if ((nullable4.GetValueOrDefault() < num ? (nullable4.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemUltraBall;
      }
      if (itemAmountByType2 > 0)
      {
        float? nullable5 = probability;
        nullable4 = nullable5.HasValue ? new double?((double) nullable5.GetValueOrDefault()) : new double?();
        double num = 0.5;
        if ((nullable4.GetValueOrDefault() < num ? (nullable4.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemGreatBall;
      }
      if (itemAmountByType2 > 0)
      {
        nullable3 = pokemonCp;
        int num = 300;
        if ((nullable3.GetValueOrDefault() >= num ? (nullable3.HasValue ? 1 : 0) : 0) != 0)
          return ItemId.ItemGreatBall;
      }
      return itemAmountByType1 <= 0 ? (itemAmountByType2 <= 0 ? (itemAmountByType3 <= 0 ? (itemAmountByType4 <= 0 ? ItemId.ItemUnknown : ItemId.ItemMasterBall) : ItemId.ItemUltraBall) : ItemId.ItemGreatBall) : ItemId.ItemPokeBall;
    }

    public async Task<List<ItemData>> GetItems()
    {
      GetInventoryResponse inventory = await this._client.Inventory.GetInventory();
      await Core.GetRandomDelay();
      return inventory.InventoryDelta.InventoryItems.Select<InventoryItem, ItemData>((Func<InventoryItem, ItemData>) (i =>
      {
        InventoryItemData inventoryItemData = i.InventoryItemData;
        if (inventoryItemData == null)
          return (ItemData) null;
        return inventoryItemData.Item;
      })).Where<ItemData>((Func<ItemData, bool>) (p => p != null)).ToList<ItemData>();
    }

    public int GetItemAmountByType(List<ItemData> items, ItemId type)
    {
      ItemData itemData = items.FirstOrDefault<ItemData>((Func<ItemData, bool>) (i => i.ItemId == type));
      if (itemData == null)
        return 0;
      return itemData.Count;
    }

    internal enum MessageType
    {
      Default,
      PokemonCaught,
      PokemonGotAway,
      PokemonIgnored,
    }

    public delegate void ErrorEventHandler(object sender, Exception exception);

    public delegate void ReportEventHandler(object sender, string message, Core.MessageType messageType);

    public delegate void SnipeFinishedEventHandler(object sender);

    public delegate void LoginEventHandler(object sender, bool success);

    internal enum CriticalStateType
    {
      Error,
      NoBalls,
      FullPokemonInventory,
    }

    public delegate void CriticalStateEventHandler(object sender, Core.CriticalStateType type);
  }
}
