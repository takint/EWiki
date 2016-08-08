namespace WikiApp.DataAccess.Infrastructure
{
    public class DbFactory : Disposable, IDbFactory
    {
        WikiAppContext dbContext;

        public WikiAppContext Init()
        {
            return dbContext ?? (dbContext = new WikiAppContext());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}
