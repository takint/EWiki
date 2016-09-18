// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.PokeCoords
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using POGOProtos.Enums;
using System;

namespace EWiki.Websocket.Sniper
{
  public class PokeCoords
  {
    public PokemonId PokemonId { get; set; }

    public double Latitude { get; set; }

    public double Longitude { get; set; }

    public DateTime Until { get; set; }

    public bool IsAlive
    {
      get
      {
        return this.Until.Subtract(DateTime.UtcNow).TotalSeconds - 5.0 > 0.0;
      }
    }

    protected bool Equals(PokeCoords other)
    {
      if (this.PokemonId == other.PokemonId && this.Latitude.Equals(other.Latitude))
        return this.Longitude.Equals(other.Longitude);
      return false;
    }

    public override bool Equals(object obj)
    {
      if (obj == null)
        return false;
      if (this == obj)
        return true;
      if (obj.GetType() != this.GetType())
        return false;
      return this.Equals((PokeCoords) obj);
    }

    public override int GetHashCode()
    {
      return ((int) this.PokemonId * 397 ^ this.Latitude.GetHashCode()) * 397 ^ this.Longitude.GetHashCode();
    }
  }
}
