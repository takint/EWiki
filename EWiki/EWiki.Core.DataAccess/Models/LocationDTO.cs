using System;
using System.Collections.Generic;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Models
{
    public class LocationDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        virtual public ICollection<CategoryDTO> Types { get; set; }
    }
}
