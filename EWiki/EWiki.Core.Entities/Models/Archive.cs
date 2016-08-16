namespace WikiApp.Entities.Models
{
    public class Archive : Tracking
    {
        public int Id { get; set; }
        public int NameSpace { get; set; }
        public string Title { get; set; }
        public string ContentText { get; set; }
        public string ArchiveComment { get; set; }
        public int? ReversionId { get; set; }
        public bool IsDeleted { get; set; }
        public int ArchiveLength { get; set; }
        public int? ArchivePageId { get; set; }
        public int? ArchiveParentId { get; set; }

        public virtual PageContent Content { get; set; }
        public virtual User BelongToUser { get; set; }
    }
}
