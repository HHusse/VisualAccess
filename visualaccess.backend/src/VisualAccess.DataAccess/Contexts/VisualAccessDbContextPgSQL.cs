using System;
using Microsoft.EntityFrameworkCore;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Contexts
{
    public class VisualAccessDbContextPgSQL : DbContext
    {
        public DbSet<FaceDTO> Faces { get; set; }

        public VisualAccessDbContextPgSQL()
        {
        }

        public VisualAccessDbContextPgSQL(DbContextOptions<VisualAccessDbContextPgSQL> options)
        : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FaceDTO>().ToTable("Faces").HasKey(f => f.Id);
            modelBuilder.Entity<FaceDTO>()
                .HasIndex(f => f.Id)
                .IsUnique();
            modelBuilder.Entity<FaceDTO>().Property(f => f.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<FaceDTO>().Property(f => f.Encoding).IsRequired();
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

