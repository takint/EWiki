using System.ComponentModel.DataAnnotations.Schema;

namespace WikiApp.Entities.Models
{
    public interface IObjectState
    {
        [NotMapped]
        ObjectState ObjState { get; set; }
    }

    public enum ObjectState
    {
        Unchanged,
        Added,
        Modified,
        Deleted
    }
}
