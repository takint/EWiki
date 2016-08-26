using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public abstract class EntityBase : IEntity
    {
        public int Id { get; set; }
        public string CreatedUserId { get; set; }
        public virtual User CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedUserId { get; set; }
        public virtual User UpdatedUser { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
