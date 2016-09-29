using System;
using System.Globalization;
using EWiki.XF.Service.Models;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class GradeConverter : IValueConverter
    {
        public static GradeConverter Instance = new GradeConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var grade = (Grade)value;

            return grade == Grade.VeryGood ? "Very Good!!" : grade == Grade.Excellent ? "Excellent!!!" : grade.ToString();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class GradeColorConverter : IValueConverter
    {
        public static GradeColorConverter Instance = new GradeColorConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var grade = (Grade)value;
            switch (grade)
            {
                case Grade.Bad:
                    return Color.FromHex("FF0000");
                case Grade.Average:
                    return Color.FromHex("FF8000");
                case Grade.Good:
                    return Color.FromHex("FFFF00");
                case Grade.VeryGood:
                    return Color.FromHex("80FF00");
                case Grade.Excellent:
                    return Color.FromHex("00FF00");
                default:
                    return Color.White;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class GradeBackgroundConverter : IValueConverter
    {
        public static GradeBackgroundConverter Instance = new GradeBackgroundConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var grade = (Grade)value;
            switch (grade)
            {
                case Grade.Bad:
                    return "button_red";
                case Grade.Average:
                    return "button_orange";
                case Grade.Good:
                    return "button_yellow";
                case Grade.VeryGood:
                    return "button_light_green";
                case Grade.Excellent:
                    return "button_light_green";
                default:
                    return Color.White;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
