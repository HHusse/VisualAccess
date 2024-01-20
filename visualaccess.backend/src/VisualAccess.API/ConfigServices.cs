using System;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Context;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Business.Validators;
using VisualAccess.Business.Factories;
using VisualAccess.Domain.Interfaces.Factories;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace VisualAccess.API
{
    public static class ConfigServices
    {
        public static void AddConfig(this IServiceCollection services)
        {
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
                    ValidIssuer = Environment.GetEnvironmentVariable("ISSUER")!,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Environment.GetEnvironmentVariable("SECRETKEY")!))
                }
            );

            services.AddDbContext<VisualAccessDbContext>(opt => opt.UseNpgsql(Environment.GetEnvironmentVariable("DBCONNECTIONSTRING")!));
            services.AddSingleton(LogManager.GetLogger("API"));
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IAccountValidator, AccountValidator>();
            services.AddScoped<ITokenFactory, TokenFactory>();
        }
    }
}

