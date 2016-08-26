using System;

namespace EWiki.Api.DataAccess
{
    public interface IDbFactory : IDisposable
    {
        EWikiContext Init();
    }
}
