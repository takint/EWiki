using Android.Widget;
using EWiki.XF.Droid.Renderers;
using EWiki.XF.Droid.Utils.Typeface;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(Label), typeof(LabelRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class LabelRender : LabelRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);
            var textView = (TextView)GetChildAt(0);
            TypefaceUtil.SetTypeface(textView, "Lato", e.NewElement.FontAttributes);
        }
    }
}