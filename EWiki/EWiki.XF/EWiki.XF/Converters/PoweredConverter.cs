using System;
using System.Globalization;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class PoweredConverter : IValueConverter
    {
        public static PoweredConverter Instance = new PoweredConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return (bool) value ? "md-done" : "?";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
