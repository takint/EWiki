using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EWiki.XF.ExtendedControls;
using EWiki.XF.iOS.Renderers;
using UIKit;
using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(ExtendedLabel), typeof(ExtendedLabelRenderer))]
namespace EWiki.XF.iOS.Renderers
{
    public class ExtendedLabelRenderer : LabelRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);

            if (Control != null)
            {
                Control.LineBreakMode = UILineBreakMode.TailTruncation;
                Control.Lines = 0;
            }
        }
    }
}