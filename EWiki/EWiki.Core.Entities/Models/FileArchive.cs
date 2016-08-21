namespace WikiApp.Entities.Models
{
    public class FileArchive : EntityBase
    {
        public string Name { get; set; }
        public string ArchiveName { get; set; }
        public string FileSource { get; set; }
        public string DeletedReason { get; set; }
        public int FileSize { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public int BitDepth { get; set; }
        public string FileMediaType { get; set; }
        public string FileMime { get; set; }
        public string FileDescription { get; set; }

        public virtual User UploadedUser { get; set; }
    }
}
