using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prism.Mvvm;

namespace EWiki.XF.Models
{
    public class PokemonAccount : BindableBase
    {
        public string Username { get; set; }

        public string Password { get; set; }

        public string Avatar { get; set; }

        private bool _isSelected;
        public bool IsSelected
        {
            get { return _isSelected; }
            set { SetProperty(ref _isSelected, value); }
        }
    }
}
