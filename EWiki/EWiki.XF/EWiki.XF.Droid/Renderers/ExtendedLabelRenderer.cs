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
using EWiki.XF.Droid.Renderers;
using EWiki.XF.ExtendedControls;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(ExtendedLabel), typeof(ExtendedLabelRenderer))]
namespace EWiki.XF.Droid.Renderers
{
    public class ExtendedLabelRenderer : LabelRender
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);

            if (Control != null)
            {
                Control.LayoutChange += (s, args) =>
                {
                    Control.Ellipsize = Android.Text.TextUtils.TruncateAt.End;
                    Control.SetMaxLines((int)((args.Bottom - args.Top) / Control.LineHeight));
                };
            }
        }
    }
}