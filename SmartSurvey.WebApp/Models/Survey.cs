using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartSurvey.WebApp.Models
{
    public class Survey
    {
        public int Id { get; set; }
        public string Location { get; set; }
        public string Product { get; set; }
        public string UrlKey { get; set; }
        public string TemplateName { get; set; }
        public string Responses { get; set; }
    }
}