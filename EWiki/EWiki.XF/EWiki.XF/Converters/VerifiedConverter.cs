using System;
using System.Globalization;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class VerifiedIconConverter : IValueConverter
    {
        public static VerifiedIconConverter Instance = new VerifiedIconConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return (bool) value ? "md-check-circle" : "md-help-outline";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class VerifiedColorConverter : IValueConverter
    {
        public static VerifiedColorConverter Instance = new VerifiedColorConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return (bool)value ? Color.FromHex("009688") : Color.FromHex("212121");
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
