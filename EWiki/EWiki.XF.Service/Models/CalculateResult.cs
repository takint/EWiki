using System.Collections.Generic;

namespace EWiki.XF.Service.Models
{
    public class CalculateResult
    {
        public Status Status { get; set; }
        public string Message { get; set; }
        public IVResult IVResult { get; set; }
    }

    public enum Status
    {
        Success, Error, InvalidInput
    }

    public class IVResult
    {
        public double CPRating { get; set; }
        public double CPRatingFromAvg { get; set; }
        public double BattleRating { get; set; }
        public double BattleRatingFromAvg { get; set; }
        public double HPRating { get; set; }
        public double HPRatingFromAvg { get; set; }
        public Grade Grade { get; set; }
        public List<IVDetail> Details { get; set; }
    }

    public class IVDetail
    {
        public int Attack { get; set; }
        public int Defense { get; set; }
        public int Stamina { get; set; }
        public double IV { get; set; }
        public double Level { get; set; }
        public Grade Grade { get; set; }
    }

    public enum Grade
    {
        Bad, Average, Good, VeryGood, Excellent
    }

    public class HPIV
    {
        public int Stamina { get; set; }
        public LevelData Level { get; set; }
    }
}
