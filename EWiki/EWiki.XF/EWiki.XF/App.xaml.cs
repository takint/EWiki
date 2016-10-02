using System.Globalization;
using EWiki.XF.Mappers;
using EWiki.XF.Resources;
using EWiki.XF.Service;
using EWiki.XF.Services;
using Prism.Unity;
using EWiki.XF.Views;
using EWiki.XF.Views.PokemonInfoElements;
using EWiki.XF.Views.Popups;
using Microsoft.Practices.Unity;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]
namespace EWiki.XF
{
    public partial class App : PrismApplication
    {
        public static CultureInfo CurrentCulture;

        public App(IPlatformInitializer initializer = null) : base(initializer) { }

        public static string PokemonGoAccount { get; set; }

        protected override void OnInitialized()
        {
            AutoMapperConfiguration.Configure();

            InitializeComponent();
            SetupCultureInfo();

            NavigationService.NavigateAsync("LeftMenu/Navigation/MainPage");
            //NavigationService.NavigateAsync("NewsTab");
        }

        protected override void RegisterTypes()
        {
            Container.RegisterTypeForNavigation<LeftMenu>();
            Container.RegisterTypeForNavigation<Navigation>();
            Container.RegisterTypeForNavigation<MainPage>();
            Container.RegisterTypeForNavigation<LocationFeederTab>();
            Container.RegisterTypeForNavigation<PokedexTab>();
            Container.RegisterTypeForNavigation<IVCalculatorTab>();
            Container.RegisterTypeForNavigation<NewsTab>();
            Container.RegisterTypeForNavigation<PokemonInfoPage>();
            Container.RegisterTypeForNavigation<ProfilePage>();
            Container.RegisterTypeForNavigation<NewsCategoryPage>();
            Container.RegisterTypeForNavigation<PokemonInfoElement>();
            Container.RegisterTypeForNavigation<SnipePokemonPopup>();
            Container.RegisterType<IPokemonService, PokemonService>();
            Container.RegisterType<INewsService, NewsService>();
            Container.RegisterType<IAccountService, AccountService>();
        }

        private void SetupCultureInfo()
        {
            if (Device.OS == TargetPlatform.iOS || Device.OS == TargetPlatform.Android)
            {
                CurrentCulture = DependencyService.Get<ILocalizationProvider>().GetCurrentCultureInfo();
                Resource.Culture = CurrentCulture;
            }
        }

        protected override void OnStart()
        {
            var message = new StartLocationFeederBackgroundServiceMessage();
            MessagingCenter.Send(message, "StartLocationFeederBackgroundService");

            var startLocationFeederBackgroundServiceMessage = new StartPokeFeederBackgroundServiceMessage();
            MessagingCenter.Send(startLocationFeederBackgroundServiceMessage, "StartPokeFeederBackgroundServiceMessage");
        }
    }
}
