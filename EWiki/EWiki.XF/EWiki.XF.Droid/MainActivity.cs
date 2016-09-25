using System;
using System.Reflection;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;
using CarouselView.FormsPlugin.Android;
using EWiki.XF.Droid.BackgroundServices;
using EWiki.XF.Droid.Utils.IconizeModules;
using FormsPlugin.Iconize.Droid;
using Prism.Unity;
using Microsoft.Practices.Unity;
using Plugin.Iconize.Fonts;
using Xamarin.Forms;

namespace EWiki.XF.Droid
{
    [Activity(Label = "Pokit", Icon = "@drawable/icon", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation)]
    public class MainActivity : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        protected override void OnCreate(Bundle bundle)
        {
            TabLayoutResource = Resource.Layout.tabs;
            ToolbarResource = Resource.Layout.toolbar;

            base.OnCreate(bundle);

            FFImageLoading.Forms.Droid.CachedImageRenderer.Init();
            FormsPlugin.Iconize.Droid.IconControls.Init();
            Plugin.Iconize.Iconize.With(new MaterialModule());
            Plugin.Iconize.Iconize.With(new LinearModule());
            IconControls.Init(Resource.Id.toolbar, Resource.Id.sliding_tabs);

            global::Xamarin.Forms.Forms.Init(this, bundle);

            CarouselViewRenderer.Init();

            var cv = typeof(Xamarin.Forms.CarouselView);
            var assembly = Assembly.Load(cv.FullName);

            LoadApplication(new App(new AndroidInitializer()));

            StartLocationFeeder();
            SetupBackgroundServices();
        }

        private void StartLocationFeeder()
        {
            MessagingCenter.Subscribe<StartLocationFeederBackgroundServiceMessage>(this, "StartLocationFeederBackgroundService", message => {
                var intent = new Intent(this, typeof(LocationFeederBackgroundService));
                StartService(intent);
            });

            MessagingCenter.Subscribe<StopLocationFeederBackgroundServiceMessage>(this, "StopLocationFeederBackgroundService", message => {
                var intent = new Intent(this, typeof(LocationFeederBackgroundService));
                StopService(intent);
            });
        }

        private void SetupBackgroundServices()
        {
            MessagingCenter.Subscribe<StartPokeFeederBackgroundServiceMessage>(this, "StartPokeFeederBackgroundService", message => {
                var intent = new Intent(this, typeof(PokeFeederBackgroundService));
                StartService(intent);
            });

            MessagingCenter.Subscribe<StopPokeFeederBackgroundServiceMessage>(this, "StopPokeFeederBackgroundService", message => {
                var intent = new Intent(this, typeof(PokeFeederBackgroundService));
                StopService(intent);
            });
        }
    }

    public class AndroidInitializer : IPlatformInitializer
    {
        public void RegisterTypes(IUnityContainer container)
        {

        }
    }
}

