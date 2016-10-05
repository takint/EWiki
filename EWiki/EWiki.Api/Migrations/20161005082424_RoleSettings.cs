using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EWiki.Api.Migrations
{
    public partial class RoleSettings : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Characters_Pages_InfoContentId",
                table: "Characters");

            migrationBuilder.DropIndex(
                name: "IX_Characters_InfoContentId",
                table: "Characters");

            migrationBuilder.CreateTable(
                name: "RoleSettings",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedUserId = table.Column<string>(nullable: true),
                    RoleId = table.Column<string>(nullable: true),
                    SettingName = table.Column<string>(nullable: true),
                    SettingValue = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedUserId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleSettings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RoleSettings_AspNetUsers_CreatedUserId",
                        column: x => x.CreatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RoleSettings_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RoleSettings_AspNetUsers_UpdatedUserId",
                        column: x => x.UpdatedUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.AddColumn<string>(
                name: "Discriminator",
                table: "AspNetRoles",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<int>(
                name: "InfoContentId",
                table: "Characters",
                nullable: false);

            migrationBuilder.CreateIndex(
                name: "IX_RoleSettings_CreatedUserId",
                table: "RoleSettings",
                column: "CreatedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_RoleSettings_RoleId",
                table: "RoleSettings",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_RoleSettings_UpdatedUserId",
                table: "RoleSettings",
                column: "UpdatedUserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Discriminator",
                table: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "RoleSettings");

            migrationBuilder.AlterColumn<int>(
                name: "InfoContentId",
                table: "Characters",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Characters_InfoContentId",
                table: "Characters",
                column: "InfoContentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Characters_Pages_InfoContentId",
                table: "Characters",
                column: "InfoContentId",
                principalTable: "Pages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
