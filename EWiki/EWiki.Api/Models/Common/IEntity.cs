using System.ComponentModel.DataAnnotations.Schema;

namespace EWiki.Api.Models
{
    public interface IEntity
    {
        int Id { get; set; }
    }
}
