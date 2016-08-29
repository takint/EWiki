using EWiki.XF.Views.PokemonInfoElements;
using Xamarin.Forms;

namespace EWiki.XF.Views
{
    public partial class PokemonInfoPage : CarouselPage
    {
        public PokemonInfoPage()
        {
            InitializeComponent();
            Children.Add(new PokemonInfoElement() {Title = "Le"});
            Children.Add(new PokemonInfoElement() { Title = "Cao" });
            Children.Add(new PokemonInfoElement() { Title = "Tri" });
        }
    }
}
