using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using EWiki.XF.Droid.Services;
using EWiki.XF.Services;
using Xamarin.Forms;

[assembly: Dependency(typeof(LocalizationProvider))]
namespace EWiki.XF.Droid.Services
{
    /// <summary>
    /// https://developer.xamarin.com/guides/xamarin-forms/advanced/localization/
    /// </summary>
    public class LocalizationProvider : ILocalizationProvider
    {
        public CultureInfo GetCurrentCultureInfo()
        {
            var androidLocale = Java.Util.Locale.Default;
            var netLanguage = androidLocale.ToString().Replace("_", "-"); // turns pt_BR into pt-BR
            return new CultureInfo(netLanguage);
        }
    }
}