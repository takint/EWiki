using System;
using EWiki.XF.Models.Enum;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Xamarin.Forms;

namespace EWiki.XF.Models
{
    public class Message
    {
        public string Content { get; set; }
        [JsonProperty("Color")]
        public string ColorName { get; set; }
        public LogLevel LogLevel { get; set; }
        [JsonIgnore]
        public Color Color => ParseColor(ColorName);
        public DateTime CreatedDate { get; set; }

        public Color ParseColor(string name)
        {
            switch (name)
            {
                case "Black":
                    return Color.Black;
                case "Blue":
                    return Color.Blue;
                case "Cyan":
                    return Color.FromHex("00ffff");
                case "DarkBlue":
                    return Color.FromHex("00008b");
                case "DarkCyan":
                    return Color.FromHex("008b8b");
                case "DarkGray":
                    return Color.FromHex("a9a9a9");
                case "DarkGreen":
                    return Color.FromHex("00ff00");
                case "DarkMagenta":
                    return Color.FromHex("8b008b");
                case "DarkRed":
                    return Color.FromHex("8b0000");
                case "DarkYellow":
                    return Color.FromHex("ffff00");
                case "Gray":
                    return Color.Gray;
                case "Green":
                    return Color.FromHex("00ff00");
                case "Magenta":
                    return Color.FromHex("ff00ff");
                case "Red":
                    return Color.Red;
                case "White":
                    return Color.White;
                case "Yellow":
                    return Color.Yellow;
                default:
                    return Color.White;
            }
        }
    }
}
