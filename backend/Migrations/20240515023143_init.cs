using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backend.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "material",
                columns: table => new
                {
                    material_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_material", x => x.material_id);
                });

            migrationBuilder.CreateTable(
                name: "setting_type",
                columns: table => new
                {
                    setting_type_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_setting_type", x => x.setting_type_id);
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
                name: "setting_style",
                columns: table => new
                {
                    setting_style_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    setting_type_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_setting_style", x => x.setting_style_id);
                    table.ForeignKey(
                        name: "FK_setting_style_setting_type_setting_type_id",
                        column: x => x.setting_type_id,
                        principalTable: "setting_type",
                        principalColumn: "setting_type_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "diamond",
                columns: table => new
                {
                    diamond_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    certificate_id = table.Column<long>(type: "bigint", nullable: false),
                    lab_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    carat = table.Column<double>(type: "float", nullable: false),
                    cut = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    color = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    clarity = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    polish = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    symmetry = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    fluorescene = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    price = table.Column<double>(type: "float", nullable: false),
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
                name: "setting",
                columns: table => new
                {
                    setting_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    setting_style_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_setting", x => x.setting_id);
                    table.ForeignKey(
                        name: "FK_setting_setting_style_setting_style_id",
                        column: x => x.setting_style_id,
                        principalTable: "setting_style",
                        principalColumn: "setting_style_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "variant",
                columns: table => new
                {
                    variant_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    setting_id = table.Column<long>(type: "bigint", nullable: false),
                    shape_id = table.Column<long>(type: "bigint", nullable: false),
                    material_id = table.Column<long>(type: "bigint", nullable: false),
                    price = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_variant", x => x.variant_id);
                    table.ForeignKey(
                        name: "FK_variant_material_material_id",
                        column: x => x.material_id,
                        principalTable: "material",
                        principalColumn: "material_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_variant_setting_setting_id",
                        column: x => x.setting_id,
                        principalTable: "setting",
                        principalColumn: "setting_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_variant_shape_shape_id",
                        column: x => x.shape_id,
                        principalTable: "shape",
                        principalColumn: "shape_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "variant_image",
                columns: table => new
                {
                    image_id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    image_url = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    variant_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_variant_image", x => x.image_id);
                    table.ForeignKey(
                        name: "FK_variant_image_variant_variant_id",
                        column: x => x.variant_id,
                        principalTable: "variant",
                        principalColumn: "variant_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_diamond_shape_id",
                table: "diamond",
                column: "shape_id");

            migrationBuilder.CreateIndex(
                name: "IX_setting_setting_style_id",
                table: "setting",
                column: "setting_style_id");

            migrationBuilder.CreateIndex(
                name: "IX_setting_style_setting_type_id",
                table: "setting_style",
                column: "setting_type_id");

            migrationBuilder.CreateIndex(
                name: "IX_variant_material_id",
                table: "variant",
                column: "material_id");

            migrationBuilder.CreateIndex(
                name: "IX_variant_setting_id",
                table: "variant",
                column: "setting_id");

            migrationBuilder.CreateIndex(
                name: "IX_variant_shape_id",
                table: "variant",
                column: "shape_id");

            migrationBuilder.CreateIndex(
                name: "IX_variant_image_variant_id",
                table: "variant_image",
                column: "variant_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "diamond");

            migrationBuilder.DropTable(
                name: "variant_image");

            migrationBuilder.DropTable(
                name: "variant");

            migrationBuilder.DropTable(
                name: "material");

            migrationBuilder.DropTable(
                name: "setting");

            migrationBuilder.DropTable(
                name: "shape");

            migrationBuilder.DropTable(
                name: "setting_style");

            migrationBuilder.DropTable(
                name: "setting_type");
        }
    }
}
