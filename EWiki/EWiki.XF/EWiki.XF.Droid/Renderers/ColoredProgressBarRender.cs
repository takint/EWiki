using Android.Graphics;
using EWiki.XF.Droid.Renderers;
using EWiki.XF.Droid.Utils.Typeface;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;
using Color = Xamarin.Forms.Color;

[assembly: ExportRenderer(typeof(ProgressBar), typeof(ColoredProgressBarRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class ColoredProgressBarRender : ProgressBarRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<ProgressBar> e)
        {
            base.OnElementChanged(e);
            Control.ProgressDrawable.SetColorFilter(Color.FromHex("#FF4081").ToAndroid(), PorterDuff.Mode.SrcIn);
        }
    }
}