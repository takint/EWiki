using System;
using System.Threading.Tasks;
using PokemonGo.RocketAPI.Exceptions;
using System.Reflection;
using System.Net;
using System.Text.RegularExpressions;
using System.Threading;
using System.Collections.Generic;
using System.IO;
using PokemonGo.RocketAPI.Console.Helper;
using PokemonGo.RocketAPI.Logic.Utils;
using POGOProtos.Enums;
using System.Device.Location;
using System.Globalization;
using System.Net.Mime;
using PokemonGo.RocketAPI;
using PokemonGo.RocketAPI.Console;
using PokemonGo.RocketAPI.Enums;
using PokemonGo.RocketAPI.Logging;
using PokemonGo.RocketAPI.Logic;
using POGOProtos.Settings;
using SuperSocket.SocketBase;
using SuperWebSocket;

namespace EWiki.Sniper
{
    internal class Program
    {
        private static WebSocketServer _webSocketServer;

        public static string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Configs");
        public static string path_translation = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Translations");
        public static string path_device = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Device");
        public static string account = Path.Combine(path, "Config.txt");
        public static string items = Path.Combine(path, "Items.txt");
        public static string throws = Path.Combine(path, "Throws.txt");
        public static string walkSetting = Path.Combine(path, "walk.txt");
        public static string keep = Path.Combine(path, "noTransfer.txt");
        public static string ignore = Path.Combine(path, "noCatch.txt");
        public static string evolve = Path.Combine(path, "Evolve.txt");
        public static string lastcords = Path.Combine(path, "LastCoords.txt");
        public static string huntstats = Path.Combine(path, "HuntStats.txt");
        public static string miscSettings = Path.Combine(path, "misc.txt");
        public static string deviceSettings = Path.Combine(path_device, "DeviceInfo.txt");
        public static string updateSettings = Path.Combine(path, "update.txt");
        public static string cmdCoords = string.Empty;
        public static string accountProfiles = Path.Combine(path, "Profiles.txt");
        static string logPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Logs");
        public static string pokelog = Path.Combine(logPath, "PokeLog.txt");
        public static string manualTransferLog = Path.Combine(logPath, "TransferLog.txt");
        public static string EvolveLog = Path.Combine(logPath, "EvolveLog.txt");
        public static NumberStyles numberStyles = NumberStyles.AllowDecimalPoint | NumberStyles.AllowLeadingSign;

        public static string path_pokedata = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PokeData");

        public static Logic logic;

        [STAThread]
        static void Main(string[] args)
        {
            //configureNBug();
            InitWebSocket();
            InitSniper();
        }

        private static void InitWebSocket()
        {
            Logger.ColoredConsoleWrite(ConsoleColor.Blue, "Init WebSocket");
            _webSocketServer = new WebSocketServer();
            SuperSocket.SocketBase.Config.RootConfig rootConfig = new SuperSocket.SocketBase.Config.RootConfig();
            var serverConfig = new SuperSocket.SocketBase.Config.ServerConfig();
            serverConfig.Name = "Pokit";
            serverConfig.ServerTypeName = "WebSocketService";
            serverConfig.Ip = "Any";
            serverConfig.Port = 7777;
            serverConfig.MaxRequestLength = 4096;
            serverConfig.MaxConnectionNumber = 100 * 1000;
            serverConfig.SendingQueueSize = 25;
            serverConfig.SendTimeOut = 5000;
            var socketServerFactory = new SuperSocket.SocketEngine.SocketServerFactory();
            _webSocketServer.Setup(rootConfig, serverConfig, socketServerFactory);
            _webSocketServer.Start();
            _webSocketServer.NewMessageReceived += new SessionHandler<WebSocketSession, string>(socketServer_NewMessageReceived);
            _webSocketServer.NewSessionConnected += socketServer_NewSessionConnected;
            _webSocketServer.SessionClosed += socketServer_SessionClosed;
        }

        private static void socketServer_NewSessionConnected(WebSocketSession session)
        {
            session.Send($"Connected");
        }

        private static void socketServer_SessionClosed(WebSocketSession session, CloseReason closeReason)
        {
            session.Send($"Closed");
        }

        private static async void socketServer_NewMessageReceived(WebSocketSession session, string value)
        {
            try
            {
                var matches = Regex.Matches(value, @"(\[(\w*)\=((\w|\.|\-)*)\])");
                if (matches.Count > 0)
                {
                    var actionParameter = matches[0].Value;
                    var action = actionParameter.Split('=')[1].Replace("]", "");
                    if (action == "Snipe")
                    {
                        var pokemonId = (PokemonId)Enum.Parse(typeof(PokemonId), matches[1].Value.Split('=')[1].Replace("]", ""));
                        var latitude = double.Parse(matches[2].Value.Split('=')[1].Replace("]", ""));
                        var longitude = double.Parse(matches[3].Value.Split('=')[1].Replace("]", ""));
                        await Snipe(pokemonId, latitude, longitude, session);
                    }
                }
            }
            catch (Exception e)
            {
                session.Send("People talking without speaking");
            }
        }

        private static void InitSniper(string cords = null)
        {
            SleepHelper.PreventSleep();
            if (!string.IsNullOrEmpty(cords))
            {
                Logger.ColoredConsoleWrite(ConsoleColor.Green, $"Found coordinates in command line: {cords}");
                if (File.Exists(lastcords))
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Yellow, "Last coords file exists, trying to delete it");
                    File.Delete(lastcords);
                }

                cmdCoords = cords;
            }

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);

            }

            if (!Directory.Exists(logPath))
            {
                Directory.CreateDirectory(logPath);

            }

            if (!Directory.Exists(path_device))
            {
                Directory.CreateDirectory(path_device);

            }

            if (!Directory.Exists(path_translation))
            {
                Directory.CreateDirectory(path_translation);

            }

            if (!File.Exists(pokelog))
            {
                File.Create(pokelog).Close();
            }

            if (!File.Exists(manualTransferLog))
            {
                File.Create(manualTransferLog).Close();
            }

            if (!File.Exists(EvolveLog))
            {
                File.Create(EvolveLog).Close();
            }

            //if (args != null && args.Length > 0 && args[0].Contains("-nogui"))
            //{
            Logger.ColoredConsoleWrite(ConsoleColor.Blue, "Init Sniper");
            int i = 1;
            if (File.Exists(account))
            {
                string[] lines = File.ReadAllLines(@account);
                foreach (string line in lines)
                {
                    try
                    {
                        switch (i)
                        {
                            case 1:
                                if (line == "Google")
                                    Globals.acc = AuthType.Google;
                                else
                                    Globals.acc = AuthType.Ptc;
                                break;
                            case 2:
                                Globals.username = line;
                                break;
                            case 3:
                                Globals.password = line;
                                break;
                            case 4:
                                if (line.Split('.').Length - 1 > 1)
                                { // Coords in one line, comma-delimited.
                                    string[] crdParts = line.Split(',');
                                    Globals.latitute = double.Parse(crdParts[0].Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                    Globals.longitude = double.Parse(crdParts[1].Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                    i++;
                                }
                                else
                                {
                                    Globals.latitute = double.Parse(line.Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                }
                                break;
                            case 5:
                                Globals.longitude = double.Parse(line.Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                break;
                            case 6:
                                Globals.altitude = double.Parse(line.Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                break;
                            case 7:
                                Globals.speed = double.Parse(line.Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                                break;
                            case 8:
                                Globals.radius = int.Parse(line);
                                break;
                            case 9:
                                Globals.defLoc = bool.Parse(line);
                                break;
                            case 10:
                                Globals.transfer = bool.Parse(line);
                                break;
                            case 11:
                                Globals.duplicate = int.Parse(line);
                                break;
                            case 12:
                                Globals.evolve = bool.Parse(line);
                                break;
                            case 13:
                                Globals.maxCp = int.Parse(line);
                                break;
                            case 14:
                                Globals.telAPI = line;
                                break;
                            case 15:
                                Globals.telName = line;
                                break;
                            case 16:
                                Globals.telDelay = int.Parse(line);
                                break;
                            case 17:
                                //Globals.telDelay = int.Parse(line);
                                // NavigationOption...
                                break;
                            case 18:
                                Globals.useluckyegg = bool.Parse(line);
                                break;
                            case 19:

                                break;
                            case 20:
                                Globals.useincense = bool.Parse(line);
                                break;
                            case 21:
                                Globals.ivmaxpercent = int.Parse(line);
                                break;
                            case 22:
                                Globals.pokeList = bool.Parse(line);
                                break;
                            case 23:
                                Globals.keepPokemonsThatCanEvolve = bool.Parse(line);
                                break;
                            case 24:
                                //Globals.pokevision = bool.Parse(line);
                                break;
                            case 25:
                                Globals.useluckyegg = bool.Parse(line);
                                break;
                            case 26:
                                Globals.autoIncubate = bool.Parse(line);
                                break;
                            case 27:
                                Globals.useBasicIncubators = bool.Parse(line);
                                break;
                            case 28:
                                Globals.TransferFirstLowIV = bool.Parse(line);
                                break;
                            case 34:
                                Globals.usePwdEncryption = bool.Parse(line);
                                break;
                                //case 35:
                                //    Globals.itemsList = bool.Parse(line);
                                //    break;
                        }
                    }
                    catch (Exception)
                    {
                        Logger.ColoredConsoleWrite(ConsoleColor.Red, $"Problem with value: {line} (line #{i})");
                        throw;
                    }
                    i++;
                }
                if (Globals.usePwdEncryption)
                {
                    Globals.password = Encryption.Decrypt(Globals.password);
                }

                if (cmdCoords != string.Empty)
                {
                    string[] crdParts = cmdCoords.Split(',');
                    Globals.latitute = double.Parse(crdParts[0].Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                    Globals.longitude = double.Parse(crdParts[1].Replace(',', '.'), numberStyles, System.Globalization.NumberFormatInfo.InvariantInfo);
                }
                Logger.ColoredConsoleWrite(ConsoleColor.Yellow, $"Starting at: {Globals.latitute},{Globals.longitude}");
            }

            if (File.Exists(items))
            {
                string[] lines = File.ReadAllLines(@items);
                i = 1;
                foreach (string line in lines)
                {
                    switch (i)
                    {
                        case 1:
                            Globals.pokeball = int.Parse(line);
                            break;
                        case 2:
                            Globals.greatball = int.Parse(line);
                            break;
                        case 3:
                            Globals.ultraball = int.Parse(line);
                            break;
                        case 4:
                            Globals.masterball = int.Parse(line);
                            break;
                        case 5:
                            Globals.revive = int.Parse(line);
                            break;
                        case 6:
                            Globals.toprevive = int.Parse(line);
                            break;
                        case 7:
                            Globals.potion = int.Parse(line);
                            break;
                        case 8:
                            Globals.superpotion = int.Parse(line);
                            break;
                        case 9:
                            Globals.hyperpotion = int.Parse(line);
                            break;
                        case 10:
                            Globals.toppotion = int.Parse(line);
                            break;
                        case 11:
                            Globals.berry = int.Parse(line);
                            break;
                    }
                    i++;
                }
            }

            if (File.Exists(Program.throws))
            {
                string[] lines = File.ReadAllLines(@Program.throws);
                i = 1;
                foreach (string line in lines)
                {
                    switch (i)
                    {
                        case 1:
                            Globals.excellentthrow = int.Parse(line);
                            break;
                        case 2:
                            Globals.greatthrow = int.Parse(line);
                            break;
                        case 3:
                            Globals.nicethrow = int.Parse(line);
                            break;
                        case 4:
                            Globals.ordinarythrow = int.Parse(line);
                            break;
                        default:
                            break;
                    }
                    i++;
                }
            }

            if (File.Exists(keep))
            {
                string[] lines = System.IO.File.ReadAllLines(@keep);
                foreach (string line in lines)
                {
                    if (line != string.Empty)
                        Globals.noTransfer.Add((PokemonId)Enum.Parse(typeof(PokemonId), line));
                }
            }

            if (File.Exists(ignore))
            {
                string[] lines = System.IO.File.ReadAllLines(@ignore);
                foreach (string line in lines)
                {
                    if (line != string.Empty)
                        Globals.noCatch.Add((PokemonId)Enum.Parse(typeof(PokemonId), line));
                }
            }

            if (File.Exists(evolve))
            {
                string[] lines = System.IO.File.ReadAllLines(@evolve);
                foreach (string line in lines)
                {
                    if (line != string.Empty)
                        Globals.doEvolve.Add((PokemonId)Enum.Parse(typeof(PokemonId), line));
                }
            }

            //}
            //else
            //{
            //    MediaTypeNames.Application.EnableVisualStyles();
            //    MediaTypeNames.Application.SetCompatibleTextRenderingDefault(false);
            //    MediaTypeNames.Application.Run(new GUI());

            //    if (Globals.pokeList)
            //    {
            //        Task.Run(() =>
            //        {
            //            Pokemons pokemonList = new Pokemons();
            //            pokemonList.ShowDialog();
            //        });
            //    }
            //    //if (Globals.itemsList)
            //    //{
            //    //    Task.Run(() =>
            //    //    {
            //    //        Items itemsList = new Items();
            //    //        itemsList.ShowDialog();
            //    //    });
            //    //}

            //}


            Logger.SetLogger(new ConsoleLogger(LogLevel.Info));

            Globals.infoObservable.HandleNewHuntStats += SaveHuntStats;
            
            System.Console.ReadLine();
            SleepHelper.AllowSleep();
        }

        private static async Task Snipe(PokemonId pokemonId, double latitude, double longitude, WebSocketSession session)
        {
            await Task.Run(async () =>
            {

                CheckVersion();

                try
                {
                    logic = new Logic(new Settings(), Globals.infoObservable);
                }
                catch (PtcOfflineException)
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Red, "PTC Servers are probably down OR you credentials are wrong.", LogLevel.Error);
                    Logger.ColoredConsoleWrite(ConsoleColor.Red, "Trying again in 20 seconds...");
                    Thread.Sleep(20000);
                    logic = new Logic(new Settings(), Globals.infoObservable);
                }
                catch (AccountNotVerifiedException)
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Red, "Your PTC Account is not activated. Exiting in 10 Seconds.");
                    Thread.Sleep(10000);
                    Environment.Exit(0);
                }
                catch (Exception ex)
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Red, $"Unhandled exception: {ex}", LogLevel.Error);
                    Logger.Error("Restarting in 20 Seconds.");
                    Thread.Sleep(20000);
                    logic = new Logic(new Settings(), Globals.infoObservable);
                }

                await logic.SnipePokemon(pokemonId, latitude, longitude, session);
            });
        }

        private static void SaveHuntStats(string newHuntStat)
        {
            File.AppendAllText(huntstats, newHuntStat);
        }

        public static void CheckVersion()
        {
            try
            {
                var match =
                    new Regex(
                        @"\[assembly\: AssemblyVersion\(string.Empty(\d{1,})\.(\d{1,})\.(\d{1,})\.(\d{1,})string.Empty\)\]")
                        .Match(DownloadServerVersion());

                if (!match.Success) return;
                var gitVersion =
                    new Version(
                        $"{match.Groups[1]}.{match.Groups[2]}.{match.Groups[3]}.{match.Groups[4]}");
                if (gitVersion <= Assembly.GetExecutingAssembly().GetName().Version)
                {
                    //ColoredConsoleWrite(ConsoleColor.Yellow, "Awesome! You have already got the newest version! " + Assembly.GetExecutingAssembly().GetName().Version);
                    return;
                }

                Logger.ColoredConsoleWrite(ConsoleColor.Red, "There is a new Version available: " + gitVersion);
                Logger.ColoredConsoleWrite(ConsoleColor.Red, "Its recommended to use the newest Version.");
                if (cmdCoords == string.Empty)
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Red, "Starting in 10 Seconds.");
                    Thread.Sleep(10000);
                }
                else
                {
                    Logger.ColoredConsoleWrite(ConsoleColor.Yellow, "Starting right away because we are probably sniping.");
                }
            }
            catch (Exception)
            {
                Logger.ColoredConsoleWrite(ConsoleColor.White, "Unable to check for updates now...");
            }
        }

        public static Version getNewestVersion()
        {
            try
            {
                var match = DownloadServerVersion();

                var gitVersion = new Version(match);

                return gitVersion;

            }
            catch (Exception)
            {
                return Assembly.GetExecutingAssembly().GetName().Version;
            }
        }


        public static string DownloadServerVersion()
        {
            using (var wC = new WebClient())
                return
                    wC.DownloadString(
                        "https://raw.githubusercontent.com/Ar1i/PokemonGo-Bot/master/ver.md");
        }

        //private static void configureNBug()
        //{
        //    NBug.Settings.UIMode = NBug.Enums.UIMode.Auto;
        //    NBug.Settings.UIProvider = NBug.Enums.UIProvider.Auto;
        //    NBug.Settings.SleepBeforeSend = 10;
        //    NBug.Settings.MaxQueuedReports = 5;
        //    NBug.Settings.StopReportingAfter = 5;
        //    NBug.Settings.MiniDumpType = NBug.Enums.MiniDumpType.Normal;
        //    NBug.Settings.WriteLogToDisk = false;
        //    NBug.Settings.ExitApplicationImmediately = true;
        //    NBug.Settings.HandleProcessCorruptedStateExceptions = false;
        //    NBug.Settings.ReleaseMode = false;
        //    NBug.Settings.DeferredReporting = true;
        //    NBug.Settings.StoragePath = "Bugs\\";

        //    AppDomain.CurrentDomain.UnhandledException += NBug.Handler.UnhandledException;
        //}


    }
    public static class Globals
    {
        public static AuthType acc = AuthType.Google;
        public static bool defLoc = true;
        public static string username = "bongvl.vn@gmail.com";
        public static string password = "Asdcxz1+";
        public static double latitute = 40.764883;
        public static double longitude = -73.972967;
        public static double altitude = 15.173855;
        public static double speed = 15;
        public static int radius = 5000;
        public static bool transfer = true;
        public static int duplicate = 3;
        public static bool evolve = true;
        public static int maxCp = 999;
        public static int excellentthrow = 25;
        public static int greatthrow = 25;
        public static int nicethrow = 25;
        public static int ordinarythrow = 25;
        public static int pokeball = 100;
        public static int greatball = 100;
        public static int ultraball = 100;
        public static int masterball = 0;
        public static int revive = 100;
        public static int potion = 100;
        public static int superpotion = 100;
        public static int hyperpotion = 100;
        public static int toppotion = 100;
        public static int toprevive = 100;
        public static int berry = 100;
        public static int ivmaxpercent = 0;
        public static bool _pauseTheWalking = false;
        private static bool _pauseAtWalking = false;
        public static bool pauseAtWalking
        {
            get
            {
                return _pauseAtWalking;
            }
            set
            {
                if (Logic._instance != null)
                {
                    Logic._instance.pauseWalking = value;
                    _pauseAtWalking = value;
                }
            }
        }

        public static List<PokemonId> noTransfer = new List<PokemonId>();
        public static List<PokemonId> noCatch = new List<PokemonId>();
        public static List<PokemonId> doEvolve = new List<PokemonId>();
        public static string telAPI = string.Empty;
        public static string telName = string.Empty;
        public static int telDelay = 5000;
        public static bool pauseAtPokeStop = false;
        public static bool farmPokestops = true;
        public static bool CatchPokemon = true;
        public static bool BreakAtLure = false;
        public static bool UseAnimationTimes = true;
        public static bool UseLureAtBreak = false;
        public static bool UseGoogleMapsAPI = false;
        public static string GoogleMapsAPIKey;
        public static bool RandomReduceSpeed = false;
        public static bool UseBreakFields = false;
        public static double TimeToRun;
        public static int PokemonCatchLimit = 1000;
        public static int PokestopFarmLimit = 2000;
        public static int XPFarmedLimit = 150000;
        public static int BreakInterval = 0;
        public static int BreakLength = 0;
        public static int MinWalkSpeed = 5;
        public static int navigation_option = 1;
        public static bool useluckyegg = true;
        public static bool useincense = true;
        public static bool userazzberry = true;
        public static double razzberry_chance = 0.35;
        public static bool pokeList = true;
        //public static bool itemsList = false;
        public static bool keepPokemonsThatCanEvolve = true;
        public static bool TransferFirstLowIV = true;
        public static bool pokevision = false;

        //public static bool CatchLurePokemons = false;

        public static bool useLuckyEggIfNotRunning = false;

        public static bool autoIncubate = true;
        public static bool useBasicIncubators = false;

        public static bool sleepatpokemons = true;

        public static string settingsLanguage = "en";

        public static LogicInfoObservable infoObservable = new LogicInfoObservable();

        public static bool Espiral = false;

        public static bool MapLoaded = false;

        public static bool logPokemons = false;

        public static LinkedList<GeoCoordinate> NextDestinationOverride = new LinkedList<GeoCoordinate>();

        public static LinkedList<GeoCoordinate> RouteToRepeat = new LinkedList<GeoCoordinate>();

        public static bool RepeatUserRoute = false;

        public static bool logManualTransfer = false;

        public static bool UseLureGUIClick = false;

        public static bool UseLuckyEggGUIClick = false;

        public static bool UseIncenseGUIClick = false;

        public static bool RelocateDefaultLocation = false;

        public static double RelocateDefaultLocationTravelSpeed = 0;

        public static bool bLogEvolve = false;

        public static bool LogEggs = false;

        public static bool pauseAtEvolve = false;

        public static bool pauseAtEvolve2 = false;

        public static bool AutoUpdate = false;

        public static bool usePwdEncryption = false;

        public static bool CheckWhileRunning = false;
    }
}
