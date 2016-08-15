using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.DataAccess.Models
{
    public class Pokedex
    {
        public string Number { get; set; }

        public string Name { get; set; }

        public Type[] Types { get; set; }

        public string Species { get; set; }

        public float Weight { get; set; }

        public float Height { get; set; }

        public int Candy { get; set; }

        public float CPGain { get; set; }

        public float MaxCP { get; set; }

        public string Description { get; set; }

        public Move[] NormalMoves { get; set; }

        public Move[] SpecialMoves { get; set; }

        public Move[] BestMoves { get; set; }

        public Pokedex[] Evolves { get; set; }

        // Location get from location data based on type
        public Location[] Locations { get; set; }
    }
}
