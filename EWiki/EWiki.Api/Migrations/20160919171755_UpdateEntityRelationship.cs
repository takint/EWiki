using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EWiki.Api.Migrations
{
    public partial class UpdateEntityRelationship : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CharacterInfos_Characters_CharacterId",
                table: "CharacterInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId",
                table: "CharacterInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_CharacterInfoGroups_Characters_CharacterId",
                table: "CharacterInfoGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_CharacterSectionGroups_Characters_CharacterId",
                table: "CharacterSectionGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_PageRestrictions_Pages_PageResctrictedId",
                table: "PageRestrictions");

            migrationBuilder.DropForeignKey(
                name: "FK_References_Characters_CharacterId",
                table: "References");

            migrationBuilder.DropForeignKey(
                name: "FK_WikiImages_Characters_CharacterId",
                table: "WikiImages");

            migrationBuilder.DropForeignKey(
                name: "FK_WikiImages_Characters_CharacterId1",
                table: "WikiImages");

            migrationBuilder.DropForeignKey(
                name: "FK_WikiVideos_Characters_CharacterId",
                table: "WikiVideos");

            migrationBuilder.DropIndex(
                name: "IX_WikiVideos_CharacterId",
                table: "WikiVideos");

            migrationBuilder.DropIndex(
                name: "IX_WikiImages_CharacterId",
                table: "WikiImages");

            migrationBuilder.DropIndex(
                name: "IX_WikiImages_CharacterId1",
                table: "WikiImages");

            migrationBuilder.DropIndex(
                name: "IX_References_CharacterId",
                table: "References");

            migrationBuilder.DropIndex(
                name: "IX_PageRestrictions_PageResctrictedId",
                table: "PageRestrictions");

            migrationBuilder.DropIndex(
                name: "IX_CharacterSectionGroups_CharacterId",
                table: "CharacterSectionGroups");

            migrationBuilder.DropIndex(
                name: "IX_CharacterInfoGroups_CharacterId",
                table: "CharacterInfoGroups");

            migrationBuilder.DropIndex(
                name: "IX_CharacterInfos_CharacterId",
                table: "CharacterInfos");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "WikiVideos");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "WikiImages");

            migrationBuilder.DropColumn(
                name: "CharacterId1",
                table: "WikiImages");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "References");

            migrationBuilder.DropColumn(
                name: "PageResctrictedId",
                table: "PageRestrictions");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "CharacterSectionGroups");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "CharacterInfoGroups");

            migrationBuilder.DropColumn(
                name: "CharacterId",
                table: "CharacterInfos");

            migrationBuilder.AddColumn<string>(
                name: "ImageUrl",
                table: "WikiImages",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PageId",
                table: "PageRestrictions",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "AvatarImageId",
                table: "Characters",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_PageRestrictions_PageId",
                table: "PageRestrictions",
                column: "PageId");

            migrationBuilder.AlterColumn<int>(
                name: "CharacterInfoGroupId",
                table: "CharacterInfos",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Characters_AvatarImageId",
                table: "Characters",
                column: "AvatarImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Characters_WikiImages_AvatarImageId",
                table: "Characters",
                column: "AvatarImageId",
                principalTable: "WikiImages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId",
                table: "CharacterInfos",
                column: "CharacterInfoGroupId",
                principalTable: "CharacterInfoGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PageRestrictions_Pages_PageId",
                table: "PageRestrictions",
                column: "PageId",
                principalTable: "Pages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Characters_WikiImages_AvatarImageId",
                table: "Characters");

            migrationBuilder.DropForeignKey(
                name: "FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId",
                table: "CharacterInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_PageRestrictions_Pages_PageId",
                table: "PageRestrictions");

            migrationBuilder.DropIndex(
                name: "IX_PageRestrictions_PageId",
                table: "PageRestrictions");

            migrationBuilder.DropIndex(
                name: "IX_Characters_AvatarImageId",
                table: "Characters");

            migrationBuilder.DropColumn(
                name: "ImageUrl",
                table: "WikiImages");

            migrationBuilder.DropColumn(
                name: "PageId",
                table: "PageRestrictions");

            migrationBuilder.DropColumn(
                name: "AvatarImageId",
                table: "Characters");

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "WikiVideos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "WikiImages",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId1",
                table: "WikiImages",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "References",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PageResctrictedId",
                table: "PageRestrictions",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "CharacterSectionGroups",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "CharacterInfoGroups",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CharacterId",
                table: "CharacterInfos",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_WikiVideos_CharacterId",
                table: "WikiVideos",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_CharacterId",
                table: "WikiImages",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_WikiImages_CharacterId1",
                table: "WikiImages",
                column: "CharacterId1");

            migrationBuilder.CreateIndex(
                name: "IX_References_CharacterId",
                table: "References",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_PageRestrictions_PageResctrictedId",
                table: "PageRestrictions",
                column: "PageResctrictedId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterSectionGroups_CharacterId",
                table: "CharacterSectionGroups",
                column: "CharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfoGroups_CharacterId",
                table: "CharacterInfoGroups",
                column: "CharacterId");

            migrationBuilder.AlterColumn<int>(
                name: "CharacterInfoGroupId",
                table: "CharacterInfos",
                nullable: false);

            migrationBuilder.CreateIndex(
                name: "IX_CharacterInfos_CharacterId",
                table: "CharacterInfos",
                column: "CharacterId");

            migrationBuilder.AddForeignKey(
                name: "FK_CharacterInfos_Characters_CharacterId",
                table: "CharacterInfos",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId",
                table: "CharacterInfos",
                column: "CharacterInfoGroupId",
                principalTable: "CharacterInfoGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CharacterInfoGroups_Characters_CharacterId",
                table: "CharacterInfoGroups",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_CharacterSectionGroups_Characters_CharacterId",
                table: "CharacterSectionGroups",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PageRestrictions_Pages_PageResctrictedId",
                table: "PageRestrictions",
                column: "PageResctrictedId",
                principalTable: "Pages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_References_Characters_CharacterId",
                table: "References",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_WikiImages_Characters_CharacterId",
                table: "WikiImages",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_WikiImages_Characters_CharacterId1",
                table: "WikiImages",
                column: "CharacterId1",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_WikiVideos_Characters_CharacterId",
                table: "WikiVideos",
                column: "CharacterId",
                principalTable: "Characters",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
