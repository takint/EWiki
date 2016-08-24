using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Entities.Models
{
    public class Pokedex : Character
    {
        public string Number { get; set; }
        public string Species { get; set; }
        public float Weight { get; set; }
        public float Height { get; set; }
        public int Stamina { get; set; }
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Candy { get; set; }
        public float CPGain { get; set; }
        public float MaxCP { get; set; }
        public string Description { get; set; }
        public int EvolveFromId { get; set; }

        virtual public Pokedex EvolveFrom { get; set; }
        // Location get from location data based on type
        virtual public ICollection<Location> Locations { get; set; }
        virtual public ICollection<Move> NormalMoves { get; set; }
        virtual public ICollection<Move> SpecialMoves { get; set; }
        virtual public ICollection<Pokedex> EvolveInto { get; set; }
        virtual public ICollection<Category> Types { get; set; }
    }
}
