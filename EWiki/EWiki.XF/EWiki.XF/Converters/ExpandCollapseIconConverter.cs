using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class ExpandCollapseIconConverter : IValueConverter
    {
        public static ExpandCollapseIconConverter Instance = new ExpandCollapseIconConverter();

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var isExpanded = (bool) value;
            return isExpanded ? "md-expand-less" : "md-expand-more";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
