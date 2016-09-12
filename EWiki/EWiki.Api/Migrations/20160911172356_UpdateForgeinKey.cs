using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class UpdateForgeinKey : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Locations_Categories_LocationTypeId",
                table: "Locations");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Categories_MoveTypeId",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Moves_MoveTypeId",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Locations_LocationTypeId",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "CategoryId",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "MoveTypeId",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "TypeId",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "LocationTypeId",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "TypeId",
                table: "Locations");

            migrationBuilder.AddColumn<int>(
                name: "MoveType",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LocationType",
                table: "Locations",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Moves_MoveType",
                table: "Moves",
                column: "MoveType");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_LocationType",
                table: "Locations",
                column: "LocationType");

            migrationBuilder.AddForeignKey(
                name: "FK_Locations_Categories_LocationType",
                table: "Locations",
                column: "LocationType",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Moves_Categories_MoveType",
                table: "Moves",
                column: "MoveType",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Locations_Categories_LocationType",
                table: "Locations");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Categories_MoveType",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Moves_MoveType",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Locations_LocationType",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "MoveType",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "LocationType",
                table: "Locations");

            migrationBuilder.AddColumn<int>(
                name: "CategoryId",
                table: "Moves",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "MoveTypeId",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TypeId",
                table: "Moves",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "LocationTypeId",
                table: "Locations",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TypeId",
                table: "Locations",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Moves_MoveTypeId",
                table: "Moves",
                column: "MoveTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_LocationTypeId",
                table: "Locations",
                column: "LocationTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Locations_Categories_LocationTypeId",
                table: "Locations",
                column: "LocationTypeId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Moves_Categories_MoveTypeId",
                table: "Moves",
                column: "MoveTypeId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
