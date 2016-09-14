using System;
using System.Globalization;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class IVConverter : IValueConverter
    {
        public static IVConverter Instance = new IVConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var iv = System.Convert.ToDecimal(value);
            return iv > 0 ? iv.ToString() : "??";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class IVColorConverter : IValueConverter
    {
        public static IVColorConverter Instance = new IVColorConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var iv = System.Convert.ToDecimal(value); 
            return iv > 0 ? Color.FromHex("FF4081") : Color.FromHex("212121");
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
