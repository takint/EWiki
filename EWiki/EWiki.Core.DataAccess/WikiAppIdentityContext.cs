using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using WikiApp.Entities.Models;

namespace WikiApp.DataAccess
{
    public class WikiAppIdentityContext : IdentityDbContext<User>
    {
        public WikiAppIdentityContext()
            : base("WikiAppContext", throwIfV1Schema: false)
        {
            Configuration.ProxyCreationEnabled = false;
            Configuration.LazyLoadingEnabled = false;
        }

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
        public DbSet<UserMeta> UserMetas { get; set; }
        public DbSet<UserNewtalk> UserNewtalks { get; set; }
        public DbSet<WatchList> WatchLists { get; set; }
        public DbSet<WikiImage> WikiImages { get; set; }

        public static WikiAppIdentityContext Create()
        {
            return new WikiAppIdentityContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder); // This needs to go before the other rules!

            modelBuilder.Ignore<IdentityUser>();
            modelBuilder.Entity<User>().ToTable("Users", "dbo").HasKey(p => p.Id);
            modelBuilder.Entity<IdentityUserRole>().ToTable("UserRoles", "dbo");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("UserLogins", "dbo");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("UserClaims", "dbo").HasKey(p => p.Id);
            modelBuilder.Entity<IdentityRole>().ToTable("Roles", "dbo").HasKey(p => p.Id);

            //modelBuilder.Configurations.Add(new MenuConfiguration());
            //modelBuilder.Configurations.Add(new ImageConfiguration());
            //modelBuilder.Configurations.Add(new VideoConfiguration());
        }
    }
}
