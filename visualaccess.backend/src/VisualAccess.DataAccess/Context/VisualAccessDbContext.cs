using System;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Context
{
    public class VisualAccessDbContext : DbContext
    {
        public DbSet<AccountDTO> Accounts { get; set; }
        public DbSet<FaceDTO> Faces { get; set; }
        public DbSet<RoomDTO> Rooms { get; set; }
        public DbSet<RoomPermissionDTO> RoomPermissions { get; set; }

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

            modelBuilder.Entity<FaceDTO>().ToTable("Faces").HasKey(f => f.Id);
            modelBuilder.Entity<FaceDTO>()
                .HasIndex(f => f.Id)
                .IsUnique();
            modelBuilder.Entity<FaceDTO>().Property(f => f.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<FaceDTO>().Property(f => f.Encoding).IsRequired();


            modelBuilder.Entity<RoomDTO>().ToTable("Rooms");
            modelBuilder.Entity<RoomDTO>(entity =>
            {
                entity.HasKey(r => r.Id);
                entity.HasIndex(r => r.Id).IsUnique();
                entity.HasIndex(r => r.Name).IsUnique();
                entity.Property(r => r.Id).ValueGeneratedOnAdd();
                entity.Property(r => r.Name).IsRequired();
            });


            modelBuilder.Entity<RoomPermissionDTO>().ToTable("RoomPermissions");
            modelBuilder.Entity<RoomPermissionDTO>(entity =>
            {

                entity.HasKey(e => e.Id);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.HasOne(rp => rp.Account)
                      .WithMany()
                      .HasForeignKey(rp => rp.AccountId)
                      .OnDelete(DeleteBehavior.Cascade);

                entity.HasOne(rp => rp.Room)
                      .WithMany()
                      .HasForeignKey(rp => rp.RoomId)
                      .OnDelete(DeleteBehavior.Cascade);
            });

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

