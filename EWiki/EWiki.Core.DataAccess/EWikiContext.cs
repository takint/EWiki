using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using EWiki.DataAccess.Infrastructure;
using EWiki.Entities.Models;

namespace EWiki.DataAccess
{
    public class EWikiContext : DataContext
    {
        static EWikiContext()
        {
            Database.SetInitializer<EWikiContext>(null);
        }
        public EWikiContext() : base("Name=EWikiContext") { }

        public DbSet<Archive> Archives { get; set; }
        public DbSet<BlockedIp> BlockedIps { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Character> Characters { get; set; }
        public DbSet<CharacterInfo> CharacterInfos { get; set; }
        public DbSet<CharacterInfoGroup> CharacterInfoGroups { get; set; }
        public DbSet<CharacterSection> CharacterSections { get; set; }
        public DbSet<CharacterSectionGroup> CharacterSectionGroups { get; set; }
        public DbSet<FileArchive> FileArchives { get; set; }
        public DbSet<InfoValue> InfoValues { get; set; }
        // For pokedex
        public DbSet<Location> Locations { get; set; }
        public DbSet<Move> Moves { get; set; }
        public DbSet<Pokedex> Pokedexes { get; set; }
        // End pokedex
        public DbSet<Page> Pages { get; set; }
        public DbSet<PageContent> PageContents { get; set; }
        public DbSet<PageLang> PageLangs { get; set; }
        public DbSet<PageMeta> PageMetas { get; set; }
        public DbSet<PageRestriction> PageRestrictions { get; set; }
        public DbSet<ProtectedTitle> ProtectedTitles { get; set; }
        public DbSet<RecentChange> RecentChanges { get; set; }
        public DbSet<Reference> References { get; set; }
        public DbSet<Revision> Revisions { get; set; }
        public DbSet<Site> Sites { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserMeta> UserMetas { get; set; }
        public DbSet<UserNewtalk> UserNewtalks { get; set; }
        public DbSet<WatchList> WatchLists { get; set; }
        public DbSet<WikiImage> WikiImages { get; set; }
        public DbSet<WikiVideo> WikiVideos { get; set; }


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