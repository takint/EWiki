namespace WikiApp.Entities.Models
{
    public class Revision : Tracking
    {
        public int Id { get; set; }
        public int PageId { get; set; }
        public int PageContentId { get; set; }
        public string RevisionComment { get; set; }
        public bool RevivsionIsDeleted { get; set; }
        public int? RevParentId { get; set; }

        public virtual User BelongToUser { get; set; }
        public virtual Page PageContain { get; set; }
        public virtual PageContent Content { get; set; }
    }
}
