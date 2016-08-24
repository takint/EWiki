using System;
using System.Collections.Generic;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Models
{
    public class CategoryDTO
    {
        public int Id { get; set; }
        public string CatTitle { get; set; }
        public int CatPages { get; set; }
        public int NumberOfSubcat { get; set; }
    }
}
