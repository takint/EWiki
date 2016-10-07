using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
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
using EWiki.XF.Droid.LocationFeeder.Repository;
using EWiki.XF.Models.Enum;
using Newtonsoft.Json;
using Quobject.Collections.Immutable;
using Quobject.SocketIoClientDotNet.Client;
using WebSocket4Net;
using Xamarin.Forms;

namespace EWiki.XF.Droid.BackgroundServices
{
    [Service]
    public class PokeFeederBackgroundService : Service
    {
        private CancellationTokenSource _cts;
        private readonly SniperInfoRepository _serverRepository;
        private readonly SniperInfoRepositoryManager _sniperInfoRepositoryManager;

        public PokeFeederBackgroundService()
        {
            _serverRepository = new SniperInfoRepository();
            _sniperInfoRepositoryManager = new SniperInfoRepositoryManager(_serverRepository);
        }

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
                        var newSniperInfos = new List<SniperInfo>();

                        var options = new IO.Options
                        {
                            Transports = ImmutableList.Create("websocket")
                        };

                        var socket = IO.Socket("http://pokezz.com", options);
                        socket.On("a", msg =>
                        {
                            socket.Close();
                            var pokemonDefinitions = ((string)msg).Split('~');
                            foreach (var pokemonDefinition in pokemonDefinitions)
                            {
                                try
                                {
                                    var pokemonDefinitionElements = pokemonDefinition.Split('|');
                                    var expiration =
                                        new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc).AddSeconds(
                                                Convert.ToDouble(pokemonDefinitionElements[3], CultureInfo.InvariantCulture))
                                            .ToLocalTime();
                                    var pokezzElement = new SniperInfo()
                                    {
                                        PokemonId =
                                            (PokemonId)Convert.ToInt32(pokemonDefinitionElements[0], CultureInfo.InvariantCulture),
                                        Latitude = Convert.ToDouble(pokemonDefinitionElements[1], CultureInfo.InvariantCulture),
                                        Longitude = Convert.ToDouble(pokemonDefinitionElements[2], CultureInfo.InvariantCulture),
                                        ExpirationTimestamp = expiration,
                                        Verified = pokemonDefinitionElements[4] != "0",
                                        Move1 = string.IsNullOrEmpty(pokemonDefinitionElements[5]) ? PokemonMove.MoveUnset : (PokemonMove)Enum.Parse(typeof(PokemonMove), pokemonDefinitionElements[5].Split(',')[0].Trim()),
                                        Move2 = string.IsNullOrEmpty(pokemonDefinitionElements[5]) ? PokemonMove.MoveUnset : (PokemonMove)Enum.Parse(typeof(PokemonMove), pokemonDefinitionElements[5].Split(',')[1].Trim()),
                                        IV = string.IsNullOrEmpty(pokemonDefinitionElements[6]) ? 0 : Convert.ToDouble(pokemonDefinitionElements[6]),
                                        ChannelInfo = new ChannelInfo() { channel = "PokeZZ" }
                                    };
                                    newSniperInfos.Add(pokezzElement);
                                }
                                catch (Exception e)
                                {
                                    // Just in case Pokezz changes their implementation, let's catch the error and set the error flag.
                                    continue;
                                }
                            }
                            WriteOutListeners(newSniperInfos);
                        });
                        Log.Info("", "Reconnecting to stream in 10 seconds");
                        Thread.Sleep(10000);
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

        private void WriteOutListeners(List<SniperInfo> sniperInfos)
        {
            List<SniperInfo> sniperInfosToSend = sniperInfos;
            sniperInfosToSend = sniperInfosToSend.OrderBy(m => m.ExpirationTimestamp).ToList();
            foreach (SniperInfo sniperInfo in sniperInfosToSend)
            {
                _sniperInfoRepositoryManager.AddToRepository(sniperInfo);
            }
        }
    }
}