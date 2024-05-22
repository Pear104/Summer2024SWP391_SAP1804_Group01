using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backend.Migrations
{
    /// <inheritdoc />
    public partial class init2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 1L,
                column: "discount",
                value: 0.025f);

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 2L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0.05f, 500 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 3L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0.075f, 1000 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 4L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0.1f, 1500 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 5L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0.125f, 2000 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 6L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0.15f, 2500 });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 1L,
                column: "discount",
                value: 0f);

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 2L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0f, 0 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 3L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0f, 0 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 4L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0f, 0 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 5L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0f, 0 });

            migrationBuilder.UpdateData(
                table: "rank",
                keyColumn: "rank_id",
                keyValue: 6L,
                columns: new[] { "discount", "reward_point" },
                values: new object[] { 0f, 0 });
        }
    }
}
