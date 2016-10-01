using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using EWiki.XF.iOS.Services;
using EWiki.XF.Services;
using Foundation;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using Xamarin.Forms;

[assembly: Dependency(typeof(LocalizationProvider))]
namespace EWiki.XF.iOS.Services
{
    /// <summary>
    /// https://developer.xamarin.com/guides/xamarin-forms/advanced/localization/
    /// </summary>
    public class LocalizationProvider : ILocalizationProvider
    {
        public CultureInfo GetCurrentCultureInfo()
        {
            var netLanguage = "en";
            var prefLanguageOnly = "en";
            if (NSLocale.PreferredLanguages.Length > 0)
            {
                var pref = NSLocale.PreferredLanguages[0];
                prefLanguageOnly = pref.Substring(0, 2);
                if (prefLanguageOnly == "pt")
                {
                    pref = pref == "pt" ? "pt-BR" : "pt-PT";
                }
                netLanguage = pref.Replace("_", "-");
                Console.WriteLine("preferred language:" + netLanguage);
            }

            CultureInfo ci;
            try
            {
                ci = new CultureInfo(netLanguage);
            }
            catch
            {
                // iOS locale not valid .NET culture (eg. "en-ES" : English in Spain)
                // fallback to first characters, in this case "en"
                ci = new CultureInfo(prefLanguageOnly);
            }
            return ci;
        }
    }
}