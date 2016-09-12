using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class UpdateRelationship : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categories_Characters_CharacterId",
                table: "Categories");

            migrationBuilder.DropIndex(
                name: "IX_Categories_CharacterId",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "Categories");

            migrationBuilder.CreateTable(
                name: "Type",
                columns: table => new
                {
                    CharacterId = table.Column<int>(nullable: false),
                    TypeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Type", x => new { x.CharacterId, x.TypeId });
                    table.ForeignKey(
                        name: "FK_Type_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Type_Categories_TypeId",
                        column: x => x.TypeId,
                        principalTable: "Categories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Type_CharacterId",
                table: "Type",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_Type_TypeId",
                table: "Type",
                column: "TypeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Type");

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "Categories",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Categories_CharacterId",
                table: "Categories",
                column: "CharacterId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categories_Characters_CharacterId",
                table: "Categories",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
