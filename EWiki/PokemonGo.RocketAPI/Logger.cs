using PokemonGo.RocketAPI.Logging;
using System;
using System.IO;
using Newtonsoft.Json;
using SuperWebSocket;

namespace PokemonGo.RocketAPI
{
	/// <summary>
	/// Generic logger which can be used across the projects.
	/// Logger should be set to properly log.
	/// </summary>
	
	public static class Logger
	{
        public static string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Configs");
        public static string log = Path.Combine(path, "log.txt");
        private static ILogger logger;

		/// <summary>
		/// Set the logger. All future requests to <see cref="Write(string, LogLevel)"/> will use that logger, any old will be unset.
		/// </summary>
		/// <param name="logger"></param>
		public static void SetLogger(ILogger logger)
		{
			Logger.logger = logger;
		}

		/// <summary>
		/// Log a specific message to the logger setup by <see cref="SetLogger(ILogger)"/> .
		/// </summary>
		/// <param name="message">The message to log.</param>
		/// <param name="level">Optional level to log. Default <see cref="LogLevel.Info"/>.</param>
		public static void Write(string message, LogLevel level = LogLevel.Info)
		{
			if (logger == null)
				return;
			logger.Write(message, level);
            AddLog(message);
		}

        public static void ColoredConsoleWrite(ConsoleColor color, string text, LogLevel level = LogLevel.Info, WebSocketSession session = null)
        {
            session?.Send(JsonConvert.SerializeObject(new ResponseMessage()
            {
                Content = text,
                Color = color.ToString(),
                CreatedDate = DateTime.Now
            }));
            ConsoleColor originalColor = Console.ForegroundColor;
            Console.ForegroundColor = color;
            Console.WriteLine($"[{DateTime.Now.ToString("HH:mm:ss")}] "+ text);
            Console.ForegroundColor = originalColor;
            AddLog(text);
        }

        //public static void ColoredConsoleWrite(ConsoleColor color, string text, WebSocketSession session = null)
        //{
        //    session?.Send(text);
        //    ConsoleColor originalColor = Console.ForegroundColor;
        //    Console.ForegroundColor = color;
        //    Console.WriteLine($"[{DateTime.Now.ToString("HH:mm:ss")}] " + text);
        //    Console.ForegroundColor = originalColor;
        //    AddLog(text);
        //}

        public static void Error(string text, WebSocketSession session = null)
        {
            ColoredConsoleWrite(ConsoleColor.Red, text, LogLevel.Info, session);
        }

        public static void AddLog(string line)
        { 
            if (!File.Exists(log))
            {
                File.Create(log);
            } 
            try
            {
                // here you know that the file exists
                TextWriter tw = new StreamWriter(log, true); //  we need to add a new line (aka. i am the brain)
                tw.WriteLine($"[{DateTime.Now.ToString("HH:mm:ss")}] " + line); 
                tw.Close();
            } catch (Exception)
            {
                // Probably used by other process error
            }
        }
    }

    public class ResponseMessage
    {
        public string Content { get; set; }
        public string Color { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public enum LogLevel
	{
		None = 0,
		Error = 1,
		Warning = 2,
		Info = 3,
		Debug = 4
	}
}
