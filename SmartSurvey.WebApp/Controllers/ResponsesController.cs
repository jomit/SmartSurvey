using Newtonsoft.Json;
using SmartSurvey.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SmartSurvey.WebApp.Controllers
{
    public class ResponsesController : ApiController
    {
        SmartSurveyContext dbContext;
        public ResponsesController()
        {
            dbContext = new SmartSurveyContext();
        }
        public bool Post([FromBody] Response surveyResponse)
        {
            dbContext.Responses.Add(new Response
                {
                    Data = surveyResponse.Data,
                    CollectorId = surveyResponse.CollectorId,
                    FilledOn = DateTime.Now
                });
            dbContext.SaveChanges();
            return true;
        }
    }
}
