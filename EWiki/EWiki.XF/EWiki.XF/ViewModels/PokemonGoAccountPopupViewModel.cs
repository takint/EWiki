namespace EWiki.XF.ViewModels
{
    public class PokemonGoAccountPopupViewModel : BaseViewModel
    {
        private string _username;

        public string UserName
        {
            get { return _username; }
            set
            {
                SetProperty(ref _username, value);
                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _password;

        public string Password
        {
            get { return _password; }
            set
            {
                SetProperty(ref _password, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _latitude = "40.76887944936599";

        public string Latitude
        {
            get { return _latitude; }
            set
            {
                SetProperty(ref _latitude, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }

        private string _longitude = "-73.97816622302156";

        public string Longitude
        {
            get { return _longitude; }
            set
            {
                SetProperty(ref _longitude, value);

                App.PokemonGoAccount =
                    $"{UserName}:{Password}:{Latitude}:{Longitude}";
            }
        }
    }
}
