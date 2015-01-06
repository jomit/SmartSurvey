namespace SmartSurvey.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [KnownType(typeof(Template))]
    public partial class Collector
    {
        public int Id { get; set; }

        public int TemplateId { get; set; }

        [Required]
        [StringLength(500)]
        public string Location { get; set; }

        [Required]
        [StringLength(100)]
        public string Product { get; set; }

        public Guid UrlKey { get; set; }

        public bool IsActive { get; set; }

        public virtual Template Template { get; set; }
    }
}
