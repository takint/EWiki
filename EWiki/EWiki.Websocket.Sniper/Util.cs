// Decompiled with JetBrains decompiler
// Type: EWiki.Websocket.Sniper.Util
// Assembly: EWiki.Websocket.Sniper, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: D78FB5B1-66E1-4987-AAFA-BEA397095987
// Assembly location: C:\Users\troyv\Downloads\EWiki.Websocket.Sniper_v1.12\EWiki.Websocket.Sniper.exe

using Microsoft.Win32;
using System.Diagnostics;
using System.Security.Principal;

namespace EWiki.Websocket.Sniper
{
  internal class Util
  {
    public static bool IsAdmin()
    {
      WindowsIdentity current = WindowsIdentity.GetCurrent();
      if (current == null)
        return false;
      return new WindowsPrincipal(current).IsInRole(WindowsBuiltInRole.Administrator);
    }

    public static void RegisterUriScheme()
    {
      RegistryKey classesRoot = Registry.ClassesRoot;
      RegistryKey registryKey = classesRoot.OpenSubKey("pokesniper2", true);
      if (registryKey == null)
      {
        classesRoot.CreateSubKey("pokesniper2");
        registryKey = classesRoot.OpenSubKey("pokesniper2", true);
      }
      if (registryKey != null)
        registryKey.SetValue("", (object) "URL:pokesniper2 protocol");
      if (registryKey != null)
        registryKey.SetValue("URL Protocol", (object) "");
      if (registryKey != null)
      {
        RegistryKey subKey = registryKey.CreateSubKey("DefaultIcon");
        if (subKey != null)
        {
          string name = "";
          string str = "pokesniper2.exe";
          subKey.SetValue(name, (object) str);
        }
      }
      string str1 = string.Format("\"{0}\" \"%1\"", (object) Process.GetCurrentProcess().MainModule.FileName);
      if (registryKey == null)
        return;
      RegistryKey subKey1 = registryKey.CreateSubKey("Shell");
      if (subKey1 == null)
        return;
      string subkey1 = "Open";
      RegistryKey subKey2 = subKey1.CreateSubKey(subkey1);
      if (subKey2 == null)
        return;
      string subkey2 = "Command";
      RegistryKey subKey3 = subKey2.CreateSubKey(subkey2);
      if (subKey3 == null)
        return;
      string name1 = "";
      string str2 = str1;
      subKey3.SetValue(name1, (object) str2);
    }

    public static void UnregisterUriScheme()
    {
      Registry.ClassesRoot.DeleteSubKeyTree("pokesniper2", false);
    }
  }
}
