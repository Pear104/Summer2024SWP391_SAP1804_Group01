using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options)
            : base(options) { }

        // Diamond + Setting Section
        public DbSet<Shape> Shapes { get; set; }
        public DbSet<Diamond> Diamonds { get; set; }
        public DbSet<Accessory> Accessories { get; set; }
        public DbSet<AccessoryType> AccessoryTypes { get; set; }
        public DbSet<AccessoryImage> VariantImages { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Rank> Ranks { get; set; }
        public DbSet<Role> Roles { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Set Id auto increment
            builder.Entity<Shape>().Property(o => o.Id).ValueGeneratedOnAdd();

            builder.Entity<Diamond>().Property(o => o.Id).ValueGeneratedOnAdd();

            builder.Entity<Accessory>().Property(o => o.Id).ValueGeneratedOnAdd();

            builder.Entity<AccessoryType>().Property(o => o.Id).ValueGeneratedOnAdd();

            builder.Entity<AccessoryImage>().Property(o => o.Id).ValueGeneratedOnAdd();

            builder.Entity<Account>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<Rank>().Property(o => o.RankId).ValueGeneratedOnAdd();
            builder.Entity<Role>().Property(o => o.RoleId).ValueGeneratedOnAdd();

            //Them khoa ngoai giua Setting voi SettingStyle
            builder
                .Entity<Accessory>()
                .HasOne(o => o.AccessoryType)
                .WithMany(o => o.Accessories)
                .HasForeignKey(o => o.AccessoryTypeId);

            //Them khoa ngoai giua VariantImage voi Variant
            builder
                .Entity<AccessoryImage>()
                .HasOne(o => o.Accessory)
                .WithMany(o => o.AccessoryImages)
                .HasForeignKey(o => o.AccessoryId);

            //Them khoa ngoai giua Diamond voi Shape
            builder
                .Entity<Diamond>()
                .HasOne(o => o.Shape)
                .WithMany(o => o.Diamonds)
                .HasForeignKey(o => o.ShapeId);

            //Them khoa ngoai giua Accessory voi Shape
            builder
                .Entity<Accessory>()
                .HasOne(o => o.Shape)
                .WithMany(o => o.Accessories)
                .HasForeignKey(o => o.ShapeId);

            //Them khoa ngoai giua Account voi Role
            builder
                .Entity<Account>()
                .HasOne(o => o.Role)
                .WithMany(o => o.Accounts)
                .HasForeignKey(o => o.RoleId);

            //Them khoa ngoai giua Account voi Rank
            builder
                .Entity<Account>()
                .HasOne(o => o.Rank)
                .WithMany(o => o.Accounts)
                .HasForeignKey(o => o.RankId);

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
