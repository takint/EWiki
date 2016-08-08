using System;

namespace WikiApp.DataAccess.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        WikiAppContext Init();
    }
}
