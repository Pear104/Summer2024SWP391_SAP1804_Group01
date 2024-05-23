using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options)
            : base(options) { }

        public DbSet<Shape> Shapes { get; set; }
        public DbSet<Diamond> Diamonds { get; set; }
        public DbSet<Accessory> Accessories { get; set; }
        public DbSet<AccessoryType> AccessoryTypes { get; set; }
        public DbSet<AccessoryImage> AccessoryImages { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Rank> Ranks { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<WarrantyCard> WarrantyCards { get; set; }
        public DbSet<WarrantyRequest> WarrantyRequests { get; set; }
        public DbSet<Transaction> Transactions { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Set Id auto increment
            builder.Entity<Shape>().Property(o => o.ShapeId).ValueGeneratedOnAdd();
            builder.Entity<Diamond>().Property(o => o.DiamondId).ValueGeneratedOnAdd();
            builder.Entity<Accessory>().Property(o => o.AccessoryId).ValueGeneratedOnAdd();
            builder.Entity<AccessoryType>().Property(o => o.AccessoryTypeId).ValueGeneratedOnAdd();
            builder
                .Entity<AccessoryImage>()
                .Property(o => o.AccessoryImageId)
                .ValueGeneratedOnAdd();
            builder.Entity<Account>().Property(o => o.AccountId).ValueGeneratedOnAdd();
            builder.Entity<Rank>().Property(o => o.RankId).ValueGeneratedOnAdd();
            builder.Entity<Role>().Property(o => o.RoleId).ValueGeneratedOnAdd();
            builder.Entity<Order>().Property(o => o.OrderId).ValueGeneratedOnAdd();
            builder.Entity<OrderDetail>().Property(o => o.OrderDetailId).ValueGeneratedOnAdd();
            builder.Entity<Promotion>().Property(o => o.PromotionId).ValueGeneratedOnAdd();
            builder.Entity<WarrantyCard>().Property(o => o.WarrantyCardId).ValueGeneratedOnAdd();
            builder.Entity<WarrantyRequest>().Property(o => o.WarrantyRequestId).ValueGeneratedOnAdd();
            builder.Entity<Transaction>().Property(o => o.TransactionId).ValueGeneratedOnAdd();

            //Them khoa ngoai giua Setting voi SettingStyle
            builder
                .Entity<Accessory>()
                .HasOne(o => o.AccessoryType)
                .WithMany(o => o.Accessories)
                .HasForeignKey(o => o.AccessoryTypeId);

            //Them khoa ngoai giua AccessoryImage voi Accessory
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

            //Them khoa ngoai giua OrderDetail voi Order
            builder
                .Entity<OrderDetail>()
                .HasOne(o => o.Order)
                .WithMany(o => o.OrderDetails)
                .HasForeignKey(o => o.OrderId);

            //Them khoa ngoai giua Promotion voi Order
            builder
                .Entity<Order>()
                .HasOne(o => o.Promotion)
                .WithMany(o => o.Orders)
                .HasForeignKey(o => o.PromotionId);

            //Them khoa ngoai giua Customer voi Order
            builder
                .Entity<Order>()
                .HasOne(o => o.Customer)
                .WithMany(a => a.OrdersOfCustomer)
                .HasForeignKey(o => o.CustomerId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua SaleStaff voi Order
            builder
                .Entity<Order>()
                .HasOne(o => o.SaleStaff)
                .WithMany(a => a.OrdersOfSaleStaff)
                .HasForeignKey(o => o.SaleStaffId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua DeliveryStaff voi Order
            builder
                .Entity<Order>()
                .HasOne(o => o.DeliveryStaff)
                .WithMany(a => a.OrdersOfDeliveryStaff)
                .HasForeignKey(o => o.DeliveryStaffId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua Diamond voi OrderDetail
            builder
                .Entity<OrderDetail>()
                .HasOne(o => o.Diamond)
                .WithMany(o => o.OrderDetails)
                .HasForeignKey(o => o.DiamondId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua Order voi Transaction
            builder
                .Entity<Transaction>()
                .HasOne(o => o.Order)
                .WithMany(o => o.Transactions)
                .HasForeignKey(o => o.OrderId);

            //Them khoa ngoai giua WarrantyCard voi WarrantyRequest
            builder
                .Entity<WarrantyRequest>()
                .HasOne(o => o.WarrantyCard)
                .WithMany(o => o.WarrantyRequests)
                .HasForeignKey(o => o.WarrantyCardId);

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


            // Add test data
            List<Role> roles = new List<Role>
            {
                new Role { RoleId = 1, RoleName = "Customer" },
                new Role { RoleId = 2, RoleName = "SaleStaff" },
                new Role { RoleId = 3, RoleName = "DeliveryStaff" },
                new Role { RoleId = 4, RoleName = "WarrantyStaff" },
                new Role { RoleId = 5, RoleName = "Manager" },
                new Role { RoleId = 6, RoleName = "Administrator" },
            };

            List<Rank> ranks = new List<Rank>
            {
                new Rank
                {
                    RankId = 1,
                    RankName = "Bronze",
                    Discount = 0.025f,
                    RewardPoint = 0
                },
                new Rank
                {
                    RankId = 2,
                    RankName = "Silver",
                    Discount = 0.05f,
                    RewardPoint = 500
                },
                new Rank
                {
                    RankId = 3,
                    RankName = "Gold",
                    Discount = 0.075f,
                    RewardPoint = 1000
                },
                new Rank
                {
                    RankId = 4,
                    RankName = "Platinum",
                    Discount = 0.1f,
                    RewardPoint = 1500
                },
                new Rank
                {
                    RankId = 5,
                    RankName = "Emerald",
                    Discount = 0.125f,
                    RewardPoint = 2000
                },
                new Rank
                {
                    RankId = 6,
                    RankName = "Diamond",
                    Discount = 0.15f,
                    RewardPoint = 2500
                },
            };
            builder.Entity<Role>().HasData(roles);
            builder.Entity<Rank>().HasData(ranks);
        }
    }
}
