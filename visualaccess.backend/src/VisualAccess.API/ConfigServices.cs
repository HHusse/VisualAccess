using System;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Validators;
using VisualAccess.Business.Factories;
using VisualAccess.Domain.Interfaces.Factories;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.FaceRecognition.ServicesClient;
using MongoDB.Driver;
using System.Security.Claims;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Business.Mappers;

namespace VisualAccess.API
{
    public static class ConfigServices
    {
        public static void AddConfig(this IServiceCollection services)
        {
            var mongoClient = new MongoClient(Environment.GetEnvironmentVariable("VSAC_MONGODB_CONNECTION_STRING"));
            var mongoDatabase = mongoClient.GetDatabase(Environment.GetEnvironmentVariable("VSAC_MONGODB_DATABASE_NAME"));

            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder.AllowAnyOrigin()
                           .AllowAnyHeader()
                           .AllowAnyMethod();
                });
            });
            services.AddAuthentication().AddJwtBearer(optional =>
                optional.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Environment.GetEnvironmentVariable("VSAC_ISSUER")!,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Environment.GetEnvironmentVariable("VSAC_SECRETKEY")!))
                }
            );
            services.AddAuthorization(options =>
            {
                options.AddPolicy("RoomRequest", policy =>
                    policy.RequireClaim(ClaimTypes.Actor, "ROOM"));
                options.AddPolicy("AccountRequest", policy =>
                    policy.RequireClaim(ClaimTypes.Actor, "ACCOUNT"));
            });

            services.AddHttpClient();
            services.AddSingleton(mongoDatabase);
            services.AddDbContext<VisualAccessDbContextPgSQL>(opt => opt.UseNpgsql(Environment.GetEnvironmentVariable("VSAC_PGSQL")!));
            services.AddSingleton(LogManager.GetLogger("API"));
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IAccountValidator, AccountValidator>();
            services.AddScoped<IRoomValidator, RoomValidator>();
            services.AddScoped<IFaceRepository, FaceRepository>();
            services.AddScoped<IRoomRepository, RoomRepository>();
            services.AddScoped<IEntranceRecordRepository, EntranceRecordRepository>();
            services.AddScoped<ITokenFactory, TokenFactory>();
            services.AddScoped<IAccountFactory, AccountFactory>();
            services.AddScoped<IRoomFactory, RoomFactory>();
            services.AddScoped<IFaceRecognitionServiceClient, FaceRecognitionServiceClient>();
            services.AddScoped<IGenericMapper, GenericMapper>();
            services.AddScoped<VisualAccessDbContextMongoDB>();

        }
    }
}

