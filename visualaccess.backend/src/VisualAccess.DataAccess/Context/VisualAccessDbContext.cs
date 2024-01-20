using System;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Context
{
    public class VisualAccessDbContext : DbContext
    {
        public DbSet<AccountDTO> Accounts { get; set; }
        public DbSet<FacesDTO> Faces { get; set; }

        public VisualAccessDbContext()
        {
        }

        public VisualAccessDbContext(DbContextOptions<VisualAccessDbContext> options)
        : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AccountDTO>().ToTable("Accounts").HasKey(a => a.Id);

            modelBuilder.Entity<AccountDTO>()
                .HasIndex(a => a.Email)
                .IsUnique();
            modelBuilder.Entity<AccountDTO>()
                .HasIndex(a => a.Username)
                .IsUnique();
            modelBuilder.Entity<AccountDTO>().Property(a => a.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<AccountDTO>().Property(a => a.Role).HasConversion<string>();
            modelBuilder.Entity<AccountDTO>().Property(a => a.FirstName).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.LastName).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.Email).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.Password).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.PhoneNumber).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.Address).IsRequired();
            modelBuilder.Entity<AccountDTO>().Property(a => a.FaceID).IsRequired(false);
            modelBuilder.Entity<AccountDTO>()
               .HasIndex(a => a.FaceID)
               .IsUnique();
            AccountDTO accountForSetup = new AccountDTO("", "", "setup", "", BCrypt.Net.BCrypt.HashPassword("visualaccess"), "", "", Role.ADMIN);
            accountForSetup.Id = 1;
            modelBuilder.Entity<AccountDTO>().HasData(accountForSetup);

            modelBuilder.Entity<FacesDTO>().ToTable("Faces").HasKey(f => f.Id);
            modelBuilder.Entity<FacesDTO>()
                .HasIndex(f => f.Id)
                .IsUnique();
            modelBuilder.Entity<FacesDTO>().Property(f => f.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<FacesDTO>().Property(f => f.Encoding).IsRequired();

            modelBuilder.Entity<AccountDTO>()
                .HasOne(a => a.Face)
                .WithOne(f => f.Account)
                .HasForeignKey<AccountDTO>(a => a.FaceID);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseNpgsql(Environment.GetEnvironmentVariable("DBCONNECTIONSTRING")!);
            }
        }

    }
}

