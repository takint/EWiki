// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Sniper
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using POGOProtos.Enums;
using PokemonGo.RocketAPI;
using PokemonGo.RocketAPI.Enums;
using PokemonGo.RocketAPI.Exceptions;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace EWiki.Websocket.Sniper
{
    internal class Sniper
    {
        private static bool isWorking = true;
        private static string _logFile = "EWiki.Websocket.Sniper.log";
        private static Core _core;

        internal static void Exec(string[] args)
        {
            Console.Title = "EWiki.Websocket.Sniper v1.12";
            Sniper.PrintIntro();
            if (args.Length >= 1 && args[0].Contains("pokesniper2"))
            {
                string uri = string.Join("", args);
                Sniper.ParsedUri scheme = Sniper.TryParseScheme(uri);
                if (scheme != null)
                {
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.WriteLine("Received URL: {0}", (object)uri);
                    Console.WriteLine("Will now snipe a {0} at {1}, {2}.", (object)scheme.Pokemon, (object)scheme.Latitude, (object)scheme.Longitude);
                    Console.ForegroundColor = ConsoleColor.Gray;
                    Sniper.ModeOnline(scheme);
                }
                else
                    Sniper.PrintSimpleMessage("Could not read link: " + uri, true);
                Sniper.PrintExit();
                Console.ReadKey();
            }
            else
            {
                if (args.Length == 1)
                {
                    string str = args[0];
                    if (!(str == "-autosniping"))
                    {
                        if (!(str == "-registerurl"))
                        {
                            if (str == "-removeurl")
                            {
                                if (!Util.IsAdmin())
                                {
                                    Sniper.PrintSimpleMessage("Administrator is required to remove the EWiki.Websocket.Sniper URL handler.", false);
                                    Process.Start(new ProcessStartInfo(Process.GetCurrentProcess().MainModule.FileName)
                                    {
                                        UseShellExecute = true,
                                        Verb = "runas",
                                        Arguments = "-removeurl"
                                    });
                                    Environment.Exit(0);
                                    return;
                                }
                                Util.UnregisterUriScheme();
                                Sniper.PrintColorMessage("Removed the EWiki.Websocket.Sniper URL handler.", ConsoleColor.Green);
                                Sniper.PrintExit();
                                Console.ReadKey();
                                return;
                            }
                        }
                        else
                        {
                            if (!Util.IsAdmin())
                            {
                                Sniper.PrintSimpleMessage("Administrator is required to register the EWiki.Websocket.Sniper URL handler.", false);
                                Process.Start(new ProcessStartInfo(Process.GetCurrentProcess().MainModule.FileName)
                                {
                                    UseShellExecute = true,
                                    Verb = "runas",
                                    Arguments = "-registerurl"
                                });
                                Environment.Exit(0);
                                return;
                            }
                            Util.RegisterUriScheme();
                            Sniper.PrintColorMessage("Registered the EWiki.Websocket.Sniper URL handler.\nYou can now click on pokesniper2:// links to automatically start EWiki.Websocket.Sniper.", ConsoleColor.Green);
                            Sniper.PrintExit();
                            Console.ReadKey();
                            return;
                        }
                    }
                    else
                    {
                        Console.ForegroundColor = ConsoleColor.White;
                        Console.WriteLine("Started automatic sniping of Pokemon listed on http://pokesnipers.com/");
                        Console.ForegroundColor = ConsoleColor.Gray;
                        Sniper.InsertSeperator();
                        Sniper.ModeAutomatic();
                        return;
                    }
                }
                bool flag = false;
                PokemonId result1 = PokemonId.Abra;
                double result2 = 0.0;
                double result3 = 0.0;
                if (args.Length > 2)
                {
                    if (args[0] != "*")
                    {
                        if (!Enum.TryParse<PokemonId>(args[0], true, out result1))
                        {
                            Console.WriteLine("Invalid pokemon name: {0}", (object)args[0]);
                            return;
                        }
                    }
                    else
                        result1 = PokemonId.Missingno;
                    if (!double.TryParse(args[1], NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result2))
                    {
                        Console.WriteLine("Invalid value for latitude: {0}", (object)args[1]);
                        return;
                    }
                    if (!double.TryParse(args[2], NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result3))
                    {
                        Console.WriteLine("Invalid value for longitude: {0}", (object)args[2]);
                        return;
                    }
                    flag = true;
                }
                if (!flag)
                    Sniper.ModeAttended();
                else
                    Sniper.ModeUnattended(result1, result2, result3);
                while (Sniper.isWorking)
                    Thread.Sleep(10);
                if (flag)
                    return;
                Sniper.PrintExit();
                Console.ReadKey();
            }
        }

        private static void COnLogin(object sender, bool success)
        {
            if (!success)
                return;
            Sniper.DoSnipe();
        }

        private static void COnError(object sender, Exception exception)
        {
            Logger.Log(Sniper._logFile, string.Format("Exception: {0}", (object)exception.Message));
            Sniper.PrintError(exception);
        }

        private static void COnFinished(object sender)
        {
            if (!Sniper.AskSnipeAnother())
                Sniper.isWorking = false;
            else
                Sniper.DoSnipe();
        }

        private static void COnReport(object sender, string message, Core.MessageType messageType)
        {
            ConsoleColor foregroundColor = Console.ForegroundColor;
            ConsoleColor consoleColor = ConsoleColor.Cyan;
            switch (messageType)
            {
                case Core.MessageType.Default:
                    consoleColor = ConsoleColor.Cyan;
                    break;
                case Core.MessageType.PokemonCaught:
                    consoleColor = ConsoleColor.Green;
                    break;
                case Core.MessageType.PokemonGotAway:
                    consoleColor = ConsoleColor.Red;
                    break;
                case Core.MessageType.PokemonIgnored:
                    consoleColor = ConsoleColor.Yellow;
                    break;
            }
            Console.ForegroundColor = consoleColor;
            Console.WriteLine("[{0}] {1}", (object)DateTime.Now.ToString("T"), (object)message);
            Logger.Log(Sniper._logFile, message);
            Console.ForegroundColor = foregroundColor;
        }

        private static void DoSnipe()
        {
            Console.Clear();
            Sniper.PrintIntro();
            PokemonId poke = Sniper.AskPokemon();
            Tuple<double, double> location = Sniper.AskLatitudeAndLongitude();
            Task.Run((Func<Task>)(async () => await Sniper._core.Snipe(poke, location.Item1, location.Item2)));
        }

        private static void ModeAutomatic()
        {
            UserSettingsXml settings = Sniper.CheckSettings();
            if (settings == null)
            {
                Sniper.isWorking = false;
                Sniper.PrintExit();
                Console.ReadKey();
            }
            else
            {
                if (settings.ShowUsernameInTitle)
                    Console.Title = string.Format("{0} - Username: {1}", (object)Console.Title, settings.AuthType == AuthType.Ptc ? (object)settings.PtcUsername : (object)settings.GoogleUsername);
                bool stopCriticalState = false;
                int emptyResponseCounter = 0;
                Auto a = new Auto();
                a.ServerWentAway += (Auto.ServerWentAwayEventHandler)(sender =>
               {
                   Sniper.PrintSimpleMessage("http://pokesnipers.com/ is not answering. Stopping the sniper.", true);
                   Sniper.isWorking = false;
               });
                a.NewPokemon += (Auto.NewPokemonEventHandler)(async (sender, newPokemon) =>
               {
                   if (stopCriticalState)
                       return;
                   List<PokeCoords> pokeCoordsList = newPokemon;
              // ISSUE: explicit non-virtual call
              if ((pokeCoordsList != null ? ((pokeCoordsList.Count) > 0 ? 1 : 0) : 0) != 0)
                   {
                       emptyResponseCounter = 0;
                       Sniper.PrintSimpleMessage("Got " + (object)newPokemon.Count + " new Pokemon to snipe:\n" + string.Join<PokemonId>(", ", newPokemon.Select<PokeCoords, PokemonId>((Func<PokeCoords, PokemonId>)(i => i.PokemonId))), false);
                       foreach (PokeCoords pokeCoords in newPokemon)
                       {
                           if (!stopCriticalState)
                           {
                               if (!settings.AutoSniper.CheckPokemon && !settings.AutoSniper.PokemonToCatch.Contains(pokeCoords.PokemonId))
                                   Sniper.PrintColorMessage(string.Format("Ignored a {0} without checking. Pokemon is not in the catch list.", (object)pokeCoords.PokemonId), ConsoleColor.Yellow);
                               else if (pokeCoords.IsAlive)
                               {
                                   if (settings.AutoSniper.CatchEverything)
                                       pokeCoords.PokemonId = PokemonId.Missingno;
                                   await Sniper._core.Snipe(pokeCoords.PokemonId, pokeCoords.Latitude, pokeCoords.Longitude);
                                   Sniper.PrintSimpleMessage(string.Format("Pausing {0} seconds to wait out the PokemonGo API rate limit.", (object)((double)settings.AutoSniper.Delay / 1000.0).ToString("0.#", (IFormatProvider)CultureInfo.InvariantCulture)), false);
                                   await Task.Delay(settings.AutoSniper.Delay);
                               }
                           }
                           else
                               break;
                       }
                       List<PokeCoords>.Enumerator enumerator = new List<PokeCoords>.Enumerator();
                   }
                   else
                   {
                       ++emptyResponseCounter;
                       Sniper.PrintSimpleMessage("No new Pokemon.", false);
                   }
                   if (emptyResponseCounter > 4)
                   {
                       Sniper.PrintSimpleMessage("http://pokesnipers.com/ is not reporting any Pokemon. Stopping the sniper.", true);
                       Sniper.isWorking = false;
                   }
                   else if (!stopCriticalState)
                   {
                       Sniper.PrintSimpleMessage("Waiting for more Pokemon...", false);
                       await Task.Delay(120000);
                       a.GetPokemon();
                   }
                   else
                       Sniper.isWorking = false;
               });
                Core.CriticalStateEventHandler stateEventHandler = null;
                Core.LoginEventHandler loginEventHandler = null;
                Task.Run((Func<Task>)(async () =>
               {
                   Sniper._core = new Core(settings.ToCompatSettings(), settings.AutoSniper);
                   Sniper._core.Report += new Core.ReportEventHandler(Sniper.COnReport);
                   Sniper._core.Error += new Core.ErrorEventHandler(Sniper.COnError);
                   Sniper._core.CriticalState += stateEventHandler ?? (stateEventHandler = (Core.CriticalStateEventHandler)((sender, type) =>
             {
                     stopCriticalState = true;
                     if (type != Core.CriticalStateType.NoBalls)
                     {
                         if (type != Core.CriticalStateType.FullPokemonInventory)
                             return;
                         Sniper.PrintSimpleMessage("Out of inventory space. Make some room.", false);
                     }
                     else
                         Sniper.PrintSimpleMessage("Out of Pokeballs. Get some more.", false);
                 }));
                   Sniper._core.Login += loginEventHandler ?? (loginEventHandler = (Core.LoginEventHandler)((sender, success) =>
             {
                     if (!success)
                         return;
                     Sniper.PrintSimpleMessage("Logged in. Waiting for Pokemon to snipe...", false);
                     a.GetPokemon();
                 }));
                   await Sniper._core.DoLogin();
               }));
                while (Sniper.isWorking)
                    Thread.Sleep(10);
                Sniper.PrintExit();
                Console.ReadKey();
            }
        }

        private static void ModeAttended()
        {
            bool flag1 = Sniper.AskLoadUserXml();
            UserSettingsXml sniperSettings = new UserSettingsXml();
            if (flag1)
            {
                UserSettingsXml userSettingsXml = Sniper.CheckSettings();
                if (userSettingsXml == null)
                    flag1 = false;
                else
                    sniperSettings = userSettingsXml;
            }
            if (!flag1)
            {
                sniperSettings.AuthType = Sniper.AskAuthType();
                Sniper.InsertSeperator();
                Console.WriteLine("To avoid a softban, your current location is required.");
                Sniper.InsertSeperator();
                sniperSettings.DefaultLatitude = Sniper.AskLatitude();
                sniperSettings.DefaultLongitude = Sniper.AskLongitude();
                sniperSettings.DefaultAltitude = Sniper.AskAltitude();
                switch (sniperSettings.AuthType)
                {
                    case AuthType.Google:
                        Sniper.InsertSeperator();
                        Console.WriteLine("Google login info:");
                        Sniper.InsertSeperator();
                        string str1;
                        bool flag2;
                        do
                        {
                            Console.Write("Username (Email): ");
                            str1 = Console.ReadLine();
                            flag2 = str1 != null && str1.Contains("@");
                            if (!flag2)
                                Sniper.PrintSimpleMessage("Not an email. You have to enter your Google email address to login.", false);
                        }
                        while (!flag2);
                        sniperSettings.GoogleUsername = str1;
                        Console.Write("Password: ");
                        string str2 = Console.ReadLine();
                        sniperSettings.GooglePassword = str2;
                        break;
                    case AuthType.Ptc:
                        Sniper.InsertSeperator();
                        Console.WriteLine("PTC login info:");
                        Sniper.InsertSeperator();
                        Console.Write("Username: ");
                        string str3 = Console.ReadLine();
                        sniperSettings.PtcUsername = str3;
                        Console.Write("Password: ");
                        string str4 = Console.ReadLine();
                        sniperSettings.PtcPassword = str4;
                        break;
                }
            }
            if (!Sniper.AskConfirmSettings(sniperSettings.ToCompatSettings()))
            {
                Console.WriteLine("Cancelled.");
                Sniper.isWorking = false;
            }
            else
            {
                if (sniperSettings.ShowUsernameInTitle)
                    Console.Title = string.Format("{0} - Username: {1}", (object)Console.Title, sniperSettings.AuthType == AuthType.Ptc ? (object)sniperSettings.PtcUsername : (object)sniperSettings.GoogleUsername);
                Console.Clear();
                Sniper.PrintIntro();
                Task.Run((Func<Task>)(async () =>
               {
                   Sniper._core = new Core(sniperSettings.ToCompatSettings(), (UserSettingsXml.AutoSniperSettingsXml)null);
                   Sniper._core.Report += new Core.ReportEventHandler(Sniper.COnReport);
                   Sniper._core.SnipeFinished += new Core.SnipeFinishedEventHandler(Sniper.COnFinished);
                   Sniper._core.Error += new Core.ErrorEventHandler(Sniper.COnError);
                   Sniper._core.Login += new Core.LoginEventHandler(Sniper.COnLogin);
                   await Sniper._core.DoLogin();
               }));
            }
        }

        private static void ModeOnline(Sniper.ParsedUri parsed)
        {
            string directoryName = Path.GetDirectoryName(Process.GetCurrentProcess().MainModule.FileName);
            if (directoryName != null)
                Directory.SetCurrentDirectory(directoryName);
            UserSettingsXml settings = Sniper.CheckSettings();
            if (settings == null)
                return;
            Console.Clear();
            Sniper.PrintIntro();
            if (settings.ShowUsernameInTitle)
                Console.Title = string.Format("{0} - Username: {1}", (object)Console.Title, settings.AuthType == AuthType.Ptc ? (object)settings.PtcUsername : (object)settings.GoogleUsername);
            Core.LoginEventHandler loginEventHandler = null;
            Task.Run((Func<Task>)(async () =>
           {
               Sniper._core = new Core(settings.ToCompatSettings(), (UserSettingsXml.AutoSniperSettingsXml)null);
               Sniper._core.Report += new Core.ReportEventHandler(Sniper.COnReport);
               Sniper._core.Error += new Core.ErrorEventHandler(Sniper.COnError);
               Sniper._core.Login += loginEventHandler ?? (loginEventHandler = (Core.LoginEventHandler)(async (sender, success) =>
         {
                 if (!success)
                 {
                     Sniper.isWorking = false;
                 }
                 else
                 {
                     await Sniper._core.Snipe(parsed.Pokemon, parsed.Latitude, parsed.Longitude);
                     Sniper.isWorking = false;
                 }
             }));
               await Sniper._core.DoLogin();
           }));
            while (Sniper.isWorking)
                Thread.Sleep(10);
        }

        private static void ModeUnattended(PokemonId pokemon, double latitude, double longitude)
        {
            UserSettingsXml settings = Sniper.CheckSettings();
            if (settings == null)
                Environment.Exit(1);
            if (settings.ShowUsernameInTitle)
                Console.Title = string.Format("{0} - Username: {1}", (object)Console.Title, settings.AuthType == AuthType.Ptc ? (object)settings.PtcUsername : (object)settings.GoogleUsername);
            Core.LoginEventHandler loginEventHandler = null;
            Task.Run((Func<Task>)(async () =>
           {
               Sniper._core = new Core(settings.ToCompatSettings(), (UserSettingsXml.AutoSniperSettingsXml)null);
               Sniper._core.Report += new Core.ReportEventHandler(Sniper.COnReport);
               Sniper._core.Error += new Core.ErrorEventHandler(Sniper.COnError);
               Sniper._core.Login += loginEventHandler ?? (loginEventHandler = (Core.LoginEventHandler)(async (sender, success) =>
         {
                 if (!success)
                     Environment.Exit(1);
                 await Sniper._core.Snipe(pokemon, latitude, longitude);
                 Environment.Exit(1);
             }));
               await Sniper._core.DoLogin();
           }));
        }

        private static UserSettingsXml CheckSettings()
        {
            UserSettingsXml userSettingsXml = Settings.OpenUser();
            if (userSettingsXml == null)
            {
                Sniper.PrintSimpleMessage("Could not load settings. user.xml either missing or malformed.", true);
                return (UserSettingsXml)null;
            }
            if (userSettingsXml.AuthType != AuthType.Google || userSettingsXml.GoogleUsername.Contains("@"))
                return userSettingsXml;
            Sniper.PrintSimpleMessage("GoogleUsername does not contain an email.\nYou have to enter your Google email address to login with Google.", true);
            return (UserSettingsXml)null;
        }

        private static PokemonId AskPokemon()
        {
            Console.Write("Pokemon: ");
            PokemonId result = PokemonId.Abra;
            bool flag;
            do
            {
                string str1 = Console.ReadLine();
                if (str1 != null)
                {
                    string str2 = str1.Trim();
                    if (str2 != "*")
                    {
                        flag = Enum.TryParse<PokemonId>(char.ToUpper(str2[0]).ToString() + str2.Substring(1), true, out result);
                    }
                    else
                    {
                        result = PokemonId.Missingno;
                        flag = true;
                    }
                }
                else
                    flag = false;
            }
            while (!flag);
            return result;
        }

        private static Tuple<double, double> AskLatitudeAndLongitude()
        {
            Console.Write("Latitude, Longitude: ");
            double result1 = 0.0;
            double result2 = 0.0;
            string[] strArray1;
            do
            {
                string str = Console.ReadLine();
                string[] strArray2;
                if (str == null)
                {
                    strArray2 = (string[])null;
                }
                else
                {
                    char[] chArray = new char[1] { ',' };
                    strArray2 = str.Split(chArray);
                }
                strArray1 = strArray2;
            }
            while (strArray1 == null || strArray1.Length != 2 || (!double.TryParse(strArray1[0].Trim(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result1) || !double.TryParse(strArray1[1].Trim(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result2)));
            return new Tuple<double, double>(result1, result2);
        }

        private static double AskLatitude()
        {
            Console.Write("Latitude: ");
            double result;
            do
                ;
            while (!double.TryParse(Console.ReadLine(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result));
            return result;
        }

        private static double AskLongitude()
        {
            Console.Write("Longitude: ");
            double result;
            do
                ;
            while (!double.TryParse(Console.ReadLine(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result));
            return result;
        }

        private static double AskAltitude()
        {
            Console.Write("Altitude: ");
            double result;
            do
                ;
            while (!double.TryParse(Console.ReadLine(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result));
            return result;
        }

        private static AuthType AskAuthType()
        {
            Sniper.InsertSeperator();
            Console.WriteLine("Login with:");
            Sniper.InsertSeperator();
            Console.WriteLine("[1] Google - [2] PTC");
            Sniper.InsertSeperator();
            while (true)
            {
                ConsoleKeyInfo consoleKeyInfo = Console.ReadKey();
                Console.WriteLine("");
                switch (consoleKeyInfo.Key)
                {
                    case ConsoleKey.D1:
                        goto label_2;
                    case ConsoleKey.D2:
                        goto label_3;
                    default:
                        Console.WriteLine("Unknown option: " + consoleKeyInfo.KeyChar.ToString());
                        continue;
                }
            }
            label_2:
            return AuthType.Google;
            label_3:
            return AuthType.Ptc;
        }

        private static bool AskSnipeAnother()
        {
            Sniper.InsertSeperator();
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Snipe Another?");
            Sniper.InsertSeperator();
            Console.WriteLine("[Enter] Confirm - [X] Exit");
            Sniper.InsertSeperator();
            while (true)
            {
                ConsoleKeyInfo consoleKeyInfo = Console.ReadKey();
                Console.WriteLine("");
                switch (consoleKeyInfo.Key)
                {
                    case ConsoleKey.Enter:
                        goto label_2;
                    case ConsoleKey.X:
                        goto label_3;
                    default:
                        Console.WriteLine("Unknown option: " + consoleKeyInfo.KeyChar.ToString());
                        continue;
                }
            }
            label_2:
            return true;
            label_3:
            return false;
        }

        private static bool AskConfirmSnipeUrl()
        {
            Sniper.InsertSeperator();
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Do you want to catch this Pokemon?\nYou can turn this confirmation off in settings.");
            Sniper.InsertSeperator();
            Console.WriteLine("[Enter] Confirm - [X] Exit");
            Sniper.InsertSeperator();
            while (true)
            {
                ConsoleKeyInfo consoleKeyInfo = Console.ReadKey();
                Console.WriteLine("");
                switch (consoleKeyInfo.Key)
                {
                    case ConsoleKey.Enter:
                        goto label_2;
                    case ConsoleKey.X:
                        goto label_3;
                    default:
                        Console.WriteLine("Unknown option: " + consoleKeyInfo.KeyChar.ToString());
                        continue;
                }
            }
            label_2:
            return true;
            label_3:
            return false;
        }

        private static bool AskConfirmSettings(ISettings settings)
        {
            Sniper.InsertSeperator();
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("Ready to go. Please confirm the following settings:");
            Console.WriteLine("Login with: {0}", (object)settings.AuthType);
            Console.WriteLine("Latitude: {0}", (object)settings.DefaultLatitude);
            Console.WriteLine("Longitude: {0}", (object)settings.DefaultLongitude);
            Console.WriteLine("Altitude: {0}", (object)settings.DefaultAltitude);
            switch (settings.AuthType)
            {
                case AuthType.Google:
                    Console.WriteLine("Google Username: {0}", (object)settings.GoogleUsername);
                    Console.WriteLine("Google Password: {0}", (object)settings.GooglePassword);
                    break;
                case AuthType.Ptc:
                    Console.WriteLine("PTC Username: {0}", (object)settings.PtcUsername);
                    Console.WriteLine("PTC Password: {0}", (object)settings.PtcPassword);
                    break;
            }
            Sniper.InsertSeperator();
            Console.ForegroundColor = ConsoleColor.Yellow;
            while (true)
            {
                Console.WriteLine("[Enter] Confirm - [X] Cancel");
                Sniper.InsertSeperator();
                ConsoleKeyInfo consoleKeyInfo = Console.ReadKey();
                Console.WriteLine("");
                switch (consoleKeyInfo.Key)
                {
                    case ConsoleKey.Enter:
                        goto label_5;
                    case ConsoleKey.X:
                        goto label_6;
                    default:
                        Console.WriteLine("Unknown option: " + consoleKeyInfo.KeyChar.ToString());
                        continue;
                }
            }
            label_5:
            return true;
            label_6:
            return false;
        }

        private static bool AskLoadUserXml()
        {
            Console.WriteLine("Read settings from user.xml?");
            Console.WriteLine("If [N] EWiki.Websocket.Sniper will ask for information.");
            Sniper.InsertSeperator();
            Console.WriteLine("[Y] Yes - [N] No");
            Sniper.InsertSeperator();
            while (true)
            {
                ConsoleKeyInfo consoleKeyInfo = Console.ReadKey();
                Console.WriteLine("");
                switch (consoleKeyInfo.Key)
                {
                    case ConsoleKey.N:
                        goto label_3;
                    case ConsoleKey.Y:
                        goto label_2;
                    default:
                        Console.WriteLine("Unknown option: " + consoleKeyInfo.KeyChar.ToString());
                        continue;
                }
            }
            label_2:
            return true;
            label_3:
            return false;
        }

        private static string GetFriendlyErrorDescription(Exception exception)
        {
            if (!(exception is GoogleException))
                return "- Please confirm that the PokemonGo servers are online before using EWiki.Websocket.Sniper.\n- If the servers are up, just try again.";
            string message = exception.Message;
            if (message == "NeedsBrowser")
                return "- You have Google 2-Factor login enabled, which is not supported by RocketAPI.";
            if (message == "BadAuthentication")
                return "- Your Google login information is wrong.";
            return message == "CaptchaRequired" ? "- You have failed too many Google logins and Google now requires you to solve a Captcha, which is not supported by RocketAPI.\nWait some time and then try logging in again." : "- Please check your Google login information.";
        }

        private static void PrintError(Exception exception)
        {
            Console.ForegroundColor = ConsoleColor.DarkRed;
            Console.WriteLine("Received an error while running.");
            Console.WriteLine("Message: " + exception.Message);
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine(Sniper.GetFriendlyErrorDescription(exception));
            Sniper.isWorking = false;
        }

        private static void PrintColorMessage(string message, ConsoleColor printColor)
        {
            int foregroundColor = (int)Console.ForegroundColor;
            Console.ForegroundColor = printColor;
            Console.WriteLine(message);
            Logger.Log(Sniper._logFile, message);
            Console.ForegroundColor = (ConsoleColor)foregroundColor;
        }

        private static void PrintSimpleMessage(string message, bool error = false)
        {
            Sniper.PrintColorMessage(message, error ? ConsoleColor.Red : ConsoleColor.White);
        }

        private static void PrintExit()
        {
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Press any key to exit.");
        }

        private static void PrintIntro()
        {
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("EWiki.Websocket.Sniper - PokemonGo Pokemon Sniper");
            Console.WriteLine("Original made by Neer. Version 2 made by maclone.");
            Console.ForegroundColor = ConsoleColor.White;
            Console.WriteLine("Visit http://www.ownedcore.com/ for more.");
            Console.ForegroundColor = ConsoleColor.Gray;
            Sniper.InsertSeperator();
        }

        private static void InsertSeperator()
        {
            int foregroundColor = (int)Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.White;
            Console.WriteLine("---------------------------------------------------");
            Console.ForegroundColor = (ConsoleColor)foregroundColor;
        }

        private static Sniper.ParsedUri TryParseScheme(string uri)
        {
            try
            {
                Uri uri1 = new Uri(uri);
                if (((IEnumerable<string>)uri1.Segments).Count<string>() != 2)
                    return (Sniper.ParsedUri)null;
                Sniper.ParsedUri parsedUri = new Sniper.ParsedUri();
                string host = uri1.Host;
                PokemonId result1;
                if (!(host == "Mr. Mime"))
                {
                    if (host == "Farfetch'd")
                        result1 = PokemonId.Farfetchd;
                    else if (!Enum.TryParse<PokemonId>(uri1.Host, true, out result1))
                        return (Sniper.ParsedUri)null;
                }
                else
                    result1 = PokemonId.MrMime;
                parsedUri.Pokemon = result1;
                string[] strArray = Uri.UnescapeDataString(uri1.Segments[1]).TrimEnd('/').Split(',');
                double result2;
                double result3;
                if (strArray.Length != 2 || !double.TryParse(strArray[0].Trim(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result2) || !double.TryParse(strArray[1].Trim(), NumberStyles.Any, (IFormatProvider)CultureInfo.InvariantCulture, out result3))
                    return (Sniper.ParsedUri)null;
                parsedUri.Latitude = result2;
                parsedUri.Longitude = result3;
                return parsedUri;
            }
            catch (Exception ex)
            {
                return (Sniper.ParsedUri)null;
            }
        }

        private class ParsedUri
        {
            public PokemonId Pokemon { get; set; }

            public double Latitude { get; set; }

            public double Longitude { get; set; }
        }
    }
}
