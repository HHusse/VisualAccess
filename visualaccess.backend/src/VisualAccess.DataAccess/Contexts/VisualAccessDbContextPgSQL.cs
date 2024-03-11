using System;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Contexts
{
    public class VisualAccessDbContextPgSql : DbContext
    {
        public DbSet<FaceDto> Faces { get; set; }

        public VisualAccessDbContextPgSql()
        {
        }

        public VisualAccessDbContextPgSql(DbContextOptions<VisualAccessDbContextPgSql> options)
        : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FaceDto>().ToTable("Faces").HasKey(f => f.Id);
            modelBuilder.Entity<FaceDto>()
                .HasIndex(f => f.Id)
                .IsUnique();
            modelBuilder.Entity<FaceDto>().Property(f => f.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<FaceDto>().Property(f => f.Encoding).IsRequired();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseNpgsql(Environment.GetEnvironmentVariable("VSAC_PGSQL")!);
            }
        }

    }
}

