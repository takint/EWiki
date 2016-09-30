using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.Design.Widget;
using Android.Text;
using Android.Text.Style;
using Android.Views;
using Android.Widget;
using EWiki.XF.Droid.Renderers;
using FormsPlugin.Iconize.Droid;
using Plugin.Iconize.Droid;
using Plugin.Iconize.Droid.Controls;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;
using Xamarin.Forms.Platform.Android.AppCompat;

[assembly: ExportRenderer(typeof(TabbedPage), typeof(BottomTabbedPageRender))]
namespace EWiki.XF.Droid.Renderers
{
    public class BottomTabbedPageRender : TabbedPageRenderer
    {
        private readonly List<String> _icons = new List<String>();
        private Android.Views.View formViewPager = null;
        private TabLayout tabLayout = null;

        protected override void OnAttachedToWindow()
        {
            UpdateTabbedIcons(Context);

            base.OnAttachedToWindow();
        }

        protected override void OnElementChanged(ElementChangedEventArgs<TabbedPage> e)
        {
            _icons.Clear();
            if (e.NewElement != null)
            {
                foreach (var page in e.NewElement.Children)
                {
                    _icons.Add(page.Icon.File);
                    page.Icon = null;
                }
            }

            base.OnElementChanged(e);

            this.formViewPager = this.GetChildAt(0);
            this.tabLayout = (TabLayout) this.GetChildAt(1);
        }

        protected override void OnLayout(bool changed, int l, int t, int r, int b)
        {

            base.OnLayout(changed, l, t, r, b);

            // update layout , let tab on the bottom of the page
            // formViewPager upon tab.
            var w = r - 1;
            var h = b - t;
            if (w > 0 && h > 0)
            {
                int ypos = Math.Min(h, Math.Max(this.tabLayout.MeasuredHeight, this.tabLayout.MinimumHeight));
                this.formViewPager.Layout(0, -ypos, r, b - ypos);
                this.tabLayout.Layout(l, h - ypos, r, b);
            }
        }

        private void UpdateTabbedIcons(Context context)
        {
            var tabLayout = FindViewById<TabLayout>(IconControls.TabLayoutId);
            if (tabLayout == null || tabLayout.TabCount == 0)
                return;

            for (var i = 0; i < tabLayout.TabCount; i++)
            {
                var tab = tabLayout.GetTabAt(i);
                if (_icons.Any())
                {
                    tab.SetText("");
                }

                var icon = Plugin.Iconize.Iconize.FindIconForKey(_icons[i]);
                if (icon != null)
                {
                    var drawable = new IconDrawable(context, icon).Color(Color.White.ToAndroid()).SizeDp(20);
                    tab.SetIcon(drawable);
                }
                else
                {
                    var drawable = Resources.GetDrawable(_icons[i]);
                    tab.SetIcon(drawable);
                }
            }
        }
    }
}