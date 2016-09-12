using Android.Util;
using EWiki.XF.Droid.LocationFeeder.Common;
using System;
using System.Globalization;
using System.Text.RegularExpressions;

namespace EWiki.XF.Droid.LocationFeeder.Helper
{
    public class GeoCoordinatesParser
    {
        public const string GeoCoordinatesRegex = @"(?<lat>\-?\d+[\,|\.]\d+)[,|\s]+(?<long>\-?\d+[\,|\.]\d+)";

        public static GeoCoordinates ParseGeoCoordinates(string input)
        {
            var match = Regex.Match(input, GeoCoordinatesRegex);

            if (!match.Success) return null;

            var geoCoordinates = new GeoCoordinates();
            var latitude = Convert.ToDouble(match.Groups["lat"].Value.Replace(',', '.'),
                CultureInfo.InvariantCulture);
            var longitude = Convert.ToDouble(match.Groups["long"].Value.Replace(',', '.'),
                CultureInfo.InvariantCulture);
            if (Math.Abs(latitude) > 180)
            {
                Log.Debug("Latitude is lower than -180 or higher than 180 for input {0}", input);
                return null;
            }
            if (Math.Abs(longitude) > 180)
            {
                Log.Debug("Longitude is lower than -180 or higher than 180 for input {0}", input);
                return null;
            }

            geoCoordinates.Latitude = Math.Round(latitude,6);
            geoCoordinates.Longitude = Math.Round(longitude, 6);

            return geoCoordinates;
        }
    }
}
