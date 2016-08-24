using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Entities.Models
{
    public abstract class EntityBase : IObjectState
    {
        public int Id { get; set; }
        public string CreatedUserId { get; set; }
        public virtual User CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedUserId { get; set; }
        public virtual User UpdatedUser { get; set; }
        public DateTime? UpdatedDate { get; set; }

        [NotMapped]
        public ObjectState ObjState { get; set; }
    }
}
