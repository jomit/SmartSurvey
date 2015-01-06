using SmartSurvey.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SmartSurvey.WebApp.Controllers
{
    public class CollectorsController : ApiController
    {
        SmartSurveyContext dbContext;
        public CollectorsController()
        {
            dbContext = new SmartSurveyContext();
        }

        public IEnumerable<Survey> Get()
        {
            return dbContext
                    .Collectors
                    .Include("Template")
                    .Select(c => new Survey
                    {
                        Id = c.Id,
                        Location = c.Location,
                        Product = c.Product,
                        TemplateName = c.Template.Name,
                        UrlKey = c.UrlKey.ToString()
                    });
        }

        public Survey Get(string id)
        {
            var urlKeyGuid = new Guid(id);
            return dbContext
                    .Collectors
                    .Include("Template")
                    .Where(c => c.UrlKey == urlKeyGuid && c.IsActive == true)
                    .Select(c => new Survey
                        {
                            Id = c.Id,
                            Location = c.Location,
                            Product = c.Product,
                            TemplateName = c.Template.Name,
                            UrlKey = c.UrlKey.ToString()
                        })
                    .SingleOrDefault();
        }
    }
}
