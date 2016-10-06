using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.XF.Models
{
    public class UserPokemonCaptureTracking
    {
        public DateTime Date { get; set; }

        public int RareCount { get; set; }

        public int NormalCount { get; set; }
    }
}
