namespace EWiki.Api.Models
{
    public interface IGenericEntity<TKey>
    {
        TKey Id { get; set; }
    }
}
