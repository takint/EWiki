using System;
using System.Collections.ObjectModel;
using Acr.UserDialogs;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Models.Enum;
using EWiki.XF.Views.Popups;
using Prism.Commands;
using Rg.Plugins.Popup.Services;
using Xamarin.Forms;

namespace EWiki.XF.ViewModels
{
    public class IVCalculatorTabViewModel : BaseViewModel
    {
        #region params

        private PokemonId _pokemonId;

        public PokemonId PokemonId
        {
            get { return _pokemonId; }
            set { SetProperty(ref _pokemonId, value); }
        }

        private string _name;

        public string Name
        {
            get { return _name; }
            set { SetProperty(ref _name, value); }
        }

        private string _avatar;

        public string Avatar
        {
            get { return _avatar; }
            set { SetProperty(ref _avatar, value); }
        }

        private int _cp;

        public int CP
        {
            get { return _cp; }
            set { SetProperty(ref _cp, value); }
        }

        private int _hp;

        public int HP
        {
            get { return _hp; }
            set { SetProperty(ref _hp, value); }
        }

        private int _stardust;

        public int Stardust
        {
            get { return _stardust; }
            set { SetProperty(ref _stardust, value); }
        }

        private bool _powered;

        public bool Powered
        {
            get { return _powered; }
            set { SetProperty(ref _powered, value); }
        }


        #endregion

        #region results

        private ObservableCollection<IVDetail> _results = new ObservableCollection<IVDetail>();

        public ObservableCollection<IVDetail> Results => _results;

        private double _cpRating;
        public double CPRating
        {
            get { return _cpRating; }
            set { SetProperty(ref _cpRating, value); }
        }

        private double _cpRatingFromAvg;
        public double CPRatingFromAvg
        {
            get { return _cpRatingFromAvg; }
            set { SetProperty(ref _cpRatingFromAvg, value); }
        }

        private double _battleRating;
        public double BattleRating
        {
            get { return _battleRating; }
            set { SetProperty(ref _battleRating, value); }
        }

        private double _battleRatingFromAvg;
        public double BattleRatingFromAvg
        {
            get { return _battleRatingFromAvg; }
            set { SetProperty(ref _battleRatingFromAvg, value); }
        }

        private double _hpRating;
        public double HPRating
        {
            get { return _hpRating; }
            set { SetProperty(ref _hpRating, value); }
        }

        private double _hpRatingFromAvg;
        public double HPRatingFromAvg
        {
            get { return _hpRatingFromAvg; }
            set { SetProperty(ref _hpRatingFromAvg, value); }
        }

        private Grade _grade;
        public Grade Grade
        {
            get { return _grade; }
            set { SetProperty(ref _grade, value); }
        }

        private bool _calculated;
        public bool Calculated
        {
            get { return _calculated; }
            set { SetProperty(ref _calculated, value); }
        }

        #endregion

        private readonly IPokemonService _pokemonService;

        public DelegateCommand IVCalculateCommand { get; set; }
        public DelegateCommand OpenPokemonSelectorPopupCommand { get; set; }
        public DelegateCommand OpenIVCalculateDetailsPopupCommand { get; set; }


        public IVCalculatorTabViewModel(IPokemonService pokemonService)
        {
            _pokemonService = pokemonService;
            Avatar = "No_Bulbasaur";
            PokemonId = PokemonId.Bulbasaur;
            Name = PokemonId.ToString();

            MessagingCenter.Subscribe<PokemonSelectorPopupViewModel, PokemonSM>(this, "SelectedPokemonMessage", (sender, selectedPokemon) =>
            {
                PokemonId = selectedPokemon.Id;
                Avatar = selectedPokemon.Avatar;
                Name = selectedPokemon.Name;
            });

            IVCalculateCommand = new DelegateCommand(ExecuteIVCalculateCommand);
            OpenPokemonSelectorPopupCommand = new DelegateCommand(ExecuteOpenPokemonSelectorPopupCommand);
            OpenIVCalculateDetailsPopupCommand = new DelegateCommand(ExecuteOpenIVCalculateDetailsPopupCommand);
        }

        private async void ExecuteOpenPokemonSelectorPopupCommand()
        {
            var pokemonSelectorPopup = new PokemonSelectorPopup()
            {
                BindingContext = new PokemonSelectorPopupViewModel()
            };
            
            await PopupNavigation.PushAsync(pokemonSelectorPopup);
        }

        private async void ExecuteOpenIVCalculateDetailsPopupCommand()
        {
            var ivCalculateDetailsPopup = new IVCalculateDetailsPopup()
            {
                BindingContext = new IVCalculatorDetailsPopupViewModel()
                {
                    Details = Results
                }
            };

            await PopupNavigation.PushAsync(ivCalculateDetailsPopup);
        }

        private void ExecuteIVCalculateCommand()
        {
            _calculated = false;

            var calculateResult = _pokemonService.IVCalculate(PokemonId, CP, HP, Stardust, Powered);

            if (calculateResult == null || calculateResult.Status != Status.Success)
            {
                UserDialogs.Instance.ShowError(calculateResult != null ? calculateResult.Message : $"Can't calculate this {Name}");
                return;
            }

            HPRating = calculateResult.IVResult.HPRating;
            HPRatingFromAvg = calculateResult.IVResult.HPRatingFromAvg;
            CPRating = calculateResult.IVResult.CPRating;
            CPRatingFromAvg = calculateResult.IVResult.CPRatingFromAvg;
            BattleRating = calculateResult.IVResult.BattleRating;
            BattleRatingFromAvg = calculateResult.IVResult.BattleRatingFromAvg;
            Grade = calculateResult.IVResult.Grade;

            foreach (var ivDetail in calculateResult.IVResult.Details)
            {
                _results.Add(ivDetail);
            }

            _calculated = true;
        }
    }
}
