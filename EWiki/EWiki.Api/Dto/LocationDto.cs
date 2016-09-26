namespace EWiki.Api
{
    public class LocationDto : BaseDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public CategoryDto Type { get; set; }
    }
}
