//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//            Phật phù hộ, không bao giờ BUG
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
using backend.Payment_src.core.Payment.Service.Paypal.Model;
// using backend.Payment_src.core.Payment.Service.Momo.Config;
using backend.Payment_src.core.Payment.Service.Vnpay.Config;
using DAOs;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Repositories.Implements;
using Repositories.Interfaces;
using Repositories.Interfaces.Payments;
using Services.Implements;
using Services.Interfaces;

namespace backend
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder
                .Services.AddControllers()
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft
                        .Json
                        .ReferenceLoopHandling
                        .Ignore;
                });

            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddSwaggerGen(option =>
            {
                option.SwaggerDoc("v1", new OpenApiInfo { Title = "Demo API", Version = "v1" });
                //var xmlFileName = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                //var path = Path.Combine(AppContext.BaseDirectory, xmlFileName);
                //option.IncludeXmlComments(path);
                option.AddSecurityDefinition(
                    "Bearer",
                    new OpenApiSecurityScheme
                    {
                        In = ParameterLocation.Header,
                        Description = "Please enter a valid token",
                        Name = "Authorization",
                        Type = SecuritySchemeType.Http,
                        BearerFormat = "JWT",
                        Scheme = "Bearer"
                    }
                );
                option.AddSecurityRequirement(
                    new OpenApiSecurityRequirement
                    {
                        {
                            new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference
                                {
                                    Type = ReferenceType.SecurityScheme,
                                    Id = "Bearer"
                                }
                            },
                            new string[] { }
                        }
                    }
                );
            });

            builder.Services.AddDbContext<ApplicationDbContext>(option =>
            {
                option.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
            });

            builder.Services.AddHttpContextAccessor();

            //Payment cofiguration
            // builder.Services.Configure<MomoConfig>(
            //     builder.Configuration.GetSection(MomoConfig.ConfigName)
            // );
            //Payment cofiguration
            builder.Services.Configure<VnpayConfig>(
                builder.Configuration.GetSection(VnpayConfig.ConfigName)
            );

            builder.Services.AddSingleton(x => new PaypalClient(
                builder.Configuration["PaypalOptions:Mode"],
                builder.Configuration["PaypalOptions:ClientId"],
                builder.Configuration["PaypalOptions:ClientSecret"]
            ));

            builder
                .Services.AddAuthentication(options =>
                {
                    options.DefaultAuthenticateScheme =
                        options.DefaultChallengeScheme =
                        options.DefaultForbidScheme =
                        options.DefaultScheme =
                        options.DefaultSignInScheme =
                        options.DefaultSignOutScheme =
                            JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidIssuer = builder.Configuration["JWT:Issuer"],
                        ValidateAudience = true,
                        ValidAudience = builder.Configuration["JWT:Audience"],
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(
                            System.Text.Encoding.UTF8.GetBytes(
                                builder.Configuration["JWT:SigningKey"]
                            )
                        )
                    };
                });

            // Repositories

            builder.Services.AddScoped<ITransactionRepository, TransactionRepository>();
            builder.Services.AddScoped<IWarrantyRequestRepository, WarrantyRequestRepository>();
            builder.Services.AddScoped<IShapeRepository, ShapeRepository>();
            builder.Services.AddScoped<IAccessoryTypeRepository, AccessoryTypeRepository>();
            builder.Services.AddScoped<IMaterialPriceRepository, MaterialPriceRepository>();
            builder.Services.AddScoped<IDiamondPriceRepository, DiamondPriceRepository>();
            builder.Services.AddScoped<IBlogRepository, BlogRepository>();
            builder.Services.AddScoped<IOrderRepository, OrderRepository>();
            builder.Services.AddScoped<ISearchRepository, SearchRepository>();
            builder.Services.AddScoped<IAccountRepository, AccountRepository>();
            builder.Services.AddScoped<IAuthenticationService, AuthenticationService>();
            builder.Services.AddScoped<IDiamondRepository, DiamondRepository>();
            builder.Services.AddTransient<IEmailSender, EmailSender>();
            builder.Services.AddScoped<IMerchantRepository, MerchantRepository>();
            builder.Services.AddScoped<IOrderRepository, OrderRepository>();
            builder.Services.AddScoped<IRankRepository, RankRepository>();
            builder.Services.AddScoped<ITokenService, TokenService>();
            builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
            builder.Services.AddScoped<IPaymentSignatureRepository, PaymentSinatureRepository>();
            builder.Services.AddScoped<
                IPaymentTransactionRepository,
                PaymentTransactionRepository
            >();
            builder.Services.AddScoped<IAccessoryRepository, AccessoryRepository>();
            builder.Services.AddScoped<ICurrentUserService, CurrentUserService>();
            builder.Services.AddScoped<IPriceRateRepository, PriceRateRepository>();
            builder.Services.AddScoped<IReportRepository, ReportRepository>();
            builder.Services.AddScoped<IFeedbackRepository, FeedbackRepository>();
            builder.Services.AddScoped<IWarrantyCardRepository, WarrantyCardRepository>();
            builder.Services.AddScoped<IPromotionRepository, PromotionRepository>();

            // Services

            builder.Services.AddScoped<ITransactionService, TransactionService>();
            builder.Services.AddScoped<IWarrantyRequestService, WarrantyRequestService>();
            builder.Services.AddScoped<IShapeService, ShapeService>();
            builder.Services.AddScoped<IAccessoryTypeService, AccessoryTypeService>();
            builder.Services.AddScoped<IMaterialPriceService, MaterialPriceService>();
            builder.Services.AddScoped<IDiamondPriceService, DiamondPriceService>();
            builder.Services.AddScoped<IBlogService, BlogService>();
            builder.Services.AddScoped<IOrderService, OrderService>();
            builder.Services.AddScoped<ISearchService, SearchService>();
            builder.Services.AddScoped<IAccountService, AccountService>();
            builder.Services.AddScoped<IAuthenticationService, AuthenticationService>();
            builder.Services.AddScoped<IDiamondService, DiamondService>();
            builder.Services.AddTransient<IEmailSender, EmailSender>();
            builder.Services.AddScoped<IMerchantRepository, MerchantRepository>();
            builder.Services.AddScoped<IRankService, RankService>();
            builder.Services.AddScoped<ITokenService, TokenService>();
            builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
            builder.Services.AddScoped<IPaymentSignatureRepository, PaymentSinatureRepository>();
            builder.Services.AddScoped<
                IPaymentTransactionRepository,
                PaymentTransactionRepository
            >();
            builder.Services.AddScoped<IAccessoryService, AccessoryService>();
            builder.Services.AddScoped<ICurrentUserService, CurrentUserService>();
            builder.Services.AddScoped<IPriceRateService, PriceRateService>();
            builder.Services.AddScoped<IReportService, ReportService>();
            builder.Services.AddScoped<IFeedbackService, FeedbackService>();
            builder.Services.AddScoped<IWarrantyCardService, WarrantyCardService>();
            builder.Services.AddScoped<IPromotionService, PromotionService>();
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseCors(x =>
                x.AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials()
                    .WithOrigins("https://datj.id.vn")
                    .SetIsOriginAllowed(origin => true)
            );

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}
