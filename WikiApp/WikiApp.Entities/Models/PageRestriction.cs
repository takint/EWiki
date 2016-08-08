namespace WikiApp.Entities.Models
{
    public class PageRestriction : Tracking
    {
        public int Id { get; set; }
        public int PageRestrictedId { get; set; }
        public RestrictType ResType { get; set; }
        public RestrictLevel ResLevel { get; set; }
        public bool IsCascade { get; set; }
        public decimal ResctrictionExpiry { get; set; }

        public virtual Page PageResctricted { get; set; }
    }
}
