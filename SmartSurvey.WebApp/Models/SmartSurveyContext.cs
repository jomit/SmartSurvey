namespace SmartSurvey.WebApp.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SmartSurveyContext : DbContext
    {
        public SmartSurveyContext()
            : base("name=SmartSurvey")
        {
        }

        public virtual DbSet<Collector> Collectors { get; set; }
        public virtual DbSet<Response> Responses { get; set; }
        public virtual DbSet<Template> Templates { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Collector>()
            //    .HasMany(e => e.Responses)
            //    .WithRequired(e => e.Collector)
            //    .WillCascadeOnDelete(false);

            //modelBuilder.Entity<Template>()
            //    .HasMany(e => e.Collectors)
            //    .WithRequired(e => e.Template)
            //    .WillCascadeOnDelete(false);
        }
    }
}
