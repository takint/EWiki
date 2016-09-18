using System;
using System.IO;

namespace EWiki.Websocket.Sniper
{
    public class Program
    {
        public static string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Configs");
        public static void Main(string[] args)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            args = new[] { "pokesniper2://venusaur/-22.9131114,-43.1844399" };
            Sniper.Exec(args);
        }
    }
}
