using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class UpdateEntity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Locations_Characters_CharacterId",
                table: "Locations");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Characters_CharacterId",
                table: "Moves");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Characters_CharacterId1",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Moves_CharacterId",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Moves_CharacterId1",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Locations_CharacterId",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "Category",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "CharacterId1",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "Type",
                table: "Moves");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "Type",
                table: "Locations");

            migrationBuilder.CreateTable(
                name: "PokemonLocation",
                columns: table => new
                {
                    CharacterId = table.Column<int>(nullable: false),
                    LocationId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PokemonLocation", x => new { x.CharacterId, x.LocationId });
                    table.ForeignKey(
                        name: "FK_PokemonLocation_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PokemonLocation_Locations_LocationId",
                        column: x => x.LocationId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PokemonMove",
                columns: table => new
                {
                    CharacterId = table.Column<int>(nullable: false),
                    MoveId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PokemonMove", x => new { x.CharacterId, x.MoveId });
                    table.ForeignKey(
                        name: "FK_PokemonMove_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PokemonMove_Moves_MoveId",
                        column: x => x.MoveId,
                        principalTable: "Moves",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PokemonSpecialMove",
                columns: table => new
                {
                    CharacterId = table.Column<int>(nullable: false),
                    MoveId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PokemonSpecialMove", x => new { x.CharacterId, x.MoveId });
                    table.ForeignKey(
                        name: "FK_PokemonSpecialMove_Characters_CharacterId",
                        column: x => x.CharacterId,
                        principalTable: "Characters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PokemonSpecialMove_Moves_MoveId",
                        column: x => x.MoveId,
                        principalTable: "Moves",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.AddColumn<int>(
                name: "CategoryId",
                table: "Moves",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "MoveCategoryId",
                table: "Moves",
                nullable: true);

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
                name: "IX_Moves_MoveCategoryId",
                table: "Moves",
                column: "MoveCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_MoveTypeId",
                table: "Moves",
                column: "MoveTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_LocationTypeId",
                table: "Locations",
                column: "LocationTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonLocation_CharacterId",
                table: "PokemonLocation",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonLocation_LocationId",
                table: "PokemonLocation",
                column: "LocationId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonMove_CharacterId",
                table: "PokemonMove",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonMove_MoveId",
                table: "PokemonMove",
                column: "MoveId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonSpecialMove_CharacterId",
                table: "PokemonSpecialMove",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_PokemonSpecialMove_MoveId",
                table: "PokemonSpecialMove",
                column: "MoveId");

            migrationBuilder.AddForeignKey(
                name: "FK_Locations_Categories_LocationTypeId",
                table: "Locations",
                column: "LocationTypeId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Moves_Categories_MoveCategoryId",
                table: "Moves",
                column: "MoveCategoryId",
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Locations_Categories_LocationTypeId",
                table: "Locations");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Categories_MoveCategoryId",
                table: "Moves");

            migrationBuilder.DropForeignKey(
                name: "FK_Moves_Categories_MoveTypeId",
                table: "Moves");

            migrationBuilder.DropIndex(
                name: "IX_Moves_MoveCategoryId",
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
                name: "MoveCategoryId",
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

            migrationBuilder.DropTable(
                name: "PokemonLocation");

            migrationBuilder.DropTable(
                name: "PokemonMove");

            migrationBuilder.DropTable(
                name: "PokemonSpecialMove");

            migrationBuilder.AddColumn<string>(
                name: "Category",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId1",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "Moves",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "Locations",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "Locations",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Moves_CharacterId",
                table: "Moves",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_Moves_CharacterId1",
                table: "Moves",
                column: "CharacterId1");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_CharacterId",
                table: "Locations",
                column: "CharacterId");

            migrationBuilder.AddForeignKey(
                name: "FK_Locations_Characters_CharacterId",
                table: "Locations",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Moves_Characters_CharacterId",
                table: "Moves",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Moves_Characters_CharacterId1",
                table: "Moves",
                column: "CharacterId1",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
