using System.Collections.Generic;

namespace EWiki.Entities.Models
{
    public class Tag : EntityBase
    {
        public string FullName { get; set; }
        public string ShortName { get; set; }
        public string NickName { get; set; }
        public string Slug { get; set; }
        public string Avatar { get; set; }
        public int SearchCount { get; set; }
        public short Level { get; set; }

        public virtual ICollection<Page> Pages { get; set; }
    }
}
