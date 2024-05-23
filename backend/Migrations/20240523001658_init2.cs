using System;
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
            migrationBuilder.AddColumn<long>(
                name: "warranty_card_id",
                table: "order_detail",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    transaction_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    order_id = table.Column<long>(type: "bigint", nullable: false),
                    payment_method = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    transaction_status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.transaction_id);
                    table.ForeignKey(
                        name: "FK_Transactions_order_order_id",
                        column: x => x.order_id,
                        principalTable: "order",
                        principalColumn: "order_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WarrantyCards",
                columns: table => new
                {
                    warranty_card_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    order_detail_id = table.Column<long>(type: "bigint", nullable: false),
                    start_time = table.Column<DateTime>(type: "datetime2", nullable: false),
                    end_time = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WarrantyCards", x => x.warranty_card_id);
                });

            migrationBuilder.CreateTable(
                name: "WarrantyRequests",
                columns: table => new
                {
                    warranty_request_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    warranty_staff_id = table.Column<long>(type: "bigint", nullable: false),
                    warranty_card_id = table.Column<long>(type: "bigint", nullable: false),
                    receive_time = table.Column<DateTime>(type: "datetime2", nullable: false),
                    return_time = table.Column<DateTime>(type: "datetime2", nullable: false),
                    warranty_status = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WarrantyRequests", x => x.warranty_request_id);
                    table.ForeignKey(
                        name: "FK_WarrantyRequests_WarrantyCards_warranty_card_id",
                        column: x => x.warranty_card_id,
                        principalTable: "WarrantyCards",
                        principalColumn: "warranty_card_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WarrantyRequests_account_warranty_staff_id",
                        column: x => x.warranty_staff_id,
                        principalTable: "account",
                        principalColumn: "account_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_order_detail_warranty_card_id",
                table: "order_detail",
                column: "warranty_card_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Transactions_order_id",
                table: "Transactions",
                column: "order_id");

            migrationBuilder.CreateIndex(
                name: "IX_WarrantyRequests_warranty_card_id",
                table: "WarrantyRequests",
                column: "warranty_card_id");

            migrationBuilder.CreateIndex(
                name: "IX_WarrantyRequests_warranty_staff_id",
                table: "WarrantyRequests",
                column: "warranty_staff_id");

            migrationBuilder.AddForeignKey(
                name: "FK_order_detail_WarrantyCards_warranty_card_id",
                table: "order_detail",
                column: "warranty_card_id",
                principalTable: "WarrantyCards",
                principalColumn: "warranty_card_id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_order_detail_WarrantyCards_warranty_card_id",
                table: "order_detail");

            migrationBuilder.DropTable(
                name: "Transactions");

            migrationBuilder.DropTable(
                name: "WarrantyRequests");

            migrationBuilder.DropTable(
                name: "WarrantyCards");

            migrationBuilder.DropIndex(
                name: "IX_order_detail_warranty_card_id",
                table: "order_detail");

            migrationBuilder.DropColumn(
                name: "warranty_card_id",
                table: "order_detail");
        }
    }
}
