namespace EWiki.DataAccess.Infrastructure
{
    public class DbFactory : Disposable, IDbFactory
    {
        EWikiContext dbContext;

        public EWikiContext Init()
        {
            return dbContext ?? (dbContext = new EWikiContext());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}
