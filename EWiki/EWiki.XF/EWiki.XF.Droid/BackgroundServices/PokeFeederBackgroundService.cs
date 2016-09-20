using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Util;
using Android.Views;
using Android.Widget;
using EWiki.XF.Droid.LocationFeeder.Common;
using EWiki.XF.Droid.LocationFeeder.Config;
using EWiki.XF.Droid.LocationFeeder.Helper;
using Newtonsoft.Json;
using WebSocket4Net;
using Xamarin.Forms;

namespace EWiki.XF.Droid.BackgroundServices
{
    [Service]
    public class PokeFeederBackgroundService : Service
    {
        private readonly ChannelParser _channelParser = new ChannelParser();
        private CancellationTokenSource _cts;

        public static ConcurrentQueue<SniperInfo> sniperInfosToSend = new ConcurrentQueue<SniperInfo>();

        public override IBinder OnBind(Intent intent)
        {
            return null;
        }

        public override StartCommandResult OnStartCommand(Intent intent, StartCommandFlags flags, int startId)
        {
            _cts = new CancellationTokenSource();

            Task.Run(() =>
            {
                try
                {
                    while (!_cts.IsCancellationRequested)
                    {
                        var running = true;
                        while (running)
                        {
                            using (
                                var client =
                                    new WebSocket(
                                        $"ws://{GlobalSettings.ServerHost}:{GlobalSettings.ServerPort}",
                                        "basic", WebSocketVersion.Rfc6455))
                            {
                                long timeStamp = GetEpoch15MinAgo();

                                client.Opened += (s, e) =>
                                {
                                    var filter =
                                        JsonConvert.SerializeObject(FilterFactory.Create(_channelParser.Settings));

                                    client.Send($"{timeStamp}:I've come to talk with you again:{filter}");
                                    GlobalSettings.Output?.SetStatus(
                                        $"Connected to: {GlobalSettings.ServerHost}");
                                };

                                client.Closed += (s, e) =>
                                {
                                    Log.Warn("", "Connection to server lost");
                                    GlobalSettings.Output?.SetStatus(
                                        $"Connection lost: {GlobalSettings.ServerHost}");
                                    running = false;
                                };
                                client.MessageReceived += (s, e) =>
                                {
                                    try
                                    {
                                        var match = Regex.Match(e.Message,
                                            @"^(1?\d+)\:(?:Hear my words that I might teach you)\:(2?.*)$");
                                        var matchDarkness = Regex.Match(e.Message,
                                            @"^(1?\d+)\:(?:Hello Darkness my old friend\.)\:(2?.*)$");

                                        if (match.Success)
                                        {
                                            timeStamp = Convert.ToInt64(match.Groups[1].Value);
                                            var sniperInfos =
                                                JsonConvert.DeserializeObject<List<SniperInfo>>(
                                                    match.Groups[2].Value);
                                            Log.Info("",
                                                $"Received {sniperInfos.Count} pokemon from server");


                                            // Got the results, notify to the subscriber (the subscriber in this case is LocationFeederTabViewModel)
                                            var message = new PokemonResultFetchedMessage
                                            {
                                                Pokemons = sniperInfos.Select(sniperInfo => new Models.SniperInfo()
                                                {
                                                    Id = sniperInfo.Id,
                                                    Name = sniperInfo.Id.ToString(),
                                                    ChannelName = sniperInfo.ChannelInfo.channel,
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
                                                }).ToList()
                                            };

                                            Device.BeginInvokeOnMainThread(
                                                () => MessagingCenter.Send(message, "PokemonResultFetched")
                                                );
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Log.Error("Error", ex.Message);
                                    }
                                };
                                client.Error += (s, e) =>
                                {
                                    //Log.Warn($"Client error rec: {e.Exception}");

                                };
                                client.Open();
                            }
                            Log.Info("", "Reconnecting to stream in 10 seconds");
                            Thread.Sleep(10000);
                        }
                    }
                }
                catch (Android.OS.OperationCanceledException)
                {
                }
                finally
                {
                    if (_cts.IsCancellationRequested)
                    {
                        var message = new CancelledMessage();
                        Device.BeginInvokeOnMainThread(
                            () => MessagingCenter.Send(message, "CancelledMessage")
                            );
                    }
                }
            }, _cts.Token);

                               return StartCommandResult.Sticky;
        }

        private static long GetEpoch15MinAgo()
        {
            return (long)DateTime.Now.AddMinutes(-15).ToUniversalTime().Subtract(new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalMilliseconds;
        }

        private static long GetEpochNow()
        {
            return (long)DateTime.Now.ToUniversalTime().Subtract(new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalMilliseconds;
        }

        public override void OnDestroy()
        {
            base.OnDestroy();
        }
    }
}