using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Android.Util;
using EWiki.XF.Droid.LocationFeeder.Common;
using EWiki.XF.Droid.LocationFeeder.Config;
using EWiki.XF.Droid.LocationFeeder.Helper;
using EWiki.XF.Models.Enum;
using Xamarin.Forms;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{

    public class SniperInfoRepositoryManager
    {
        private readonly SniperInfoRepository _sniperInfoRepository;
        const string timeFormat = "HH:mm:ss";

        public SniperInfoRepositoryManager(SniperInfoRepository sniperInfoRepository)
        {
            _sniperInfoRepository = sniperInfoRepository;
        }

        public bool AddToRepository(SniperInfo sniperInfo)
        {
            var oldSniperInfo = _sniperInfoRepository.Find(sniperInfo);
            if (oldSniperInfo != null)
            {
                if (!ValidateVerifiedSniperInfo(oldSniperInfo))
                {
                    AddCaptureExisting(oldSniperInfo, sniperInfo);
                }
                else
                {
                    AddDuplicateDiscovery(oldSniperInfo, sniperInfo);
                }
                return false;
            }
            else
            {
                AddNew(sniperInfo);
                return true;
            }
        }

        private void AddCaptureExisting(SniperInfo oldSniperInfo, SniperInfo sniperInfo)
        {
            if (PokemonId.Missingno.Equals(oldSniperInfo.PokemonId))
            {
                oldSniperInfo.PokemonId = sniperInfo.PokemonId;
            }
            if (oldSniperInfo.IV <= 0 && sniperInfo.IV > 0)
            {
                oldSniperInfo.IV = sniperInfo.IV;
            }
            if (!oldSniperInfo.Verified)
            {
                if (sniperInfo.Verified)
                {
                    oldSniperInfo.Verified = sniperInfo.Verified;
                    oldSniperInfo.VerifiedOn = DateTime.Now;


                }
                if (sniperInfo.ChannelInfo != null &&
                    !oldSniperInfo.GetAllChannelInfos()
                        .Any(ci => object.Equals(ci.server, sniperInfo.ChannelInfo.server)
                                    && (object.Equals(ci.channel, sniperInfo.ChannelInfo.channel))))
                {
                    oldSniperInfo.OtherChannelInfos.Add(sniperInfo.ChannelInfo);
                }
            }
            if (oldSniperInfo.Move1 == PokemonMove.MoveUnset)
            {
                if (sniperInfo.Move1 != PokemonMove.MoveUnset)
                {
                    oldSniperInfo.Move1 = sniperInfo.Move1;
                }
            }
            if (oldSniperInfo.Move2 == PokemonMove.MoveUnset)
            {
                if (sniperInfo.Move2 != PokemonMove.MoveUnset)
                {
                    oldSniperInfo.Move2 = sniperInfo.Move2;
                }
            }
            if (oldSniperInfo.EncounterId == default(ulong))
            {
                if (sniperInfo.EncounterId != default(ulong))
                {
                    oldSniperInfo.EncounterId = sniperInfo.EncounterId;
                }
            }

            if (oldSniperInfo.SpawnPointId == default(string))
            {
                if (sniperInfo.SpawnPointId != default(string))
                {
                    oldSniperInfo.SpawnPointId = sniperInfo.SpawnPointId;
                }
            }
            if (oldSniperInfo.ExpirationTimestamp == default(DateTime))
            {
                if (sniperInfo.ExpirationTimestamp != default(DateTime))
                {
                    oldSniperInfo.VerifiedOn = sniperInfo.ExpirationTimestamp;
                }
            }
            var captures = _sniperInfoRepository.Increase(oldSniperInfo);
            Log.Info("", $"Captured existing: {FormatPokemonLog(oldSniperInfo, captures)}");
        }

        public static bool ValidateVerifiedSniperInfo(SniperInfo sniperInfo)
        {
            return !PokemonId.Missingno.Equals(sniperInfo.PokemonId)
                && sniperInfo.Verified
                && sniperInfo.EncounterId != default(ulong)
                && sniperInfo.Move1 != PokemonMove.MoveUnset
                && sniperInfo.Move2 != PokemonMove.MoveUnset
                && (sniperInfo.SpawnPointId != null && sniperInfo.SpawnPointId != "")
                && sniperInfo.IV > 0;
        }

        private void AddDuplicateDiscovery(SniperInfo oldSniperInfo, SniperInfo sniperInfo)
        {
            bool updated = false;
            if (PokemonId.Missingno.Equals(oldSniperInfo.PokemonId) && !PokemonId.Missingno.Equals(sniperInfo.PokemonId))
            {
                oldSniperInfo.PokemonId = sniperInfo.PokemonId;
                updated = true;
            }
            if (sniperInfo.ChannelInfo != null && !oldSniperInfo.GetAllChannelInfos().Any(ci => object.Equals(ci.server, sniperInfo.ChannelInfo.server)
             && (object.Equals(ci.channel, sniperInfo.ChannelInfo.channel))))
            {
                oldSniperInfo.OtherChannelInfos.Add(sniperInfo.ChannelInfo);
                updated = true;
            }
            if (updated)
            {
                var captures = _sniperInfoRepository.Update(oldSniperInfo);
                Log.Debug("", $"Discovered (DUP): {FormatPokemonLog(oldSniperInfo, captures)}");
            }
        }

        private void AddNew(SniperInfo sniperInfo)
        {
            var captures = _sniperInfoRepository.Update(sniperInfo);
            Log.Info("", $"Discovered: {FormatPokemonLog(sniperInfo, captures)}");

            var message = new PokemonResultFetchedMessage
            {
                Pokemons = new List<Models.SniperInfo>()
                {
                    new Models.SniperInfo
                    {
                        PokemonId = sniperInfo.PokemonId,
                        ChannelName = sniperInfo.ChannelInfo?.channel,
                        EncounterId = sniperInfo.EncounterId,
                        ExpirationTimestamp = sniperInfo.ExpirationTimestamp,
                        TrueExpirationTimestamp = sniperInfo.ExpirationTimestamp > DateTime.MinValue,
                        IV = sniperInfo.IV,
                        Latitude = sniperInfo.Latitude,
                        Longitude = sniperInfo.Longitude,
                        Move1 = sniperInfo.Move1,
                        Move2 = sniperInfo.Move2,
                        NeedVerification = sniperInfo.NeedVerification,
                        ReceivedTimeStamp = sniperInfo.ReceivedTimeStamp,
                        SpawnPointId = sniperInfo.SpawnPointId,
                        Verified = sniperInfo.Verified,
                        VerifiedOn = sniperInfo.VerifiedOn
                    }
                }
            };
            Device.BeginInvokeOnMainThread(
                () => MessagingCenter.Send(message, "PokemonResultFetched")
            ); ;
        }

        private static string FormatPokemonLog(SniperInfo sniperInfo, int captures)
        {
            return $"{sniperInfo.ChannelInfo}: {sniperInfo.PokemonId} at {sniperInfo.Latitude.ToString("N6", CultureInfo.InvariantCulture)},{sniperInfo.Longitude.ToString("N6", CultureInfo.InvariantCulture)}"
                   + " with " +
                   (!sniperInfo.IV.Equals(default(double))
                       ? $"{sniperInfo.IV}% IV"
                       : "unknown IV")
                   + (sniperInfo.Move1 != PokemonMove.MoveUnset ? $" Move1: {sniperInfo.Move1.ToString()}" : "")
                   + (sniperInfo.Move2 != PokemonMove.MoveUnset ? $" Move2: {sniperInfo.Move2.ToString()}" : "")
                   + (sniperInfo.EncounterId != default(ulong) ? $" EncounterId: {sniperInfo.EncounterId.ToString()}" : "")
                   + (sniperInfo.ExpirationTimestamp != default(DateTime)
                       ? $" until {sniperInfo.ExpirationTimestamp.ToString(timeFormat)}"
                       : "") + $", Captures {captures}";
        }
    }
}