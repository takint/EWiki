using System.ComponentModel.DataAnnotations.Schema;

namespace WikiApp.Entities.Models
{
    public abstract class Entity : IObjectState
    {
        [NotMapped]
        public ObjectState ObjState { get; set; }
    }
}
