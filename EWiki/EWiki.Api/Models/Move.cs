using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class Move : EntityBase
    {
        public string Name { get; set; }
        public float Power { get; set; }
        public float Cooldown { get; set; }
        public int Energy { get; set; }
        public float DPS { get; set; }
        public float WithSTAB { get; set; }
        public float CritChange { get; set; }

        [NotMapped]
        public float Bars
        {
            get
            {
                float energy = Energy != 0 ? Energy : 1;
                return 100f / Math.Abs(energy);
            }
        }

        [NotMapped]
        public float BarLength
        {
            get
            {
                float bars = Bars != 0 ? Bars : 1;
                return 1f / bars;
            }
        }

        [ForeignKey("MoveType")]
        public virtual Category Type { get; set; }
        [ForeignKey("MoveCategoryId")]
        public virtual Category MoveCategory { get; set; }
        public virtual ICollection<PokemonMove> PokemoMoves { get; set; }
        public virtual ICollection<PokemonSpecialMove> PokemoSpecialMoves { get; set; }
    }
}
