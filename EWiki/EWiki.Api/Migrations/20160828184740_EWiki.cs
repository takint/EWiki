using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EWiki.Api.Migrations
{
    public partial class EWiki : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    Discriminator = table.Column<string>(nullable: false),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    PasswordHash = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    SecurityStamp = table.Column<string>(nullable: true),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(nullable: false),
                    Name = table.Column<string>(nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BlockedIps",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    AnonymousOnly = table.Column<bool>(nullable: false),
                    BlockByUserId = table.Column<string>(nullable: true),
                    BlockCreateAccount = table.Column<bool>(nullable: false),
                    BlockExpiry = table.Column<decimal>(nullable: false),
                    BlockReason = table.Column<string>(nullable: true),
                    BlockUserEdit = table.Column<bool>(nullable: false),
                    BlockedIpId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IpAddress = table.Column<string>(nullable: true),
                    IpRangeEnd = table.Column<string>(nullable: true),
                    IpRangeStart = table.Column<string>(nullable: true),
                    ParentBlock = table.Column<int>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserBlockedId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BlockedIps", x => x.Id);
                    table.ForeignKey(
                        name: "FK_BlockedIps_AspNetUsers_BlockByUserId",
                        column: x => x.BlockByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BlockedIps_BlockedIps_BlockedIpId",
                        column: x => x.BlockedIpId,
                        principalTable: "BlockedIps",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BlockedIps_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BlockedIps_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BlockedIps_AspNetUsers_UserBlockedId",
                        column: x => x.UserBlockedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Characters",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Attack = table.Column<int>(nullable: false),
                    CPGain = table.Column<float>(nullable: false),
                    Candy = table.Column<int>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Defense = table.Column<int>(nullable: false),
                    Description = table.Column<string>(nullable: true),
                    EvolveFromId = table.Column<int>(nullable: false),
                    Height = table.Column<float>(nullable: false),
                    MaxCP = table.Column<float>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Number = table.Column<string>(nullable: true),
                    Slug = table.Column<string>(nullable: true),
                    Species = table.Column<string>(nullable: true),
                    Stamina = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    Weight = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Characters", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Characters_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Characters_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "FileArchives",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ArchiveName = table.Column<string>(nullable: true),
                    BitDepth = table.Column<int>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    DeletedReason = table.Column<string>(nullable: true),
                    FileDescription = table.Column<string>(nullable: true),
                    FileMediaType = table.Column<string>(nullable: true),
                    FileMime = table.Column<string>(nullable: true),
                    FileSize = table.Column<int>(nullable: false),
                    FileSource = table.Column<string>(nullable: true),
                    Height = table.Column<int>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UploadedUserId = table.Column<string>(nullable: true),
                    Width = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FileArchives", x => x.Id);
                    table.ForeignKey(
                        name: "FK_FileArchives_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_FileArchives_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_FileArchives_AspNetUsers_UploadedUserId",
                        column: x => x.UploadedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PageContents",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ContentFlags = table.Column<string>(nullable: true),
                    ContentText = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PageContents", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PageContents_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PageContents_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ProtectedTitles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    NameSpace = table.Column<int>(nullable: false),
                    ProtectExpiry = table.Column<decimal>(nullable: false),
                    ProtectReason = table.Column<string>(nullable: true),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: true),
                    UserProtectedId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProtectedTitles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProtectedTitles_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProtectedTitles_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProtectedTitles_AspNetUsers_UserProtectedId",
                        column: x => x.UserProtectedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "RecentChanges",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ChangeComment = table.Column<string>(nullable: true),
                    ChangeFromIpAddress = table.Column<string>(nullable: true),
                    ChangeNewLength = table.Column<decimal>(nullable: true),
                    ChangeOldLength = table.Column<decimal>(nullable: true),
                    ChangeType = table.Column<int>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IsCreateNew = table.Column<bool>(nullable: false),
                    IsDeletedAction = table.Column<bool>(nullable: false),
                    NameSpace = table.Column<int>(nullable: false),
                    PageId = table.Column<int>(nullable: true),
                    PageTitle = table.Column<string>(nullable: true),
                    RevisionId = table.Column<int>(nullable: true),
                    RevisionParentId = table.Column<int>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: false),
                    UserMakeChangeId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RecentChanges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RecentChanges_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RecentChanges_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RecentChanges_AspNetUsers_UserMakeChangeId",
                        column: x => x.UserMakeChangeId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sites",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    SiteConfig = table.Column<string>(nullable: true),
                    SiteDomain = table.Column<string>(nullable: true),
                    SiteGroup = table.Column<string>(nullable: true),
                    SiteKey = table.Column<string>(nullable: true),
                    SiteLanguage = table.Column<string>(nullable: true),
                    SiteProtocol = table.Column<string>(nullable: true),
                    SiteSource = table.Column<string>(nullable: true),
                    SiteType = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sites", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sites_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sites_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Tags",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Avatar = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    FullName = table.Column<string>(nullable: true),
                    Level = table.Column<short>(nullable: false),
                    NickName = table.Column<string>(nullable: true),
                    SearchCount = table.Column<int>(nullable: false),
                    ShortName = table.Column<string>(nullable: true),
                    Slug = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tags", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Tags_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Tags_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UserMetas",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    MetaKey = table.Column<string>(nullable: true),
                    MetaValue = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: false),
                    UserInUseId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserMetas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserMetas_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserMetas_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserMetas_AspNetUsers_UserInUseId",
                        column: x => x.UserInUseId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UserNewtalks",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: false),
                    UserIp = table.Column<string>(nullable: true),
                    UserLastSeen = table.Column<DateTime>(nullable: false),
                    UserSeenId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserNewtalks", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserNewtalks_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserNewtalks_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserNewtalks_AspNetUsers_UserSeenId",
                        column: x => x.UserSeenId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "WatchLists",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    NameSpace = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: false),
                    WatchTitle = table.Column<string>(nullable: true),
                    WatchedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WatchLists", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WatchLists_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WatchLists_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WatchLists_AspNetUsers_WatchedUserId",
                        column: x => x.WatchedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(nullable: false),
                    ProviderKey = table.Column<string>(nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CharacterInfoGroups",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    Priority = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CharacterInfoGroups", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CharacterInfoGroups_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterInfoGroups_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterInfoGroups_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CharacterSectionGroups",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    Priority = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CharacterSectionGroups", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CharacterSectionGroups_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterSectionGroups_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterSectionGroups_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Locations",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Locations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Locations_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Locations_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Locations_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Moves",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Category = table.Column<string>(nullable: true),
                    CharacterId = table.Column<int>(nullable: true),
                    CharacterId1 = table.Column<int>(nullable: true),
                    Cooldown = table.Column<float>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    CritChange = table.Column<float>(nullable: false),
                    DPS = table.Column<float>(nullable: false),
                    Energy = table.Column<int>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Power = table.Column<float>(nullable: false),
                    Type = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    WithSTAB = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Moves", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Moves_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Moves_Characters_CharacterId1",
                        column: x => x.CharacterId1,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Moves_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Moves_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "References",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    LinkTo = table.Column<int>(nullable: false),
                    LinkToId = table.Column<int>(nullable: false),
                    Priority = table.Column<int>(nullable: false),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UrlFormat = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_References", x => x.Id);
                    table.ForeignKey(
                        name: "FK_References_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_References_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_References_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "WikiImages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    BitDepth = table.Column<int>(nullable: false),
                    CharacterId = table.Column<int>(nullable: true),
                    CharacterId1 = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    ImageDescription = table.Column<string>(nullable: true),
                    ImageHeight = table.Column<int>(nullable: false),
                    ImageMediaType = table.Column<string>(nullable: true),
                    ImageMime = table.Column<string>(nullable: true),
                    ImageName = table.Column<string>(nullable: true),
                    ImageSize = table.Column<int>(nullable: false),
                    ImageWidth = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WikiImages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WikiImages_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WikiImages_Characters_CharacterId1",
                        column: x => x.CharacterId1,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WikiImages_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WikiImages_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "WikiVideos",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    Picture = table.Column<string>(nullable: true),
                    Priority = table.Column<int>(nullable: false),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    Url = table.Column<string>(nullable: true),
                    VideoType = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WikiVideos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WikiVideos_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WikiVideos_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WikiVideos_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Archives",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ArchiveComment = table.Column<string>(nullable: true),
                    ArchiveLength = table.Column<int>(nullable: false),
                    ArchivePageId = table.Column<int>(nullable: true),
                    ArchiveParentId = table.Column<int>(nullable: true),
                    BelongToUserId = table.Column<string>(nullable: true),
                    ContentId = table.Column<int>(nullable: true),
                    ContentText = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    NameSpace = table.Column<int>(nullable: false),
                    ReversionId = table.Column<int>(nullable: true),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Archives", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Archives_AspNetUsers_BelongToUserId",
                        column: x => x.BelongToUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Archives_PageContents_ContentId",
                        column: x => x.ContentId,
                        principalTable: "PageContents",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Archives_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Archives_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Pages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ContentLanguage = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IsNewPage = table.Column<bool>(nullable: false),
                    IsRedirect = table.Column<bool>(nullable: false),
                    NameSpace = table.Column<int>(nullable: false),
                    NewestContent = table.Column<int>(nullable: true),
                    PageLength = table.Column<decimal>(nullable: false),
                    TagId = table.Column<int>(nullable: true),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pages_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Pages_Tags_TagId",
                        column: x => x.TagId,
                        principalTable: "Tags",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Pages_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CharacterInfos",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: false),
                    CharacterInfoGroupId = table.Column<int>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IsMain = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Priority = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CharacterInfos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CharacterInfos_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId",
                        column: x => x.CharacterInfoGroupId,
                        principalTable: "CharacterInfoGroups",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CharacterInfos_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterInfos_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CharacterSections",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterId = table.Column<int>(nullable: false),
                    CharacterSectionGroupId = table.Column<int>(nullable: false),
                    Content = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    Priority = table.Column<int>(nullable: false),
                    Slug = table.Column<string>(nullable: true),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CharacterSections", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CharacterSections_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CharacterSections_CharacterSectionGroups_CharacterSectionGroupId",
                        column: x => x.CharacterSectionGroupId,
                        principalTable: "CharacterSectionGroups",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CharacterSections_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CharacterSections_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CatPages = table.Column<int>(nullable: false),
                    CatTitle = table.Column<string>(nullable: true),
                    CharacterId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    LocationId = table.Column<int>(nullable: true),
                    NumberOfSubcat = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Categories_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Categories_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Categories_Locations_LocationId",
                        column: x => x.LocationId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Categories_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PageLangs",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    Language = table.Column<string>(nullable: true),
                    PageId = table.Column<int>(nullable: false),
                    Title = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PageLangs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PageLangs_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PageLangs_Pages_PageId",
                        column: x => x.PageId,
                        principalTable: "Pages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PageLangs_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PageMetas",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    MetaKey = table.Column<string>(nullable: true),
                    MetaValue = table.Column<string>(nullable: true),
                    PageId = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PageMetas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PageMetas_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PageMetas_Pages_PageId",
                        column: x => x.PageId,
                        principalTable: "Pages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PageMetas_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PageRestrictions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    IsCascade = table.Column<bool>(nullable: false),
                    PageResctrictedId = table.Column<int>(nullable: true),
                    PageRestrictedId = table.Column<int>(nullable: false),
                    ResLevel = table.Column<int>(nullable: false),
                    ResType = table.Column<int>(nullable: false),
                    ResctrictionExpiry = table.Column<decimal>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PageRestrictions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PageRestrictions_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PageRestrictions_Pages_PageResctrictedId",
                        column: x => x.PageResctrictedId,
                        principalTable: "Pages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PageRestrictions_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Revisions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    BelongToUserId = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    PageContentId = table.Column<int>(nullable: false),
                    PageId = table.Column<int>(nullable: false),
                    RevParentId = table.Column<int>(nullable: true),
                    RevisionComment = table.Column<string>(nullable: true),
                    RevivsionIsDeleted = table.Column<bool>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Revisions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Revisions_AspNetUsers_BelongToUserId",
                        column: x => x.BelongToUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Revisions_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Revisions_PageContents_PageContentId",
                        column: x => x.PageContentId,
                        principalTable: "PageContents",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Revisions_Pages_PageId",
                        column: x => x.PageId,
                        principalTable: "Pages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Revisions_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "InfoValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CharacterInfoId = table.Column<int>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    LinkTo = table.Column<int>(nullable: false),
                    LinkToId = table.Column<int>(nullable: false),
                    Priority = table.Column<int>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true),
                    UrlFormat = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InfoValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_InfoValues_CharacterInfos_CharacterInfoId",
                        column: x => x.CharacterInfoId,
                        principalTable: "CharacterInfos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_InfoValues_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_InfoValues_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Archives_BelongToUserId",
                table: "Archives",
                column: "BelongToUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Archives_ContentId",
                table: "Archives",
                column: "ContentId");

            migrationBuilder.CreateIndex(
                name: "IX_Archives_CreatedUserId",
                table: "Archives",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Archives_UpdatedUserId",
                table: "Archives",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_BlockedIps_BlockByUserId",
                table: "BlockedIps",
                column: "BlockByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_BlockedIps_BlockedIpId",
                table: "BlockedIps",
                column: "BlockedIpId");

            migrationBuilder.CreateIndex(
                name: "IX_BlockedIps_CreatedUserId",
                table: "BlockedIps",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_BlockedIps_UpdatedUserId",
                table: "BlockedIps",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_BlockedIps_UserBlockedId",
                table: "BlockedIps",
                column: "UserBlockedId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_CharacterId",
                table: "Categories",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_CreatedUserId",
                table: "Categories",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_LocationId",
                table: "Categories",
                column: "LocationId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_UpdatedUserId",
                table: "Categories",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Characters_CreatedUserId",
                table: "Characters",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Characters_EvolveFromId",
                table: "Characters",
                column: "EvolveFromId");

            migrationBuilder.CreateIndex(
                name: "IX_Characters_UpdatedUserId",
                table: "Characters",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfos_CharacterId",
                table: "CharacterInfos",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfos_CharacterInfoGroupId",
                table: "CharacterInfos",
                column: "CharacterInfoGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfos_CreatedUserId",
                table: "CharacterInfos",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfos_UpdatedUserId",
                table: "CharacterInfos",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfoGroups_CharacterId",
                table: "CharacterInfoGroups",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfoGroups_CreatedUserId",
                table: "CharacterInfoGroups",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfoGroups_UpdatedUserId",
                table: "CharacterInfoGroups",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSections_CharacterId",
                table: "CharacterSections",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSections_CharacterSectionGroupId",
                table: "CharacterSections",
                column: "CharacterSectionGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSections_CreatedUserId",
                table: "CharacterSections",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSections_UpdatedUserId",
                table: "CharacterSections",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSectionGroups_CharacterId",
                table: "CharacterSectionGroups",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSectionGroups_CreatedUserId",
                table: "CharacterSectionGroups",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSectionGroups_UpdatedUserId",
                table: "CharacterSectionGroups",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_FileArchives_CreatedUserId",
                table: "FileArchives",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_FileArchives_UpdatedUserId",
                table: "FileArchives",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_FileArchives_UploadedUserId",
                table: "FileArchives",
                column: "UploadedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_InfoValues_CharacterInfoId",
                table: "InfoValues",
                column: "CharacterInfoId");

            migrationBuilder.CreateIndex(
                name: "IX_InfoValues_CreatedUserId",
                table: "InfoValues",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_InfoValues_UpdatedUserId",
                table: "InfoValues",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_CharacterId",
                table: "Locations",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_CreatedUserId",
                table: "Locations",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_UpdatedUserId",
                table: "Locations",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_CharacterId",
                table: "Moves",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_CharacterId1",
                table: "Moves",
                column: "CharacterId1");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_CreatedUserId",
                table: "Moves",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_UpdatedUserId",
                table: "Moves",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Pages_CreatedUserId",
                table: "Pages",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Pages_TagId",
                table: "Pages",
                column: "TagId");

            migrationBuilder.CreateIndex(
                name: "IX_Pages_UpdatedUserId",
                table: "Pages",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageContents_CreatedUserId",
                table: "PageContents",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageContents_UpdatedUserId",
                table: "PageContents",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageLangs_CreatedUserId",
                table: "PageLangs",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageLangs_PageId",
                table: "PageLangs",
                column: "PageId");

            migrationBuilder.CreateIndex(
                name: "IX_PageLangs_UpdatedUserId",
                table: "PageLangs",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageMetas_CreatedUserId",
                table: "PageMetas",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageMetas_PageId",
                table: "PageMetas",
                column: "PageId");

            migrationBuilder.CreateIndex(
                name: "IX_PageMetas_UpdatedUserId",
                table: "PageMetas",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageRestrictions_CreatedUserId",
                table: "PageRestrictions",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_PageRestrictions_PageResctrictedId",
                table: "PageRestrictions",
                column: "PageResctrictedId");

            migrationBuilder.CreateIndex(
                name: "IX_PageRestrictions_UpdatedUserId",
                table: "PageRestrictions",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ProtectedTitles_CreatedUserId",
                table: "ProtectedTitles",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ProtectedTitles_UpdatedUserId",
                table: "ProtectedTitles",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ProtectedTitles_UserProtectedId",
                table: "ProtectedTitles",
                column: "UserProtectedId");

            migrationBuilder.CreateIndex(
                name: "IX_RecentChanges_CreatedUserId",
                table: "RecentChanges",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_RecentChanges_UpdatedUserId",
                table: "RecentChanges",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_RecentChanges_UserMakeChangeId",
                table: "RecentChanges",
                column: "UserMakeChangeId");

            migrationBuilder.CreateIndex(
                name: "IX_References_CharacterId",
                table: "References",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_References_CreatedUserId",
                table: "References",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_References_UpdatedUserId",
                table: "References",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Revisions_BelongToUserId",
                table: "Revisions",
                column: "BelongToUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Revisions_CreatedUserId",
                table: "Revisions",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Revisions_PageContentId",
                table: "Revisions",
                column: "PageContentId");

            migrationBuilder.CreateIndex(
                name: "IX_Revisions_PageId",
                table: "Revisions",
                column: "PageId");

            migrationBuilder.CreateIndex(
                name: "IX_Revisions_UpdatedUserId",
                table: "Revisions",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sites_CreatedUserId",
                table: "Sites",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sites_UpdatedUserId",
                table: "Sites",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Tags_CreatedUserId",
                table: "Tags",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Tags_UpdatedUserId",
                table: "Tags",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserMetas_CreatedUserId",
                table: "UserMetas",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserMetas_UpdatedUserId",
                table: "UserMetas",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserMetas_UserInUseId",
                table: "UserMetas",
                column: "UserInUseId");

            migrationBuilder.CreateIndex(
                name: "IX_UserNewtalks_CreatedUserId",
                table: "UserNewtalks",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserNewtalks_UpdatedUserId",
                table: "UserNewtalks",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserNewtalks_UserSeenId",
                table: "UserNewtalks",
                column: "UserSeenId");

            migrationBuilder.CreateIndex(
                name: "IX_WatchLists_CreatedUserId",
                table: "WatchLists",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WatchLists_UpdatedUserId",
                table: "WatchLists",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WatchLists_WatchedUserId",
                table: "WatchLists",
                column: "WatchedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_CharacterId",
                table: "WikiImages",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_CharacterId1",
                table: "WikiImages",
                column: "CharacterId1");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_CreatedUserId",
                table: "WikiImages",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_UpdatedUserId",
                table: "WikiImages",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiVideos_CharacterId",
                table: "WikiVideos",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiVideos_CreatedUserId",
                table: "WikiVideos",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiVideos_UpdatedUserId",
                table: "WikiVideos",
                column: "UpdatedUserId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_UserId",
                table: "AspNetUserRoles",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Archives");

            migrationBuilder.DropTable(
                name: "BlockedIps");

            migrationBuilder.DropTable(
                name: "Categories");

            migrationBuilder.DropTable(
                name: "CharacterSections");

            migrationBuilder.DropTable(
                name: "FileArchives");

            migrationBuilder.DropTable(
                name: "InfoValues");

            migrationBuilder.DropTable(
                name: "Moves");

            migrationBuilder.DropTable(
                name: "PageLangs");

            migrationBuilder.DropTable(
                name: "PageMetas");

            migrationBuilder.DropTable(
                name: "PageRestrictions");

            migrationBuilder.DropTable(
                name: "ProtectedTitles");

            migrationBuilder.DropTable(
                name: "RecentChanges");

            migrationBuilder.DropTable(
                name: "References");

            migrationBuilder.DropTable(
                name: "Revisions");

            migrationBuilder.DropTable(
                name: "Sites");

            migrationBuilder.DropTable(
                name: "UserMetas");

            migrationBuilder.DropTable(
                name: "UserNewtalks");

            migrationBuilder.DropTable(
                name: "WatchLists");

            migrationBuilder.DropTable(
                name: "WikiImages");

            migrationBuilder.DropTable(
                name: "WikiVideos");

            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Locations");

            migrationBuilder.DropTable(
                name: "CharacterSectionGroups");

            migrationBuilder.DropTable(
                name: "CharacterInfos");

            migrationBuilder.DropTable(
                name: "PageContents");

            migrationBuilder.DropTable(
                name: "Pages");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "CharacterInfoGroups");

            migrationBuilder.DropTable(
                name: "Tags");

            migrationBuilder.DropTable(
                name: "Characters");

            migrationBuilder.DropTable(
                name: "AspNetUsers");
        }
    }
}
