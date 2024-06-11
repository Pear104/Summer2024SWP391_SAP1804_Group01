using System.Reflection.Emit;
using backend.Helper;
using backend.Models;
using backend.Models.Payment.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options)
            : base(options) { }

        public ApplicationDbContext() { }

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

        //Start payment
        public DbSet<Merchant> Merchants { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<PaymentDestination> PaymentDestinations { get; set; }
        public DbSet<PaymentNotification> PaymentNotifications { get; set; }
        public DbSet<PaymentSignature> PaymentSignatures { get; set; }
        public DbSet<PaymentTransaction> PaymentTransactions { get; set; }

        //End payment

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Config enum conversion to string
            builder.Entity<Account>().Property(d => d.Role).HasConversion<string>();
            builder.Entity<Account>().Property(d => d.Gender).HasConversion<string>();
            builder.Entity<DiamondPrice>().Property(d => d.Clarity).HasConversion<string>();
            builder.Entity<DiamondPrice>().Property(d => d.Color).HasConversion<string>();
            builder.Entity<Order>().Property(d => d.OrderStatus).HasConversion<string>();
            builder
                .Entity<WarrantyRequest>()
                .Property(d => d.WarrantyStatus)
                .HasConversion<string>();

            // Set Id auto increment
            builder.Entity<Shape>().Property(o => o.ShapeId).ValueGeneratedOnAdd();
            builder.Entity<Diamond>().Property(o => o.DiamondId).ValueGeneratedOnAdd();
            builder.Entity<Accessory>().Property(o => o.AccessoryId).ValueGeneratedOnAdd();
            builder.Entity<AccessoryType>().Property(o => o.AccessoryTypeId).ValueGeneratedOnAdd();
            builder.Entity<Account>().Property(o => o.AccountId).ValueGeneratedOnAdd();
            builder.Entity<Rank>().Property(o => o.RankId).ValueGeneratedOnAdd();
            // builder.Entity<Order>().Property(o => o.OrderId).ValueGeneratedOnAdd();
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
            builder.Entity<Merchant>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<Payment>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<PaymentDestination>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<PaymentNotification>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<PaymentSignature>().Property(o => o.Id).ValueGeneratedOnAdd();
            builder.Entity<PaymentTransaction>().Property(o => o.Id).ValueGeneratedOnAdd();

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
                .HasForeignKey<OrderDetail>(w => w.DiamondId)
                .OnDelete(DeleteBehavior.Restrict);

            //Them khoa ngoai giua Order voi Transaction
            builder
                .Entity<Transaction>()
                .HasOne(o => o.Order)
                .WithMany(o => o.Transactions)
                .HasForeignKey(o => o.OrderId);

            //Them khoa ngoai giua WarrantyCard voi OrderDetail
            builder
                .Entity<WarrantyCard>()
                .HasOne(o => o.OrderDetail)
                .WithOne(o => o.WarrantyCard)
                .HasForeignKey<WarrantyCard>(w => w.OrderDetaiId)
                .OnDelete(DeleteBehavior.Cascade);

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

            //Them khoaa ngoai giua Merchant va Payment
            builder
                .Entity<Merchant>()
                .HasMany(e => e.Payments)
                .WithOne(e => e.Merchant)
                .HasForeignKey(e => e.MerchantId)
                .IsRequired(false);

            //Them khoaa ngoai giua Merchant va PaymentNotification
            builder
                .Entity<Merchant>()
                .HasMany(e => e.Notifications)
                .WithOne(e => e.NotiMerchant)
                .HasForeignKey(e => e.NotiMerchantId)
                .IsRequired(false);

            //Them khoaa ngoai giua Merchant va Payment
            builder
                .Entity<Merchant>()
                .HasMany(e => e.Payments)
                .WithOne(e => e.Merchant)
                .HasForeignKey(e => e.MerchantId)
                .IsRequired(false);

            //Them khoaa ngoai giua Payment va PaymentTranaction
            builder
                .Entity<Payment>()
                .HasMany(e => e.Transactions)
                .WithOne(e => e.Payment)
                .HasForeignKey(e => e.PaymentId)
                .IsRequired(false);

            //Them khoaa ngoai giua Payment va PaymentSignature
            builder
                .Entity<Payment>()
                .HasMany(e => e.Signatures)
                .WithOne(e => e.Payment)
                .HasForeignKey(e => e.PaymentId)
                .IsRequired(false);

            //Them khoaa ngoai giua Payment va PaymentNotification
            builder
                .Entity<Payment>()
                .HasMany(e => e.Notifications)
                .WithOne(e => e.NotiPayment)
                .HasForeignKey(e => e.NotiPaymentId)
                .IsRequired(false);

            //Them khoaa ngoai giua PaymentDestination va Payment
            builder
                .Entity<PaymentDestination>()
                .HasMany(e => e.Payments)
                .WithOne(e => e.PaymentDestination)
                .HasForeignKey(e => e.PaymentDestinationId)
                .IsRequired(false);

            //Them khoaa ngoai giua PaymentDestination va PaymentDestination
            builder
                .Entity<PaymentDestination>()
                .HasMany(e => e.PaymentDestinations)
                .WithOne(e => e.DesParent)
                .HasForeignKey(e => e.DesParentId)
                .IsRequired(false);
        }

        public override int SaveChanges()
        {
            SetMerchantIds();
            return base.SaveChanges();
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {
            SetMerchantIds();
            SetPaymentIds();
            SetPaymentSignitureIds();
            SetOrderIds();
            return base.SaveChangesAsync(cancellationToken);
        }

        private void SetMerchantIds()
        {
            foreach (var entry in ChangeTracker.Entries<Merchant>())
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Entity.Id = entry.Entity.GenerateHashedId();
                }
            }
        }

        //tobe refactored
        private void SetPaymentIds()
        {
            foreach (var entry in ChangeTracker.Entries<Payment>())
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Entity.Id = ObjectExtention.PostFixPlusDateTimeNow("PAY");
                }
            }
        }

        //also set signiture id

        private void SetPaymentSignitureIds()
        {
            foreach (var entry in ChangeTracker.Entries<PaymentSignature>())
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Entity.Id = ObjectExtention.PostFixPlusDateTimeNow("PSIG");
                }
            }
        }

        //set order id
        private void SetOrderIds()
        {
            foreach (var entry in ChangeTracker.Entries<Order>())
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Entity.OrderId = ObjectExtention.LongDateTimeNow();
                }
            }
        }
    }
}
