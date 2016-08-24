using System;
using System.Collections.Generic;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Models
{
    public class NewPokedexDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
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
        virtual public ICollection<CategoryDTO> Types { get; set; }
    }
}
