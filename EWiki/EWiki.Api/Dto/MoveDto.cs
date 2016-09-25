namespace EWiki.Api
{
    public class MoveDto : BaseDto
    {
        public string Name { get; set; }
        public float Power { get; set; }
        public float Cooldown { get; set; }
        public int Energy { get; set; }
        public float DPS { get; set; }
        public float WithSTAB { get; set; }
        public float CritChange { get; set; }
        public float Bars { get; set; }
        public float BarLength{ get; set; }

        public CategoryDto Type { get; set; }
        public CategoryDto MoveCategory { get; set; }
    }
}
