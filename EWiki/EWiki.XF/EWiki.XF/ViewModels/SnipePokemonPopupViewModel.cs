using System.Collections.ObjectModel;
using EWiki.XF.Models;
using EWiki.XF.Models.Enum;
using Prism.Navigation;

namespace EWiki.XF.ViewModels
{
    public class SnipePokemonPopupViewModel : BaseViewModel
    {
        public ObservableCollection<Message> Messages { get; } = new ObservableCollection<Message>();

        private PokemonId _pokemonId;

        public PokemonId PokemonId
        {
            get { return _pokemonId; }
            set { SetProperty(ref _pokemonId, value); }
        }

        private double _latitude;

        public double Latitude
        {
            get { return _latitude; }
            set { SetProperty(ref _latitude, value); }
        }

        private double _longitude;

        public double Longitude
        {
            get { return _longitude; }
            set { SetProperty(ref _longitude, value); }
        }

        public string LatLong => $"{Latitude}, {Longitude}";

        public string Name => PokemonId.ToString();

        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)PokemonId).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)PokemonId}";
            }
        }

        public string Avatar => $"No{Number}";

        public override void OnNavigatedFrom(NavigationParameters parameters)
        {
            base.OnNavigatedFrom(parameters);
        }

        public override void OnNavigatedTo(NavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);
        }
    }
}
