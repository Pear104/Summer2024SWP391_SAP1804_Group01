using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        // Diamond + Setting Section
        public DbSet<Shape> Shapes { get; set; }
        public DbSet<Material> Materials { get; set; }
        public DbSet<Diamond> Diamonds { get; set; }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<SettingType> SettingTypes { get; set; }
        public DbSet<SettingStyle> SettingStyles { get; set; }
        public DbSet<Variant> Variants { get; set; }
        public DbSet<VariantImage> VariantImages { get; set; }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Thiet lap Id auto increment
            builder.Entity<Shape>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<Material>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<Diamond>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<Setting>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<SettingStyle>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<SettingType>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<Variant>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            builder.Entity<VariantImage>()
                .Property(o => o.Id)
                .ValueGeneratedOnAdd();

            //Them khoa ngoai giua SettingType voi SettingStyle
            builder.Entity<SettingStyle>()
                .HasOne(o => o.SettingType)
                .WithMany(o => o.SettingStyles)
                .HasForeignKey(o => o.SettingTypeId);

            //Them khoa ngoai giua Setting voi SettingStyle
            builder.Entity<Setting>()
                .HasOne(o => o.SettingStyle)
                .WithMany(o => o.Settings)
                .HasForeignKey(o => o.SettingStyleId);

            //Them khoa ngoai giua Setting voi Variant
            builder.Entity<Variant>()
                .HasOne(o => o.Setting)
                .WithMany(o => o.Variants)
                .HasForeignKey(o => o.SettingId);

            //Them khoa ngoai giua Shape voi Variant
            builder.Entity<Variant>()
                .HasOne(o => o.Shape)
                .WithMany(o => o.Variants)
                .HasForeignKey(o => o.ShapeId);

            //Them khoa ngoai giua Material voi Variant
            builder.Entity<Variant>()
                .HasOne(o => o.Material)
                .WithMany(o => o.Variants)
                .HasForeignKey(o => o.MaterialId);

            //Them khoa ngoai giua VariantImage voi Variant
            builder.Entity<VariantImage>()
                .HasOne(o => o.Variant)
                .WithMany(o => o.VariantImages)
                .HasForeignKey(o => o.VariantID);

            //Them khoa ngoai giua Diamond voi Shape
            builder.Entity<Diamond>()
                .HasOne(o => o.Shape)
                .WithMany(o => o.Diamonds)
                .HasForeignKey(o => o.ShapeId);

            //Example

            // N-N 

            //builder.Entity<OrderDetail>()
            //    .HasKey(od => new { od.OrderID, od.ProductID });

            //builder.Entity<OrderDetail>()
            //    .HasOne(od => od.Order)
            //    .WithMany(o => o.OrderDetails)
            //    .HasForeignKey(od => od.OrderID);

            //builder.Entity<OrderDetail>()
            //    .HasOne(od => od.Product)
            //    .WithMany(p => p.OrderDetails)
            //    .HasForeignKey(od => od.ProductID);



            // 1-N

            //builder.Entity<Order>()
            //    .HasOne(o => o.User)
            //    .WithMany()
            //    .HasForeignKey(o => o.UserID);



            // 1-1

            //builder.Entity<Account>()
            //    .HasOne(o => o.User)
            //    .WithOne(o => o.)
            //    .HasForeignKey(o => o.UserID);

        }

    }
}
