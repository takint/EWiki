using System.Globalization;

namespace EWiki.XF.Droid.LocationFeeder.Helper
{
    public static class StringHelper
    {
        public static string ToPascalCase(this string input)
        {
            TextInfo ti = CultureInfo.CurrentCulture.TextInfo;
            return ti.ToTitleCase(input).Replace(" ", "");
        }
    }
}