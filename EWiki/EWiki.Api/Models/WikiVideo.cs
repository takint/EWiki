namespace EWiki.Api.Models
{
    public class WikiVideo : EntityBase
    {
        public string Title { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string Picture { get; set; }
        public int Priority { get; set; }
        public VideoType VideoType { get; set; }
    }
}
