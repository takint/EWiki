using Android.Graphics;
using EWiki.XF.Droid.Renderers;
using EWiki.XF.ExtendedControls;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(ProgressBar), typeof(ExtendedProgressBarRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class ExtendedProgressBarRender : ProgressBarRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<ProgressBar> e)
        {
            base.OnElementChanged(e);
            var progressBar = e.NewElement as ExtendedProgressBar;
            if (progressBar != null)
            {
                Control.ProgressDrawable.SetColorFilter(progressBar.ProgressColor.ToAndroid(), PorterDuff.Mode.SrcIn);
            }
        }
    }
}