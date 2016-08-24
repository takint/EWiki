namespace EWiki.DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDB : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Archives",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NameSpace = c.Int(nullable: false),
                        Title = c.String(),
                        ContentText = c.String(),
                        ArchiveComment = c.String(),
                        ReversionId = c.Int(),
                        IsDeleted = c.Boolean(nullable: false),
                        ArchiveLength = c.Int(nullable: false),
                        ArchivePageId = c.Int(),
                        ArchiveParentId = c.Int(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        User_Id = c.String(maxLength: 128),
                        Content_Id = c.Int(),
                        BelongToUser_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .ForeignKey("dbo.PageContents", t => t.Content_Id)
                .ForeignKey("dbo.Users", t => t.BelongToUser_Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.User_Id)
                .Index(t => t.Content_Id)
                .Index(t => t.BelongToUser_Id);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FirstName = c.String(),
                        LastName = c.String(),
                        UserTouched = c.String(),
                        JoinedDate = c.DateTime(nullable: false),
                        UserEditcount = c.Int(),
                        IsActived = c.Boolean(nullable: false),
                        Email = c.String(),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.BlockedIps",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        IpAddress = c.String(),
                        BlockReason = c.String(),
                        BlockUserEdit = c.Boolean(nullable: false),
                        AnonymousOnly = c.Boolean(nullable: false),
                        BlockCreateAccount = c.Boolean(nullable: false),
                        BlockExpiry = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IpRangeStart = c.String(),
                        IpRangeEnd = c.String(),
                        ParentBlock = c.Int(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        BlockByUser_Id = c.String(maxLength: 128),
                        BlockedIp_Id = c.Int(),
                        UserBlocked_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.BlockByUser_Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.BlockedIps", t => t.BlockedIp_Id)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UserBlocked_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.BlockByUser_Id)
                .Index(t => t.BlockedIp_Id)
                .Index(t => t.UserBlocked_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.FileArchives",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        ArchiveName = c.String(),
                        FileSource = c.String(),
                        DeletedReason = c.String(),
                        FileSize = c.Int(nullable: false),
                        Width = c.Int(nullable: false),
                        Height = c.Int(nullable: false),
                        BitDepth = c.Int(nullable: false),
                        FileMediaType = c.String(),
                        FileMime = c.String(),
                        FileDescription = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        UploadedUser_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UploadedUser_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.UploadedUser_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.WikiImages",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ImageName = c.String(),
                        ImageSize = c.Int(nullable: false),
                        ImageWidth = c.Int(nullable: false),
                        ImageHeight = c.Int(nullable: false),
                        BitDepth = c.Int(nullable: false),
                        ImageMediaType = c.String(),
                        ImageMime = c.String(),
                        ImageDescription = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.ProtectedTitles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NameSpace = c.Int(nullable: false),
                        Title = c.String(),
                        UserId = c.Int(),
                        ProtectReason = c.String(),
                        ProtectExpiry = c.Decimal(nullable: false, precision: 18, scale: 2),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        UserProtected_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UserProtected_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.UserProtected_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.RecentChanges",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        NameSpace = c.Int(nullable: false),
                        PageTitle = c.String(),
                        ChangeComment = c.String(),
                        IsCreateNew = c.Boolean(nullable: false),
                        PageId = c.Int(),
                        RevisionId = c.Int(),
                        RevisionParentId = c.Int(),
                        ChangeType = c.Int(nullable: false),
                        ChangeFromIpAddress = c.String(),
                        ChangeOldLength = c.Decimal(precision: 18, scale: 2),
                        ChangeNewLength = c.Decimal(precision: 18, scale: 2),
                        IsDeletedAction = c.Boolean(nullable: false),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        UserMakeChange_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UserMakeChange_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.UserMakeChange_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.Revisions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PageId = c.Int(nullable: false),
                        PageContentId = c.Int(nullable: false),
                        RevisionComment = c.String(),
                        RevivsionIsDeleted = c.Boolean(nullable: false),
                        RevParentId = c.Int(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        BelongToUser_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.BelongToUser_Id)
                .ForeignKey("dbo.PageContents", t => t.PageContentId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Pages", t => t.PageId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.PageId)
                .Index(t => t.PageContentId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.BelongToUser_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.PageContents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ContentText = c.String(),
                        ContentFlags = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
            CreateTable(
                "dbo.Pages",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NameSpace = c.Int(nullable: false),
                        Title = c.String(),
                        IsRedirect = c.Boolean(nullable: false),
                        IsNewPage = c.Boolean(nullable: false),
                        NewestContent = c.Int(),
                        PageLength = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ContentLanguage = c.Int(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        Tag_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Tags", t => t.Tag_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.Tag_Id);
            
            CreateTable(
                "dbo.PageLangs",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PageId = c.Int(nullable: false),
                        Language = c.String(),
                        Title = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Pages", t => t.PageId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.PageId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
            CreateTable(
                "dbo.PageMetas",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PageId = c.Int(nullable: false),
                        MetaKey = c.String(),
                        MetaValue = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Pages", t => t.PageId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.PageId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
            CreateTable(
                "dbo.PageRestrictions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PageRestrictedId = c.Int(nullable: false),
                        ResType = c.Int(nullable: false),
                        ResLevel = c.Int(nullable: false),
                        IsCascade = c.Boolean(nullable: false),
                        ResctrictionExpiry = c.Decimal(nullable: false, precision: 18, scale: 2),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        PageResctricted_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Pages", t => t.PageResctricted_Id)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.PageResctricted_Id);
            
            CreateTable(
                "dbo.UserMetas",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        MetaKey = c.String(),
                        MetaValue = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        UserInUse_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UserInUse_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.UserInUse_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.UserNewtalks",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        UserIp = c.String(),
                        UserLastSeen = c.DateTime(nullable: false),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        UserSeen_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.UserSeen_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.UserSeen_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.WatchLists",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        NameSpace = c.Int(nullable: false),
                        WatchTitle = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                        WatchedUser_Id = c.String(maxLength: 128),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .ForeignKey("dbo.Users", t => t.WatchedUser_Id)
                .ForeignKey("dbo.Users", t => t.User_Id)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId)
                .Index(t => t.WatchedUser_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CatTitle = c.String(),
                        CatPages = c.Int(nullable: false),
                        NumberOfSubcat = c.Int(nullable: false),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
            CreateTable(
                "dbo.Sites",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SiteKey = c.String(),
                        SiteType = c.String(),
                        SiteGroup = c.String(),
                        SiteSource = c.String(),
                        SiteLanguage = c.String(),
                        SiteProtocol = c.String(),
                        SiteDomain = c.String(),
                        SiteConfig = c.String(),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
            CreateTable(
                "dbo.Tags",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FullName = c.String(),
                        ShortName = c.String(),
                        NickName = c.String(),
                        Slug = c.String(),
                        Avatar = c.String(),
                        SearchCount = c.Int(nullable: false),
                        Level = c.Short(nullable: false),
                        CreatedUserId = c.String(maxLength: 128),
                        CreatedDate = c.DateTime(nullable: false),
                        UpdatedUserId = c.String(maxLength: 128),
                        UpdatedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatedUserId)
                .ForeignKey("dbo.Users", t => t.UpdatedUserId)
                .Index(t => t.CreatedUserId)
                .Index(t => t.UpdatedUserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Tags", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Pages", "Tag_Id", "dbo.Tags");
            DropForeignKey("dbo.Tags", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Sites", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Sites", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Categories", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Categories", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Archives", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Archives", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Archives", "BelongToUser_Id", "dbo.Users");
            DropForeignKey("dbo.WatchLists", "User_Id", "dbo.Users");
            DropForeignKey("dbo.WatchLists", "WatchedUser_Id", "dbo.Users");
            DropForeignKey("dbo.WatchLists", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.WatchLists", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.UserNewtalks", "User_Id", "dbo.Users");
            DropForeignKey("dbo.UserNewtalks", "UserSeen_Id", "dbo.Users");
            DropForeignKey("dbo.UserNewtalks", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.UserNewtalks", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.UserMetas", "User_Id", "dbo.Users");
            DropForeignKey("dbo.UserMetas", "UserInUse_Id", "dbo.Users");
            DropForeignKey("dbo.UserMetas", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.UserMetas", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Revisions", "User_Id", "dbo.Users");
            DropForeignKey("dbo.Revisions", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Pages", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Revisions", "PageId", "dbo.Pages");
            DropForeignKey("dbo.PageRestrictions", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageRestrictions", "PageResctricted_Id", "dbo.Pages");
            DropForeignKey("dbo.PageRestrictions", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageMetas", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageMetas", "PageId", "dbo.Pages");
            DropForeignKey("dbo.PageMetas", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageLangs", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageLangs", "PageId", "dbo.Pages");
            DropForeignKey("dbo.PageLangs", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Pages", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Revisions", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.PageContents", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.Revisions", "PageContentId", "dbo.PageContents");
            DropForeignKey("dbo.PageContents", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.Archives", "Content_Id", "dbo.PageContents");
            DropForeignKey("dbo.Revisions", "BelongToUser_Id", "dbo.Users");
            DropForeignKey("dbo.RecentChanges", "User_Id", "dbo.Users");
            DropForeignKey("dbo.RecentChanges", "UserMakeChange_Id", "dbo.Users");
            DropForeignKey("dbo.RecentChanges", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.RecentChanges", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.ProtectedTitles", "User_Id", "dbo.Users");
            DropForeignKey("dbo.ProtectedTitles", "UserProtected_Id", "dbo.Users");
            DropForeignKey("dbo.ProtectedTitles", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.ProtectedTitles", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.WikiImages", "User_Id", "dbo.Users");
            DropForeignKey("dbo.WikiImages", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.WikiImages", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.FileArchives", "User_Id", "dbo.Users");
            DropForeignKey("dbo.FileArchives", "UploadedUser_Id", "dbo.Users");
            DropForeignKey("dbo.FileArchives", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.FileArchives", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.BlockedIps", "User_Id", "dbo.Users");
            DropForeignKey("dbo.BlockedIps", "UserBlocked_Id", "dbo.Users");
            DropForeignKey("dbo.BlockedIps", "UpdatedUserId", "dbo.Users");
            DropForeignKey("dbo.BlockedIps", "BlockedIp_Id", "dbo.BlockedIps");
            DropForeignKey("dbo.BlockedIps", "CreatedUserId", "dbo.Users");
            DropForeignKey("dbo.BlockedIps", "BlockByUser_Id", "dbo.Users");
            DropForeignKey("dbo.Archives", "User_Id", "dbo.Users");
            DropIndex("dbo.Tags", new[] { "UpdatedUserId" });
            DropIndex("dbo.Tags", new[] { "CreatedUserId" });
            DropIndex("dbo.Sites", new[] { "UpdatedUserId" });
            DropIndex("dbo.Sites", new[] { "CreatedUserId" });
            DropIndex("dbo.Categories", new[] { "UpdatedUserId" });
            DropIndex("dbo.Categories", new[] { "CreatedUserId" });
            DropIndex("dbo.WatchLists", new[] { "User_Id" });
            DropIndex("dbo.WatchLists", new[] { "WatchedUser_Id" });
            DropIndex("dbo.WatchLists", new[] { "UpdatedUserId" });
            DropIndex("dbo.WatchLists", new[] { "CreatedUserId" });
            DropIndex("dbo.UserNewtalks", new[] { "User_Id" });
            DropIndex("dbo.UserNewtalks", new[] { "UserSeen_Id" });
            DropIndex("dbo.UserNewtalks", new[] { "UpdatedUserId" });
            DropIndex("dbo.UserNewtalks", new[] { "CreatedUserId" });
            DropIndex("dbo.UserMetas", new[] { "User_Id" });
            DropIndex("dbo.UserMetas", new[] { "UserInUse_Id" });
            DropIndex("dbo.UserMetas", new[] { "UpdatedUserId" });
            DropIndex("dbo.UserMetas", new[] { "CreatedUserId" });
            DropIndex("dbo.PageRestrictions", new[] { "PageResctricted_Id" });
            DropIndex("dbo.PageRestrictions", new[] { "UpdatedUserId" });
            DropIndex("dbo.PageRestrictions", new[] { "CreatedUserId" });
            DropIndex("dbo.PageMetas", new[] { "UpdatedUserId" });
            DropIndex("dbo.PageMetas", new[] { "CreatedUserId" });
            DropIndex("dbo.PageMetas", new[] { "PageId" });
            DropIndex("dbo.PageLangs", new[] { "UpdatedUserId" });
            DropIndex("dbo.PageLangs", new[] { "CreatedUserId" });
            DropIndex("dbo.PageLangs", new[] { "PageId" });
            DropIndex("dbo.Pages", new[] { "Tag_Id" });
            DropIndex("dbo.Pages", new[] { "UpdatedUserId" });
            DropIndex("dbo.Pages", new[] { "CreatedUserId" });
            DropIndex("dbo.PageContents", new[] { "UpdatedUserId" });
            DropIndex("dbo.PageContents", new[] { "CreatedUserId" });
            DropIndex("dbo.Revisions", new[] { "User_Id" });
            DropIndex("dbo.Revisions", new[] { "BelongToUser_Id" });
            DropIndex("dbo.Revisions", new[] { "UpdatedUserId" });
            DropIndex("dbo.Revisions", new[] { "CreatedUserId" });
            DropIndex("dbo.Revisions", new[] { "PageContentId" });
            DropIndex("dbo.Revisions", new[] { "PageId" });
            DropIndex("dbo.RecentChanges", new[] { "User_Id" });
            DropIndex("dbo.RecentChanges", new[] { "UserMakeChange_Id" });
            DropIndex("dbo.RecentChanges", new[] { "UpdatedUserId" });
            DropIndex("dbo.RecentChanges", new[] { "CreatedUserId" });
            DropIndex("dbo.ProtectedTitles", new[] { "User_Id" });
            DropIndex("dbo.ProtectedTitles", new[] { "UserProtected_Id" });
            DropIndex("dbo.ProtectedTitles", new[] { "UpdatedUserId" });
            DropIndex("dbo.ProtectedTitles", new[] { "CreatedUserId" });
            DropIndex("dbo.WikiImages", new[] { "User_Id" });
            DropIndex("dbo.WikiImages", new[] { "UpdatedUserId" });
            DropIndex("dbo.WikiImages", new[] { "CreatedUserId" });
            DropIndex("dbo.FileArchives", new[] { "User_Id" });
            DropIndex("dbo.FileArchives", new[] { "UploadedUser_Id" });
            DropIndex("dbo.FileArchives", new[] { "UpdatedUserId" });
            DropIndex("dbo.FileArchives", new[] { "CreatedUserId" });
            DropIndex("dbo.BlockedIps", new[] { "User_Id" });
            DropIndex("dbo.BlockedIps", new[] { "UserBlocked_Id" });
            DropIndex("dbo.BlockedIps", new[] { "BlockedIp_Id" });
            DropIndex("dbo.BlockedIps", new[] { "BlockByUser_Id" });
            DropIndex("dbo.BlockedIps", new[] { "UpdatedUserId" });
            DropIndex("dbo.BlockedIps", new[] { "CreatedUserId" });
            DropIndex("dbo.Archives", new[] { "BelongToUser_Id" });
            DropIndex("dbo.Archives", new[] { "Content_Id" });
            DropIndex("dbo.Archives", new[] { "User_Id" });
            DropIndex("dbo.Archives", new[] { "UpdatedUserId" });
            DropIndex("dbo.Archives", new[] { "CreatedUserId" });
            DropTable("dbo.Tags");
            DropTable("dbo.Sites");
            DropTable("dbo.Categories");
            DropTable("dbo.WatchLists");
            DropTable("dbo.UserNewtalks");
            DropTable("dbo.UserMetas");
            DropTable("dbo.PageRestrictions");
            DropTable("dbo.PageMetas");
            DropTable("dbo.PageLangs");
            DropTable("dbo.Pages");
            DropTable("dbo.PageContents");
            DropTable("dbo.Revisions");
            DropTable("dbo.RecentChanges");
            DropTable("dbo.ProtectedTitles");
            DropTable("dbo.WikiImages");
            DropTable("dbo.FileArchives");
            DropTable("dbo.BlockedIps");
            DropTable("dbo.Users");
            DropTable("dbo.Archives");
        }
    }
}
