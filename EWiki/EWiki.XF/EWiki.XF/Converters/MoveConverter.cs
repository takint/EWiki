using System;
using System.Globalization;
using EWiki.XF.Models.Enum;
using Humanizer;
using Xamarin.Forms;

namespace EWiki.XF.Converters
{
    public class MoveConverter : IValueConverter
    {
        public static MoveConverter Instance = new MoveConverter();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var move = (PokemonMove)value;
            return move != PokemonMove.MoveUnset ? move.Humanize(LetterCasing.Title) : "??";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
