using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class RecentChange : Tracking
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int NameSpace { get; set; }
        public string PageTitle { get; set; }
        public string ChangeComment { get; set; }
        public bool IsCreateNew { get; set; }
        public int? PageId { get; set; }
        public int? RevisionId { get; set; }
        public int? RevisionParentId { get; set; }
        public RecentChangeType ChangeType { get; set; }
        public string ChangeFromIpAddress { get; set; }
        public decimal? ChangeOldLength { get; set; }
        public decimal? ChangeNewLength { get; set; }
        public bool IsDeletedAction { get; set; }

        public virtual User UserMakeChange { get; set; }
    }
}
