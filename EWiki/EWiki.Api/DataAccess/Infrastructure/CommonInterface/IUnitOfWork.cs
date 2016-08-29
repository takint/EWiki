using EWiki.Api.Models;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public interface IUnitOfWork
    {
        int Commit();
    }
}
