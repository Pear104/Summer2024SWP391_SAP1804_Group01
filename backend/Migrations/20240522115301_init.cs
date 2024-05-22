using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace backend.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "accessory_type",
                columns: table => new
                {
                    accessory_type_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    processing_price = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_accessory_type", x => x.accessory_type_id);
                });

            migrationBuilder.CreateTable(
                name: "promotion",
                columns: table => new
                {
                    promotion_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    discount_percent = table.Column<float>(type: "real", nullable: false),
                    start_time = table.Column<DateTime>(type: "datetime2", nullable: false),
                    end_time = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_promotion", x => x.promotion_id);
                });

            migrationBuilder.CreateTable(
                name: "rank",
                columns: table => new
                {
                    rank_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    rank_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    discount = table.Column<float>(type: "real", nullable: false),
                    reward_point = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_rank", x => x.rank_id);
                });

            migrationBuilder.CreateTable(
                name: "role",
                columns: table => new
                {
                    role_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    role_name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_role", x => x.role_id);
                });

            migrationBuilder.CreateTable(
                name: "shape",
                columns: table => new
                {
                    shape_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_shape", x => x.shape_id);
                });

            migrationBuilder.CreateTable(
                name: "account",
                columns: table => new
                {
                    account_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    role_id = table.Column<long>(type: "bigint", nullable: false),
                    rank_id = table.Column<long>(type: "bigint", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    phone_number = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    address = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    birthday = table.Column<DateTime>(type: "datetime2", nullable: false),
                    gender = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    reward_point = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_account", x => x.account_id);
                    table.ForeignKey(
                        name: "FK_account_rank_rank_id",
                        column: x => x.rank_id,
                        principalTable: "rank",
                        principalColumn: "rank_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_account_role_role_id",
                        column: x => x.role_id,
                        principalTable: "role",
                        principalColumn: "role_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "accessory",
                columns: table => new
                {
                    accessory_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    karat = table.Column<int>(type: "int", nullable: false),
                    material_weight = table.Column<float>(type: "real", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    accessory_type_id = table.Column<long>(type: "bigint", nullable: false),
                    shape_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_accessory", x => x.accessory_id);
                    table.ForeignKey(
                        name: "FK_accessory_accessory_type_accessory_type_id",
                        column: x => x.accessory_type_id,
                        principalTable: "accessory_type",
                        principalColumn: "accessory_type_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_accessory_shape_shape_id",
                        column: x => x.shape_id,
                        principalTable: "shape",
                        principalColumn: "shape_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "diamond",
                columns: table => new
                {
                    diamond_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    lab = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    certificate_number = table.Column<long>(type: "bigint", nullable: false),
                    certificate_url = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    image_url = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    carat = table.Column<float>(type: "real", nullable: false),
                    cut = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    color = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    clarity = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    polish = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    symmetry = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    fluorescence = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    availability = table.Column<bool>(type: "bit", nullable: false),
                    shape_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_diamond", x => x.diamond_id);
                    table.ForeignKey(
                        name: "FK_diamond_shape_shape_id",
                        column: x => x.shape_id,
                        principalTable: "shape",
                        principalColumn: "shape_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "order",
                columns: table => new
                {
                    order_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    total_price = table.Column<double>(type: "float", nullable: false),
                    total_discount_percent = table.Column<float>(type: "real", nullable: false),
                    contact_status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    confirm_status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    delivery_status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    order_status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    shipping_address = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    customer_id = table.Column<long>(type: "bigint", nullable: false),
                    sale_staff_id = table.Column<long>(type: "bigint", nullable: false),
                    delivery_staff_id = table.Column<long>(type: "bigint", nullable: false),
                    promotion_id = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_order", x => x.order_id);
                    table.ForeignKey(
                        name: "FK_order_account_customer_id",
                        column: x => x.customer_id,
                        principalTable: "account",
                        principalColumn: "account_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_order_account_delivery_staff_id",
                        column: x => x.delivery_staff_id,
                        principalTable: "account",
                        principalColumn: "account_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_order_account_sale_staff_id",
                        column: x => x.sale_staff_id,
                        principalTable: "account",
                        principalColumn: "account_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_order_promotion_promotion_id",
                        column: x => x.promotion_id,
                        principalTable: "promotion",
                        principalColumn: "promotion_id");
                });

            migrationBuilder.CreateTable(
                name: "accessory_image",
                columns: table => new
                {
                    image_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    image_url = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    accessory_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_accessory_image", x => x.image_id);
                    table.ForeignKey(
                        name: "FK_accessory_image_accessory_accessory_id",
                        column: x => x.accessory_id,
                        principalTable: "accessory",
                        principalColumn: "accessory_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "order_detail",
                columns: table => new
                {
                    order_detail_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    size = table.Column<float>(type: "real", nullable: true),
                    item_price = table.Column<double>(type: "float", nullable: false),
                    order_id = table.Column<long>(type: "bigint", nullable: false),
                    diamond_id = table.Column<long>(type: "bigint", nullable: false),
                    accessory_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_order_detail", x => x.order_detail_id);
                    table.ForeignKey(
                        name: "FK_order_detail_accessory_accessory_id",
                        column: x => x.accessory_id,
                        principalTable: "accessory",
                        principalColumn: "accessory_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_order_detail_diamond_diamond_id",
                        column: x => x.diamond_id,
                        principalTable: "diamond",
                        principalColumn: "diamond_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_order_detail_order_order_id",
                        column: x => x.order_id,
                        principalTable: "order",
                        principalColumn: "order_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "rank",
                columns: new[] { "rank_id", "discount", "rank_name", "reward_point" },
                values: new object[,]
                {
                    { 1L, 0.025f, "Bronze", 0 },
                    { 2L, 0.05f, "Silver", 500 },
                    { 3L, 0.075f, "Gold", 1000 },
                    { 4L, 0.1f, "Platinum", 1500 },
                    { 5L, 0.125f, "Emerald", 2000 },
                    { 6L, 0.15f, "Diamond", 2500 }
                });

            migrationBuilder.InsertData(
                table: "role",
                columns: new[] { "role_id", "role_name" },
                values: new object[,]
                {
                    { 1L, "Customer" },
                    { 2L, "SaleStaff" },
                    { 3L, "DeliveryStaff" },
                    { 4L, "WarrantyStaff" },
                    { 5L, "Manager" },
                    { 6L, "Administrator" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_accessory_accessory_type_id",
                table: "accessory",
                column: "accessory_type_id");

            migrationBuilder.CreateIndex(
                name: "IX_accessory_shape_id",
                table: "accessory",
                column: "shape_id");

            migrationBuilder.CreateIndex(
                name: "IX_accessory_image_accessory_id",
                table: "accessory_image",
                column: "accessory_id");

            migrationBuilder.CreateIndex(
                name: "IX_account_rank_id",
                table: "account",
                column: "rank_id");

            migrationBuilder.CreateIndex(
                name: "IX_account_role_id",
                table: "account",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "IX_diamond_shape_id",
                table: "diamond",
                column: "shape_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_customer_id",
                table: "order",
                column: "customer_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_delivery_staff_id",
                table: "order",
                column: "delivery_staff_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_promotion_id",
                table: "order",
                column: "promotion_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_sale_staff_id",
                table: "order",
                column: "sale_staff_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_detail_accessory_id",
                table: "order_detail",
                column: "accessory_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_detail_diamond_id",
                table: "order_detail",
                column: "diamond_id");

            migrationBuilder.CreateIndex(
                name: "IX_order_detail_order_id",
                table: "order_detail",
                column: "order_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "accessory_image");

            migrationBuilder.DropTable(
                name: "order_detail");

            migrationBuilder.DropTable(
                name: "accessory");

            migrationBuilder.DropTable(
                name: "diamond");

            migrationBuilder.DropTable(
                name: "order");

            migrationBuilder.DropTable(
                name: "accessory_type");

            migrationBuilder.DropTable(
                name: "shape");

            migrationBuilder.DropTable(
                name: "account");

            migrationBuilder.DropTable(
                name: "promotion");

            migrationBuilder.DropTable(
                name: "rank");

            migrationBuilder.DropTable(
                name: "role");
        }
    }
}
