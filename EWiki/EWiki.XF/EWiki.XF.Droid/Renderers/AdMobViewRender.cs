using Android.Widget;
using EWiki.XF.Droid.Renderers;
using EWiki.XF.Droid.Utils.Typeface;
using EWiki.XF.ExtendedControls;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(AdMobView), typeof(AdMobViewRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class AdMobViewRender : ViewRenderer<AdMobView, Android.Gms.Ads.AdView>
    {
        protected override void OnElementChanged(ElementChangedEventArgs<AdMobView> e)
        {
            base.OnElementChanged(e);

            if (Control == null)
            {
                var ad = new Android.Gms.Ads.AdView(Forms.Context);
                ad.AdSize = Android.Gms.Ads.AdSize.Banner;
                ad.AdUnitId = "ca-app-pub-4803348967644542/1089645319";

                var requestbuilder = new Android.Gms.Ads.AdRequest.Builder();
                requestbuilder.AddTestDevice("436A149F16B727C80E8B2AF27762682E"); 
                requestbuilder.AddTestDevice("A05CE7E08DC594343341FB72C6C70300");
                ad.LoadAd(requestbuilder.Build());

                SetNativeControl(ad);
            }
        }
    }
}