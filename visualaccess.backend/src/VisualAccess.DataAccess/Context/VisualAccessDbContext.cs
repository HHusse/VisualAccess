using System;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Models;

namespace VisualAccess.DataAccess.Context
{
    public class VisualAccessDbContext : DbContext
    {
        public DbSet<AccountDTO> Accounts { get; set; }

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
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseNpgsql("");
            }
        }

    }
}

