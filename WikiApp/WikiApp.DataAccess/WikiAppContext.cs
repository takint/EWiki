using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using WikiApp.DataAccess.Infrastructure;
using WikiApp.Entities.Models;

namespace WikiApp.DataAccess
{
    public class WikiAppContext : DataContext
    {
        static WikiAppContext()
        {
            Database.SetInitializer<WikiAppContext>(null);
        }
        public WikiAppContext() : base("Name=WikiAppContext") { }

        public DbSet<Archive> Archives { get; set; }
        public DbSet<BlockedIp> BlockedIps { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<FileArchive> FileArchives { get; set; }
        public DbSet<Page> Pages { get; set; }
        public DbSet<PageContent> PageContents { get; set; }
        public DbSet<PageLang> PageLangs { get; set; }
        public DbSet<PageMeta> PageMetas { get; set; }
        public DbSet<PageRestriction> PageRestrictions { get; set; }
        public DbSet<ProtectedTitle> ProtectedTitles { get; set; }
        public DbSet<RecentChange> RecentChanges { get; set; }
        public DbSet<Revision> Revisions { get; set; }
        public DbSet<Site> Sites { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserMeta> UserMetas { get; set; }
        public DbSet<UserNewtalk> UserNewtalks { get; set; }
        public DbSet<WatchList> WatchLists { get; set; }
        public DbSet<WikiImage> WikiImages { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder); // This needs to go before the other rules!

            modelBuilder.Ignore<IdentityUserRole>();
            modelBuilder.Ignore<IdentityUserLogin>();
            modelBuilder.Ignore<IdentityUserClaim>();
            modelBuilder.Ignore<IdentityRole>();
            modelBuilder.Ignore<IdentityUser>();
        }
    }
}