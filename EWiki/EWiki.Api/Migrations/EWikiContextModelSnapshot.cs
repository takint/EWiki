using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using EWiki.Api.DataAccess;

namespace EWiki.Api.Migrations
{
    [DbContext(typeof(EWikiContext))]
    partial class EWikiContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
            modelBuilder
                .HasAnnotation("ProductVersion", "1.0.1")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("EWiki.Api.Models.Archive", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ArchiveComment");

                    b.Property<int?>("ArchiveLength");

                    b.Property<int?>("ArchivePageId");

                    b.Property<int?>("ArchiveParentId");

                    b.Property<string>("BelongToUserId");

                    b.Property<int?>("ContentId");

                    b.Property<string>("ContentText");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("NameSpace");

                    b.Property<int?>("ReversionId");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("BelongToUserId");

                    b.HasIndex("ContentId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Archives");
                });

            modelBuilder.Entity("EWiki.Api.Models.BlockedIp", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("AnonymousOnly");

                    b.Property<string>("BlockByUserId");

                    b.Property<bool>("BlockCreateAccount");

                    b.Property<decimal>("BlockExpiry");

                    b.Property<string>("BlockReason");

                    b.Property<bool>("BlockUserEdit");

                    b.Property<int?>("BlockedIpId");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("IpAddress");

                    b.Property<string>("IpRangeEnd");

                    b.Property<string>("IpRangeStart");

                    b.Property<int?>("ParentBlock");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<string>("UserBlockedId");

                    b.HasKey("Id");

                    b.HasIndex("BlockByUserId");

                    b.HasIndex("BlockedIpId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UserBlockedId");

                    b.ToTable("BlockedIps");
                });

            modelBuilder.Entity("EWiki.Api.Models.Category", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("CatImageId");

                    b.Property<int?>("CatPages");

                    b.Property<string>("CatTitle");

                    b.Property<string>("CatTitleVI");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int>("NumberOfSubcat");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CatImageId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Categories");
                });

            modelBuilder.Entity("EWiki.Api.Models.Character", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("Attack");

                    b.Property<int?>("AvatarImageId");

                    b.Property<float?>("CPGain");

                    b.Property<int?>("Candy");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int?>("Defense");

                    b.Property<string>("Description");

                    b.Property<int?>("EvolveFromId");

                    b.Property<string>("EvolveIntos");

                    b.Property<float?>("Height");

                    b.Property<float?>("MaxCP");

                    b.Property<string>("Name");

                    b.Property<string>("Number");

                    b.Property<string>("Slug");

                    b.Property<string>("Species");

                    b.Property<int?>("Stamina");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<float?>("Weight");

                    b.HasKey("Id");

                    b.HasIndex("AvatarImageId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("EvolveFromId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Characters");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterInfo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("CharacterInfoGroupId");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<bool>("IsMain");

                    b.Property<string>("Name");

                    b.Property<int>("Priority");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CharacterInfoGroupId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("CharacterInfos");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterInfoGroup", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Name");

                    b.Property<int>("Priority");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("CharacterInfoGroups");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterSection", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("CharacterId");

                    b.Property<int>("CharacterSectionGroupId");

                    b.Property<string>("Content");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Description");

                    b.Property<int>("Priority");

                    b.Property<string>("Slug");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CharacterId");

                    b.HasIndex("CharacterSectionGroupId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("CharacterSections");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterSectionGroup", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Name");

                    b.Property<int>("Priority");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("CharacterSectionGroups");
                });

            modelBuilder.Entity("EWiki.Api.Models.FileArchive", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ArchiveName");

                    b.Property<int>("BitDepth");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("DeletedReason");

                    b.Property<string>("FileDescription");

                    b.Property<string>("FileMediaType");

                    b.Property<string>("FileMime");

                    b.Property<int>("FileSize");

                    b.Property<string>("FileSource");

                    b.Property<int>("Height");

                    b.Property<string>("Name");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<string>("UploadedUserId");

                    b.Property<int>("Width");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UploadedUserId");

                    b.ToTable("FileArchives");
                });

            modelBuilder.Entity("EWiki.Api.Models.InfoValue", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("CharacterInfoId");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int>("LinkTo");

                    b.Property<int>("LinkToId");

                    b.Property<int>("Priority");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<string>("UrlFormat");

                    b.HasKey("Id");

                    b.HasIndex("CharacterInfoId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("InfoValues");
                });

            modelBuilder.Entity("EWiki.Api.Models.Location", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Description");

                    b.Property<int?>("LocationType");

                    b.Property<string>("Name");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("LocationType");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Locations");
                });

            modelBuilder.Entity("EWiki.Api.Models.Move", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<float>("Cooldown");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<float>("CritChange");

                    b.Property<float>("DPS");

                    b.Property<int>("Energy");

                    b.Property<int?>("MoveCategoryId");

                    b.Property<int?>("MoveType");

                    b.Property<string>("Name");

                    b.Property<float>("Power");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<float>("WithSTAB");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("MoveCategoryId");

                    b.HasIndex("MoveType");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Moves");
                });

            modelBuilder.Entity("EWiki.Api.Models.Page", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("ContentLanguage");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int?>("FeatureImageId");

                    b.Property<bool>("IsNewPage");

                    b.Property<bool>("IsRedirect");

                    b.Property<int>("NameSpace");

                    b.Property<int?>("NewestContent");

                    b.Property<decimal>("PageLength");

                    b.Property<int?>("TagId");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("FeatureImageId");

                    b.HasIndex("TagId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Pages");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageContent", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ContentFlags");

                    b.Property<string>("ContentText");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("PageContents");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageLang", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Language");

                    b.Property<int>("PageId");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("PageId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("PageLangs");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageMeta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("MetaKey");

                    b.Property<string>("MetaValue");

                    b.Property<int>("PageId");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("PageId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("PageMetas");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageRestriction", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<bool>("IsCascade");

                    b.Property<int?>("PageId");

                    b.Property<int>("PageRestrictedId");

                    b.Property<int>("ResLevel");

                    b.Property<int>("ResType");

                    b.Property<decimal>("ResctrictionExpiry");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("PageId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("PageRestrictions");
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonLocation", b =>
                {
                    b.Property<int>("CharacterId");

                    b.Property<int>("LocationId");

                    b.HasKey("CharacterId", "LocationId");

                    b.HasIndex("CharacterId");

                    b.HasIndex("LocationId");

                    b.ToTable("PokemonLocation");
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonMove", b =>
                {
                    b.Property<int>("CharacterId");

                    b.Property<int>("MoveId");

                    b.HasKey("CharacterId", "MoveId");

                    b.HasIndex("CharacterId");

                    b.HasIndex("MoveId");

                    b.ToTable("PokemonMove");
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonSpecialMove", b =>
                {
                    b.Property<int>("CharacterId");

                    b.Property<int>("MoveId");

                    b.HasKey("CharacterId", "MoveId");

                    b.HasIndex("CharacterId");

                    b.HasIndex("MoveId");

                    b.ToTable("PokemonSpecialMove");
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonType", b =>
                {
                    b.Property<int>("CharacterId");

                    b.Property<int>("TypeId");

                    b.HasKey("CharacterId", "TypeId");

                    b.HasIndex("CharacterId");

                    b.HasIndex("TypeId");

                    b.ToTable("Type");
                });

            modelBuilder.Entity("EWiki.Api.Models.ProtectedTitle", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int>("NameSpace");

                    b.Property<decimal>("ProtectExpiry");

                    b.Property<string>("ProtectReason");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<int?>("UserId");

                    b.Property<string>("UserProtectedId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UserProtectedId");

                    b.ToTable("ProtectedTitles");
                });

            modelBuilder.Entity("EWiki.Api.Models.RecentChange", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ChangeComment");

                    b.Property<string>("ChangeFromIpAddress");

                    b.Property<decimal?>("ChangeNewLength");

                    b.Property<decimal?>("ChangeOldLength");

                    b.Property<int>("ChangeType");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<bool>("IsCreateNew");

                    b.Property<bool>("IsDeletedAction");

                    b.Property<int>("NameSpace");

                    b.Property<int?>("PageId");

                    b.Property<string>("PageTitle");

                    b.Property<int?>("RevisionId");

                    b.Property<int?>("RevisionParentId");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<int>("UserId");

                    b.Property<string>("UserMakeChangeId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UserMakeChangeId");

                    b.ToTable("RecentChanges");
                });

            modelBuilder.Entity("EWiki.Api.Models.Reference", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Description");

                    b.Property<int>("LinkTo");

                    b.Property<int>("LinkToId");

                    b.Property<int>("Priority");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<string>("UrlFormat");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("References");
                });

            modelBuilder.Entity("EWiki.Api.Models.Revision", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("BelongToUserId");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int>("PageContentId");

                    b.Property<int>("PageId");

                    b.Property<int?>("RevParentId");

                    b.Property<string>("RevisionComment");

                    b.Property<bool>("RevivsionIsDeleted");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("BelongToUserId");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("PageContentId");

                    b.HasIndex("PageId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Revisions");
                });

            modelBuilder.Entity("EWiki.Api.Models.Site", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("SiteConfig");

                    b.Property<string>("SiteDomain");

                    b.Property<string>("SiteGroup");

                    b.Property<string>("SiteKey");

                    b.Property<string>("SiteLanguage");

                    b.Property<string>("SiteProtocol");

                    b.Property<string>("SiteSource");

                    b.Property<string>("SiteType");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Sites");
                });

            modelBuilder.Entity("EWiki.Api.Models.Tag", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Avatar");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("FullName");

                    b.Property<short>("Level");

                    b.Property<string>("NickName");

                    b.Property<int>("SearchCount");

                    b.Property<string>("ShortName");

                    b.Property<string>("Slug");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("Tags");
                });

            modelBuilder.Entity("EWiki.Api.Models.UserMeta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("MetaKey");

                    b.Property<string>("MetaValue");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<int>("UserId");

                    b.Property<string>("UserInUseId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UserInUseId");

                    b.ToTable("UserMetas");
                });

            modelBuilder.Entity("EWiki.Api.Models.UserNewtalk", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<int>("UserId");

                    b.Property<string>("UserIp");

                    b.Property<DateTime>("UserLastSeen");

                    b.Property<string>("UserSeenId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("UserSeenId");

                    b.ToTable("UserNewtalks");
                });

            modelBuilder.Entity("EWiki.Api.Models.WatchList", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<int>("NameSpace");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<int>("UserId");

                    b.Property<string>("WatchTitle");

                    b.Property<string>("WatchedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.HasIndex("WatchedUserId");

                    b.ToTable("WatchLists");
                });

            modelBuilder.Entity("EWiki.Api.Models.WikiImage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("BitDepth");

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("ImageDescription");

                    b.Property<int>("ImageHeight");

                    b.Property<string>("ImageMediaType");

                    b.Property<string>("ImageMime");

                    b.Property<string>("ImageName");

                    b.Property<int>("ImageSize");

                    b.Property<string>("ImageUrl");

                    b.Property<int>("ImageWidth");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("WikiImages");
                });

            modelBuilder.Entity("EWiki.Api.Models.WikiVideo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreatedDate");

                    b.Property<string>("CreatedUserId");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<string>("Picture");

                    b.Property<int>("Priority");

                    b.Property<string>("Title");

                    b.Property<DateTime?>("UpdatedDate");

                    b.Property<string>("UpdatedUserId");

                    b.Property<string>("Url");

                    b.Property<int>("VideoType");

                    b.HasKey("Id");

                    b.HasIndex("CreatedUserId");

                    b.HasIndex("UpdatedUserId");

                    b.ToTable("WikiVideos");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityRole", b =>
                {
                    b.Property<string>("Id");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Name")
                        .HasAnnotation("MaxLength", 256);

                    b.Property<string>("NormalizedName")
                        .HasAnnotation("MaxLength", 256);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .HasName("RoleNameIndex");

                    b.ToTable("AspNetRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<string>("RoleId")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUser", b =>
                {
                    b.Property<string>("Id");

                    b.Property<int>("AccessFailedCount");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Discriminator")
                        .IsRequired();

                    b.Property<string>("Email")
                        .HasAnnotation("MaxLength", 256);

                    b.Property<bool>("EmailConfirmed");

                    b.Property<bool>("LockoutEnabled");

                    b.Property<DateTimeOffset?>("LockoutEnd");

                    b.Property<string>("NormalizedEmail")
                        .HasAnnotation("MaxLength", 256);

                    b.Property<string>("NormalizedUserName")
                        .HasAnnotation("MaxLength", 256);

                    b.Property<string>("PasswordHash");

                    b.Property<string>("PhoneNumber");

                    b.Property<bool>("PhoneNumberConfirmed");

                    b.Property<string>("SecurityStamp");

                    b.Property<bool>("TwoFactorEnabled");

                    b.Property<string>("UserName")
                        .HasAnnotation("MaxLength", 256);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasName("UserNameIndex");

                    b.ToTable("AspNetUsers");

                    b.HasDiscriminator<string>("Discriminator").HasValue("IdentityUser");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<string>("UserId")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider");

                    b.Property<string>("ProviderKey");

                    b.Property<string>("ProviderDisplayName");

                    b.Property<string>("UserId")
                        .IsRequired();

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId");

                    b.Property<string>("RoleId");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId");

                    b.Property<string>("LoginProvider");

                    b.Property<string>("Name");

                    b.Property<string>("Value");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens");
                });

            modelBuilder.Entity("EWiki.Api.Models.User", b =>
                {
                    b.HasBaseType("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUser");


                    b.ToTable("User");

                    b.HasDiscriminator().HasValue("User");
                });

            modelBuilder.Entity("EWiki.Api.Models.Archive", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "BelongToUser")
                        .WithMany()
                        .HasForeignKey("BelongToUserId");

                    b.HasOne("EWiki.Api.Models.PageContent", "Content")
                        .WithMany()
                        .HasForeignKey("ContentId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.BlockedIp", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "BlockByUser")
                        .WithMany()
                        .HasForeignKey("BlockByUserId");

                    b.HasOne("EWiki.Api.Models.BlockedIp")
                        .WithMany("ParentIpBlock")
                        .HasForeignKey("BlockedIpId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UserBlocked")
                        .WithMany()
                        .HasForeignKey("UserBlockedId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Category", b =>
                {
                    b.HasOne("EWiki.Api.Models.WikiImage", "CatImage")
                        .WithMany()
                        .HasForeignKey("CatImageId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Character", b =>
                {
                    b.HasOne("EWiki.Api.Models.WikiImage", "Avatar")
                        .WithMany()
                        .HasForeignKey("AvatarImageId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Character", "EvolveFrom")
                        .WithMany()
                        .HasForeignKey("EvolveFromId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterInfo", b =>
                {
                    b.HasOne("EWiki.Api.Models.CharacterInfoGroup", "CharacterInfoGroup")
                        .WithMany("CharacterInfos")
                        .HasForeignKey("CharacterInfoGroupId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterInfoGroup", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterSection", b =>
                {
                    b.HasOne("EWiki.Api.Models.Character", "Character")
                        .WithMany()
                        .HasForeignKey("CharacterId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.CharacterSectionGroup", "CharacterSectionGroup")
                        .WithMany("CharacterSections")
                        .HasForeignKey("CharacterSectionGroupId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.CharacterSectionGroup", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.FileArchive", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UploadedUser")
                        .WithMany()
                        .HasForeignKey("UploadedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.InfoValue", b =>
                {
                    b.HasOne("EWiki.Api.Models.CharacterInfo")
                        .WithMany("InfoValues")
                        .HasForeignKey("CharacterInfoId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Location", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Category", "Type")
                        .WithMany()
                        .HasForeignKey("LocationType");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Move", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Category", "MoveCategory")
                        .WithMany()
                        .HasForeignKey("MoveCategoryId");

                    b.HasOne("EWiki.Api.Models.Category", "Type")
                        .WithMany()
                        .HasForeignKey("MoveType");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Page", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.WikiImage", "FeaturesImage")
                        .WithMany()
                        .HasForeignKey("FeatureImageId");

                    b.HasOne("EWiki.Api.Models.Tag")
                        .WithMany("Pages")
                        .HasForeignKey("TagId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageContent", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageLang", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Page")
                        .WithMany("PageLangs")
                        .HasForeignKey("PageId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageMeta", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Page", "PageInUse")
                        .WithMany("PageMetas")
                        .HasForeignKey("PageId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.PageRestriction", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.Page")
                        .WithMany("PageRestrictions")
                        .HasForeignKey("PageId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonLocation", b =>
                {
                    b.HasOne("EWiki.Api.Models.Character", "Pokemon")
                        .WithMany("Locations")
                        .HasForeignKey("CharacterId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.Location", "PokeLocation")
                        .WithMany("PokemonLocations")
                        .HasForeignKey("LocationId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonMove", b =>
                {
                    b.HasOne("EWiki.Api.Models.Character", "Pokemon")
                        .WithMany("NormalMoves")
                        .HasForeignKey("CharacterId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.Move", "PokeMove")
                        .WithMany("PokemoMoves")
                        .HasForeignKey("MoveId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonSpecialMove", b =>
                {
                    b.HasOne("EWiki.Api.Models.Character", "Pokemon")
                        .WithMany("SpecialMoves")
                        .HasForeignKey("CharacterId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.Move", "PokeSpecialMove")
                        .WithMany("PokemoSpecialMoves")
                        .HasForeignKey("MoveId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EWiki.Api.Models.PokemonType", b =>
                {
                    b.HasOne("EWiki.Api.Models.Character", "Pokemon")
                        .WithMany("Types")
                        .HasForeignKey("CharacterId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.Category", "Type")
                        .WithMany("PokemoTypes")
                        .HasForeignKey("TypeId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EWiki.Api.Models.ProtectedTitle", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UserProtected")
                        .WithMany()
                        .HasForeignKey("UserProtectedId");
                });

            modelBuilder.Entity("EWiki.Api.Models.RecentChange", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UserMakeChange")
                        .WithMany()
                        .HasForeignKey("UserMakeChangeId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Reference", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Revision", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "BelongToUser")
                        .WithMany()
                        .HasForeignKey("BelongToUserId");

                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.PageContent", "Content")
                        .WithMany()
                        .HasForeignKey("PageContentId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.Page")
                        .WithMany("Revisions")
                        .HasForeignKey("PageId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Site", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.Tag", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.UserMeta", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UserInUse")
                        .WithMany()
                        .HasForeignKey("UserInUseId");
                });

            modelBuilder.Entity("EWiki.Api.Models.UserNewtalk", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UserSeen")
                        .WithMany()
                        .HasForeignKey("UserSeenId");
                });

            modelBuilder.Entity("EWiki.Api.Models.WatchList", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "WatchedUser")
                        .WithMany()
                        .HasForeignKey("WatchedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.WikiImage", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("EWiki.Api.Models.WikiVideo", b =>
                {
                    b.HasOne("EWiki.Api.Models.User", "CreatedUser")
                        .WithMany()
                        .HasForeignKey("CreatedUserId");

                    b.HasOne("EWiki.Api.Models.User", "UpdatedUser")
                        .WithMany()
                        .HasForeignKey("UpdatedUserId");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityRole")
                        .WithMany("Claims")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUser")
                        .WithMany("Claims")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUser")
                        .WithMany("Logins")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityRole")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("Microsoft.AspNetCore.Identity.EntityFrameworkCore.IdentityUser")
                        .WithMany("Roles")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
        }
    }
}
