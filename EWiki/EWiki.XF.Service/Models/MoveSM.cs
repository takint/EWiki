using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.XF.Service.Models
{
    public class MoveSM
    {
        public string Name { get; set; }
        public float Power { get; set; }
        public float Cooldown { get; set; }
        public int Energy { get; set; }
        public float DPS { get; set; }
        public float WithSTAB { get; set; }
        public float CritChange { get; set; }
        public float Bars { get; set; }
        public ObservableCollection<float> BarCollection
        {
            get
            {
                var barCollection = new ObservableCollection<float>();
                for (int i= 0; i < Bars; i++)
                {
                    barCollection.Add(BarLength);
                }
                return barCollection;
            }
        }
        public float BarLength { get; set; }

        public string Type { get; set; }
        public string MoveCategory { get; set; }
    }
}
