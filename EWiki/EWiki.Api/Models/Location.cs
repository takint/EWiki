using System.Collections.Generic;

namespace EWiki.Api.Models
{
    public class Location : EntityBase
    {
        public string Name { get; set; }
        public string Description { get; set; }
        virtual public ICollection<Category> Types { get; set; }
    }
}
