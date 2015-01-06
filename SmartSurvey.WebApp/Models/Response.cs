namespace SmartSurvey.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("Responses")]
    public partial class Response
    {
        public int Id { get; set; }

        public int CollectorId { get; set; }

        [Required]
        public string Data { get; set; }

        public DateTime FilledOn { get; set; }
    }
}