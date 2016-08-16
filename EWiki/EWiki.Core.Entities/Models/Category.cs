using System.Collections.Generic;

namespace WikiApp.Entities.Models
{
    public class Category : Tracking
    {
        public int Id { get; set; }
        public string CatTitle { get; set; }
        public int CatPages { get; set; }
        public int NumberOfSubcat { get; set; }
    }
}
