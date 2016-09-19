using EWiki.XF.Mappers;
using EWiki.XF.Service;
using Prism.Unity;
using EWiki.XF.Views;
using EWiki.XF.Views.PokemonInfoElements;
using Microsoft.Practices.Unity;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace EWiki.XF
{
    public partial class App : PrismApplication
    {
        public App(IPlatformInitializer initializer = null) : base(initializer) { }

        protected override void OnInitialized()
        {
            AutoMapperConfiguration.Configure();

            InitializeComponent();

            NavigationService.NavigateAsync("LeftMenu/Navigation/MainPage");
            //NavigationService.NavigateAsync("NewsTab");
        }

        protected override void RegisterTypes()
        {
            Container.RegisterTypeForNavigation<LeftMenu>();
            Container.RegisterTypeForNavigation<Navigation>();
            Container.RegisterTypeForNavigation<MainPage>();
            Container.RegisterTypeForNavigation<PokedexTab>();
            Container.RegisterTypeForNavigation<NewsTab>();
            Container.RegisterTypeForNavigation<PokemonInfoPage>();
            Container.RegisterTypeForNavigation<PokemonInfoElement>();
            Container.RegisterType<IPokemonService, PokemonService>();
            Container.RegisterType<INewsService, NewsService>();
        }

        protected override void OnStart()
        {
            var message = new StartTestBackgroundServiceMessage();
            MessagingCenter.Send(message, "StartTestBackgroundService");
        }
    }
}
