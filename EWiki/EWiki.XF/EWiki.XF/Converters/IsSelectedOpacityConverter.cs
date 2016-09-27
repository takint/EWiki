using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class IsSelectedOpacityConverter : IValueConverter
    {
        public static IsSelectedOpacityConverter Instance = new IsSelectedOpacityConverter();

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var isSelected = (bool)value;
            return isSelected ? 1 : 0.5;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
