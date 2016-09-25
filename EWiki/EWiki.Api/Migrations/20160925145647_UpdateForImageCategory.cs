using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class UpdateForImageCategory : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "FeatureImageId",
                table: "Pages",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CatImageId",
                table: "Categories",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Pages_FeatureImageId",
                table: "Pages",
                column: "FeatureImageId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_CatImageId",
                table: "Categories",
                column: "CatImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categories_WikiImages_CatImageId",
                table: "Categories",
                column: "CatImageId",
                principalTable: "WikiImages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Pages_WikiImages_FeatureImageId",
                table: "Pages",
                column: "FeatureImageId",
                principalTable: "WikiImages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categories_WikiImages_CatImageId",
                table: "Categories");

            migrationBuilder.DropForeignKey(
                name: "FK_Pages_WikiImages_FeatureImageId",
                table: "Pages");

            migrationBuilder.DropIndex(
                name: "IX_Pages_FeatureImageId",
                table: "Pages");

            migrationBuilder.DropIndex(
                name: "IX_Categories_CatImageId",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "FeatureImageId",
                table: "Pages");

            migrationBuilder.DropColumn(
                name: "CatImageId",
                table: "Categories");
        }
    }
}
