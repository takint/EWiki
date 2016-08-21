namespace WikiApp.Entities.Models
{
    public class SiteStats : Entity
    {
        public int Id { get; set; }
        public int TotalEdits { get; set; }
        public int GoodArticles { get; set; }
        public int TotalPages { get; set; }
        public int TotalUsers { get; set; }
        public int ActiveUsers { get; set; }
        public int TotalImages { get; set; }
    }
}
