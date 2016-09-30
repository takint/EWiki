using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using EWiki.XF.Models;
using EWiki.XF.Service;
using EWiki.XF.Service.Requests.Pokemon;
using Prism.Commands;
using Prism.Navigation;

namespace EWiki.XF.ViewModels
{
    public class PokemonInfoPageViewModel : BaseViewModel
    {
        private ObservableCollection<Pokemon> _pokemons = new ObservableCollection<Pokemon>();

        public ObservableCollection<Pokemon> Pokemons
        {
            get { return _pokemons; }
            set { SetProperty(ref _pokemons, value); }
        }   
    }
}
