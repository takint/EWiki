using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class EWiki : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categories_Locations_LocationId",
                table: "Categories");

            migrationBuilder.DropIndex(
                name: "IX_Categories_LocationId",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "LocationId",
                table: "Categories");

            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "Locations",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "EvolveIntos",
                table: "Characters",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CatTitleVI",
                table: "Categories",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Type",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "EvolveIntos",
                table: "Characters");

            migrationBuilder.DropColumn(
                name: "CatTitleVI",
                table: "Categories");

            migrationBuilder.AddColumn<int>(
                name: "LocationId",
                table: "Categories",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Categories_LocationId",
                table: "Categories",
                column: "LocationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categories_Locations_LocationId",
                table: "Categories",
                column: "LocationId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
