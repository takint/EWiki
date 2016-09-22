using Android.Widget;
using EWiki.XF.Droid.Renderers;
using EWiki.XF.Droid.Utils.Typeface;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(Entry), typeof(EntryRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class EntryRender : EntryRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Entry> e)
        {
            base.OnElementChanged(e);
            if (e.OldElement == null)
            {
                var nativeEditText = (EditText)Control;
                nativeEditText.SetBackgroundColor(Color.Transparent.ToAndroid());
                nativeEditText.SetHintTextColor(Color.FromRgba(255, 255, 255, 0.5).ToAndroid());
            }
        }
    }
}