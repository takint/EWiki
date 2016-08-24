using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Xamarin.Forms;

namespace EWiki.XF.Droid.Utils.Typeface
{
    public static class TypefaceUtil
    {
        public static void SetTypeface(TextView textView, string fontName, FontAttributes fontAttributes = FontAttributes.None)
        {
            var fontFilePath = "Fonts/" + fontName;
            switch (fontAttributes)
            {
                case FontAttributes.Bold:
                    fontFilePath += "-Bold.ttf";
                    break;
                case FontAttributes.Italic:
                    fontFilePath += "-Italic.ttf";
                    break;
                default:
                    fontFilePath += "-Regular.ttf";
                    break;
            }
            var font = Android.Graphics.Typeface.CreateFromAsset(Forms.Context.Assets, fontFilePath);
            textView.Typeface = font;
        }
    }
}