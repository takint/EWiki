// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Logger
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EWiki.Websocket.Sniper
{
  public static class Logger
  {
    private static readonly List<Logger.LogEntry> SequentialWriteLog = new List<Logger.LogEntry>();

    static Logger()
    {
      // ISSUE: reference to a compiler-generated field
      // ISSUE: reference to a compiler-generated method
      //Task.Run(new Func<Task>(Logger.\u003C\u003Ec.\u003C\u003E9.\u003C\u002Ecctor\u003Eb__1_0));
    }

    public static void Log(string file, string message)
    {
      lock (Logger.SequentialWriteLog)
        Logger.SequentialWriteLog.Add(new Logger.LogEntry(file, string.Format("[{0}] {1}\n", (object) DateTime.Now, (object) message)));
    }

    public class LogEntry
    {
      public string File { get; set; }

      public string Message { get; set; }

      public LogEntry(string file, string message)
      {
        this.File = file;
        this.Message = message;
      }
    }
  }
}
