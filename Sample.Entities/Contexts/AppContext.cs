using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Sample.Entities.Models
{
    public partial class AppContext : DbContext
    {
        public AppContext()
        {
        }

        public AppContext(DbContextOptions<AppContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<ListTask> ListTask { get; set; }
        public virtual DbSet<Project> Project { get; set; }
        public virtual DbSet<ProjectTask> ProjectTask { get; set; }
        public virtual DbSet<TaskUser> TaskUser { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=PM-FresherDB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Comment1)
                    .HasColumnName("Comment")
                    .HasColumnType("ntext");

                entity.Property(e => e.ParentCommentId).HasColumnName("ParentCommentID");

                entity.Property(e => e.TaskId).HasColumnName("TaskID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Task)
                    .WithMany(p => p.Comment)
                    .HasForeignKey(d => d.TaskId)
                    .HasConstraintName("FK_Comment_TaskUser");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Comment)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Comment_User");
            });

            modelBuilder.Entity<ListTask>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.ProjectId).HasColumnName("ProjectID");

                entity.HasOne(d => d.Project)
                    .WithMany(p => p.ListTask)
                    .HasForeignKey(d => d.ProjectId)
                    .HasConstraintName("FK_ListTask_Project");
            });

            modelBuilder.Entity<Project>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.HasOne(d => d.AssignToNavigation)
                    .WithMany(p => p.Project)
                    .HasForeignKey(d => d.AssignTo)
                    .HasConstraintName("FK_Project_User");
            });

            modelBuilder.Entity<ProjectTask>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AttachFiles).HasColumnType("text");

                entity.Property(e => e.Description).HasColumnType("ntext");

                entity.Property(e => e.ListTaskId).HasColumnName("ListTaskID");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.HasOne(d => d.ListTask)
                    .WithMany(p => p.ProjectTask)
                    .HasForeignKey(d => d.ListTaskId)
                    .HasConstraintName("FK_TaskP_ListTask");
            });

            modelBuilder.Entity<TaskUser>(entity =>
            {
                entity.ToTable("Task_User");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.TaskId).HasColumnName("TaskID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Task)
                    .WithMany(p => p.TaskUser)
                    .HasForeignKey(d => d.TaskId)
                    .HasConstraintName("FK_TaskUser_Task");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TaskUser)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_TaskUser_User");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Img).HasColumnType("text");

                entity.Property(e => e.Name).HasMaxLength(50);
            });
        }
    }
}
