using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.XF.Service.Models
{
    public class EvolveSM
    {
        public ObservableCollection<EvolveInfo> EvolveInfos { get; set; }
    }

    public class EvolveInfo
    {
        public int EvolveId { get; set; }
        public string EvolveName { get; set; }
        public string EvolveNumber { get; set; }
        public string EvolveDescription { get; set; }
        public string EvolveAvatar { get; set; }
    }
}
