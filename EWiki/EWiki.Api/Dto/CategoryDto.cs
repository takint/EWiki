using EWiki.Api.Models;

namespace EWiki.Api
{
    public class CategoryDto : BaseDto
    {
        public string CatTitle { get; set; }
        public string CatTitleVI { get; set; }
        public int CatPages { get; set; }
        public int NumberOfSubcat { get; set; }
        public WikiImage CatImage { get; set; }
    }
}
