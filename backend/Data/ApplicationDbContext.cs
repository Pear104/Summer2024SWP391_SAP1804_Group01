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
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<WarrantyCard> WarrantyCards { get; set; }
        public DbSet<WarrantyRequest> WarrantyRequests { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<PriceRate> PriceRates { get; set; }
        public DbSet<DiamondPrice> DiamondPrices { get; set; }
        public DbSet<MaterialPrice> MaterialPrices { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Set Id auto increment
            builder.Entity<Shape>().Property(o => o.ShapeId).ValueGeneratedOnAdd();
            builder.Entity<Diamond>().Property(o => o.DiamondId).ValueGeneratedOnAdd();
            builder.Entity<Accessory>().Property(o => o.AccessoryId).ValueGeneratedOnAdd();
            builder.Entity<AccessoryType>().Property(o => o.AccessoryTypeId).ValueGeneratedOnAdd();
            builder.Entity<Account>().Property(o => o.AccountId).ValueGeneratedOnAdd();
            builder.Entity<Rank>().Property(o => o.RankId).ValueGeneratedOnAdd();
            builder.Entity<Order>().Property(o => o.OrderId).ValueGeneratedOnAdd();
            builder.Entity<OrderDetail>().Property(o => o.OrderDetailId).ValueGeneratedOnAdd();
            builder.Entity<Promotion>().Property(o => o.PromotionId).ValueGeneratedOnAdd();
            builder.Entity<WarrantyCard>().Property(o => o.WarrantyCardId).ValueGeneratedOnAdd();
            builder.Entity<Transaction>().Property(o => o.TransactionId).ValueGeneratedOnAdd();
            builder.Entity<Blog>().Property(o => o.BlogId).ValueGeneratedOnAdd();
            builder.Entity<Feedback>().Property(o => o.FeedbackId).ValueGeneratedOnAdd();
            builder.Entity<PriceRate>().Property(o => o.PriceRateId).ValueGeneratedOnAdd();
            builder.Entity<DiamondPrice>().Property(o => o.DiamondPriceId).ValueGeneratedOnAdd();
            builder.Entity<MaterialPrice>().Property(o => o.MaterialPriceId).ValueGeneratedOnAdd();
            builder
                .Entity<AccessoryImage>()
                .Property(o => o.AccessoryImageId)
                .ValueGeneratedOnAdd();
            builder
                .Entity<WarrantyRequest>()
                .Property(o => o.WarrantyRequestId)
                .ValueGeneratedOnAdd();

            //Them khoa ngoai giua Accessory voi AccessoryType
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
                .WithOne(o => o.OrderDetail)
                .HasForeignKey<OrderDetail>(w => w.OrderDetailId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua Order voi Transaction
            builder
                .Entity<Transaction>()
                .HasOne(o => o.Order)
                .WithMany(o => o.Transactions)
                .HasForeignKey(o => o.OrderId);

            //Them khoa ngoai giua WarrantyCard voi OrderDetail
            builder
                .Entity<OrderDetail>()
                .HasOne(o => o.WarrantyCard)
                .WithOne(o => o.OrderDetail)
                .HasForeignKey<OrderDetail>(w => w.OrderDetailId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua WarrantyCard voi WarrantyRequest
            builder
                .Entity<WarrantyRequest>()
                .HasOne(o => o.WarrantyCard)
                .WithMany(o => o.WarrantyRequests)
                .HasForeignKey(o => o.WarrantyCardId);

            //Them khoa ngoai giua Blog voi Author
            builder
                .Entity<Blog>()
                .HasOne(o => o.Author)
                .WithMany(o => o.Blogs)
                .HasForeignKey(o => o.AuthorId);

            //Them khoa ngoai giua PriceRate voi Account
            builder
                .Entity<PriceRate>()
                .HasOne(o => o.Account)
                .WithMany(o => o.PriceRates)
                .HasForeignKey(o => o.AccountId);

            //Them khoa ngoai giua Order voi Feedback
            builder
                .Entity<Feedback>()
                .HasOne(o => o.Order)
                .WithMany(o => o.Feedbacks)
                .HasForeignKey(o => o.OrderId);

            //Them khoa ngoai giua Order voi Feedback
            builder
                .Entity<Feedback>()
                .HasOne(o => o.Accessory)
                .WithMany(o => o.Feedbacks)
                .HasForeignKey(o => o.AccessoryId);

            //Them khoa ngoai giua Order voi PriceRate
            builder
                .Entity<Order>()
                .HasOne(o => o.PriceRate)
                .WithMany(o => o.Orders)
                .HasForeignKey(o => o.PriceRateId);

            //Them khoa ngoai giua Order voi Rank
            builder
                .Entity<Order>()
                .HasOne(o => o.Rank)
                .WithMany(o => o.Orders)
                .HasForeignKey(o => o.RankId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua OrderDetail voi DiamondPrice
            builder
                .Entity<OrderDetail>()
                .HasOne(o => o.DiamondPrice)
                .WithMany(o => o.OrderDetails)
                .HasForeignKey(o => o.DiamondPriceId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua OrderDetail voi MaterialPrice
            builder
                .Entity<OrderDetail>()
                .HasOne(o => o.MaterialPrice)
                .WithMany(o => o.OrderDetails)
                .HasForeignKey(o => o.MaterialPriceId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua Customer voi WarrantyRequest
            builder
                .Entity<WarrantyRequest>()
                .HasOne(o => o.Customer)
                .WithMany(o => o.WarrantyRequestsOfCustomer)
                .HasForeignKey(o => o.CustomerId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua SaleStaff voi WarrantyRequest
            builder
                .Entity<WarrantyRequest>()
                .HasOne(o => o.SaleStaff)
                .WithMany(o => o.WarrantyRequestsOfSaleStaff)
                .HasForeignKey(o => o.SaleStaffId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua DeliveryStaff voi WarrantyRequest
            builder
                .Entity<WarrantyRequest>()
                .HasOne(o => o.DeliveryStaff)
                .WithMany(o => o.WarrantyRequestsOfDeliveryStaff)
                .HasForeignKey(o => o.DeliveryStaffId)
                .OnDelete(DeleteBehavior.Restrict);

            // Add test data
            List<Rank> ranks = new List<Rank>
            {
                new Rank
                {
                    RankId = 1,
                    RankName = "Bronze",
                    Discount = 0,
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
            builder.Entity<Rank>().HasData(ranks);
        }
    }
}
