// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.UserSettingsXml
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using POGOProtos.Enums;
using POGOProtos.Networking.Envelopes;
using PokemonGo.RocketAPI;
using PokemonGo.RocketAPI.Enums;
using PokemonGo.RocketAPI.Extensions;
using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Threading.Tasks;
using Newtonsoft.Json;
using POGOProtos.Inventory.Item;

namespace EWiki.Websocket.Sniper
{
  public class UserSettingsXml
  {
    public AuthType AuthType { get; set; }

    public double DefaultLatitude { get; set; }

    public double DefaultLongitude { get; set; }

    public double DefaultAltitude { get; set; }

    public string GoogleRefreshToken { get; set; }

    public string PtcPassword { get; set; }

    public string PtcUsername { get; set; }

    public string GoogleUsername { get; set; }

    public string GooglePassword { get; set; }

    public bool ShowUsernameInTitle { get; set; }

    public bool RequireURLConfirmation { get; set; }

    public UserSettingsXml.AutoSniperSettingsXml AutoSniper { get; set; }

    public UserSettingsXml()
    {
      this.RequireURLConfirmation = true;
    }

    public ISettings ToCompatSettings()
    {
      return (ISettings) new UserSettingsXml.SettingsCompat()
      {
        AuthType = this.AuthType,
        DefaultLatitude = this.DefaultLatitude,
        DefaultLongitude = this.DefaultLongitude,
        DefaultAltitude = this.DefaultAltitude,
        GoogleRefreshToken = this.GoogleRefreshToken,
        PtcPassword = this.PtcPassword,
        PtcUsername = this.PtcUsername,
        GoogleUsername = this.GoogleUsername,
        GooglePassword = this.GooglePassword
      };
    }

    public class AutoSniperSettingsXml
    {
      public int MinCPToCatch { get; set; }

      public int MinIVToCatch { get; set; }

      public int Delay { get; set; }

      public bool CheckPokemon { get; set; }

      public bool CatchEverything { get; set; }

            [JsonIgnore]
      public List<PokemonId> PokemonToCatch { get; set; }

      public AutoSniperSettingsXml()
      {
        this.Delay = 10000;
        this.CheckPokemon = true;
      }
    }

    public class SettingsCompat : ISettings
    {
      public AuthType AuthType { get; set; }

      public double DefaultLatitude { get; set; }

      public double DefaultLongitude { get; set; }

      public double DefaultAltitude { get; set; }
        public bool UseLastCords { get; }
        public bool WalkBackToDefaultLocation { get; }
        public double RelocateDefaultLocationTravelSpeed { get; set; }
        public bool RelocateDefaultLocation { get; set; }
        public int MaxWalkingRadiusInMeters { get; }
        public bool FarmPokestops { get; set; }
        public bool CatchPokemon { get; set; }
        public bool UseLureAtBreak { get; set; }
        public bool UseGoogleMapsAPI { get; set; }
        public bool pauseAtPokeStop { get; set; }
        public bool BreakAtLure { get; set; }
        public bool RandomReduceSpeed { get; set; }
        public bool UseBreakFields { get; set; }
        public bool Espiral { get; set; }
        public bool RepeatUserRoute { get; set; }
        public int XPFarmedLimit { get; set; }
        public int BreakInterval { get; set; }
        public int BreakLength { get; set; }
        public int MinWalkSpeed { get; set; }
        public int PokemonCatchLimit { get; set; }
        public int PokestopFarmLimit { get; set; }
        public int navigation_option { get; }
        public double WalkingSpeedInKilometerPerHour { get; }
        public LinkedList<GeoCoordinate> NextDestinationOverride { get; set; }
        public LinkedList<GeoCoordinate> RouteToRepeat { get; set; }
        public bool EvolvePokemonsIfEnoughCandy { get; }
        public bool TransferDoublePokemons { get; }
        public bool TransferFirstLowIV { get; }
        public int DontTransferWithCPOver { get; }
        public bool sleepatpokemons { get; }
        public bool keepPokemonsThatCanEvolve { get; }
        public int HoldMaxDoublePokemons { get; }
        public bool UseLuckyEgg { get; }
        public bool UseRazzBerry { get; }
        public double razzberry_chance { get; }
        public bool UseLuckyEggIfNotRunning { get; }
        public bool UseIncense { get; }
        public bool AutoIncubate { get; }
        public bool UseBasicIncubators { get; }
        public bool UseProxyVerified { get; set; }
        public bool UseProxyAuthentication { get; set; }
        public int UseProxyPort { get; set; }
        public string UseProxyHost { get; set; }
        public string UseProxyUsername { get; set; }
        public string UseProxyPassword { get; set; }
        public int Pb_Excellent { get; set; }
        public int Pb_Great { get; set; }
        public int Pb_Nice { get; set; }
        public int Pb_Ordinary { get; set; }
        public bool logPokemons { get; set; }
        public bool logManualTransfer { get; set; }
        public bool bLogEvolve { get; set; }
        public bool logEggs { get; set; }
        public bool autoUpdate { get; set; }
        public bool CheckWhileRunning { get; set; }
        public int TelegramLiveStatsDelay { get; }
        public string TelegramAPIToken { get; }
        public string TelegramName { get; }
        public bool pokevision { get; }
        public bool UseAnimationTimes { get; set; }
        public bool MapLoaded { get; set; }
        public bool pauseTheWalking { get; set; }
        public bool pauseAtEvolve2 { get; set; }
        public bool UseLureGUIClick { get; set; }
        public bool UseIncenseGUIClick { get; set; }
        public bool UseLuckyEggGUIClick { get; set; }
        public double TimeToRun { get; set; }
        public int ivmaxpercent { get; }
        public string SelectedLanguage { get; }
        public string GoogleMapsAPIKey { get; }
        public ICollection<KeyValuePair<ItemId, int>> itemRecycleFilter { get; set; }
        public List<PokemonId> pokemonsToHold { get; set; }
        public List<PokemonId> pokemonsToEvolve { get; set; }
        public List<PokemonId> catchPokemonSkipList { get; }

        public string GoogleRefreshToken { get; set; }

      public string PtcPassword { get; set; }

      public string PtcUsername { get; set; }

      public string GoogleUsername { get; set; }

      public string GooglePassword { get; set; }
    }

    public class Failure : IApiFailureStrategy
    {
      private int _retryCount;

      public async Task<ApiOperation> HandleApiFailure(RequestEnvelope request, ResponseEnvelope response)
      {
        if (this._retryCount > 10)
          return ApiOperation.Abort;
        await Task.Delay(new Random().Next(150, 300));
        this._retryCount = this._retryCount + 1;
        return ApiOperation.Retry;
      }

      public void HandleApiSuccess(RequestEnvelope request, ResponseEnvelope response)
      {
        this._retryCount = 0;
      }
    }
  }
}
