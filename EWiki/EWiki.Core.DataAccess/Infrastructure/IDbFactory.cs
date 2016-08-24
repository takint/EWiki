using System;

namespace EWiki.DataAccess.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        EWikiContext Init();
    }
}
