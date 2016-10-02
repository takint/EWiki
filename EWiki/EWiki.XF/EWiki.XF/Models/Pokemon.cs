using System.Collections.Generic;
using System.Collections.ObjectModel;
using EWiki.XF.Models.Enum;
using EWiki.XF.Service.Models;
using Prism.Mvvm;

namespace EWiki.XF.Models
{
    public class Pokemon : BindableBase
    {
        public PokemonId PokemonId { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string Description { get; set; }
        public double MaxCP { get; set; }
        public string Number { get; set; }
        public string Species { get; set; }
        public int? Candy { get; set; }
        public ObservableCollection<TypeSM> Types { get; set; }
        public int Attack { get; set; }
        public double AttackBarLength => Attack/284f;
        public int Defense { get; set; }
        public double DefenseBarLength => Defense/242f;
        public int Stamina { get; set; }
        public double StaminaBarLength => Stamina/500f;
        public double Weight { get; set; }
        public double Height { get; set; }
        public bool IsEven { get; set; }
        public ObservableCollection<MoveSM> NormalMoves { get; set; }
        public ObservableCollection<MoveSM> SpecialMoves { get; set; }
        public string Locations { get; set; }
        public ObservableCollection<string> EvolveIntoAvatars { get; set; }
        public string EvolveFromAvatar { get; set; }
    }
}
