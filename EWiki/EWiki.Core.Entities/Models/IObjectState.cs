using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Entities.Models
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
