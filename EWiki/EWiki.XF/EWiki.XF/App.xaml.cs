using EWiki.XF.Mappers;
using EWiki.XF.Service;
using Prism.Unity;
using EWiki.XF.Views;
using Microsoft.Practices.Unity;

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
        }

        protected override void RegisterTypes()
        {
            Container.RegisterTypeForNavigation<LeftMenu>();
            Container.RegisterTypeForNavigation<Navigation>();
            Container.RegisterTypeForNavigation<MainPage>();
            Container.RegisterTypeForNavigation<PokedexTab>();
            Container.RegisterType<IPokemonService, PokemonService>();
        }
    }
}
