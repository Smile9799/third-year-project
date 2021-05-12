using MEEKAPI.DOA.ReportsDOA;
using MEEKAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MEEKAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ReportsController : ApiController
    {
        ReportsDOA dOA = new ReportsDOA();
        [Route("API/Reports/GetReportsByProvice")]
        [HttpGet]
        public List<Current> getReports()
        {
            return dOA.getSubmittedPitchesByProvince();
        }
        [Route("API/Reports/GetReportsByIndustry")]
        [HttpGet]
        public List<Current> getSubmittedPitchByIndustry()
        {
            return dOA.getSubmittedPitchesByIndustry();
        }
        [Route("API/Reports/SuccessPitchByIndustry")]
        [HttpGet]
        public List<Current> getSuccessfulPitchByIndustry()
        {
            return dOA.getSuccesfulPitchByIndustry();
        }
        [Route("API/Reports/SuccessPitchByLocation")]
        [HttpGet]
        public List<Current> getSuccessfulPitchByLocation()
        {
            return dOA.getSuccesfulPitchByLocation();
        }
        [Route("API/Reports/SuccessPitchByLocationForInvestors")]
        [HttpGet]
        public List<Current> getSuccessfulForInvestorPitchByLocation()
        {
            return dOA.getSuccesfulPitchForInvestorByLocation();
        }
        [Route("API/Reports/SuccessPitchByIndustryForInvestors")]
        [HttpGet]
        public List<Current> getSuccessfulForInvestorPitchByIndustry()
        {
            return dOA.getSuccesfulPitchForInvestorByIndustry();
        }
        [Route("API/Reports/GetAllRegisteredUsers")]
        [HttpGet]
        public List<Mobile> getAllUsers()
        {
            return dOA.getAllUsers();
        }
        [Route("API/Reports/GetAllRegisteredReviewers")]
        [HttpGet]
        public List<Mobile> getAllReviewers()
        {
            return dOA.getAllReviewers();
        }
        [Route("API/Reports/GetAllSubmitted")]
        [HttpGet]
        public List<Mobile> getAllPitch()
        {
            return dOA.getAllPitches();
        }
        [Route("API/Reports/GetAllUsersByLocation")]
        [HttpGet]
        public List<Current> getAllUsersByLocation()
        {
            return dOA.getAllUsersByLocation();
        }
        [Route("API/Reports/GetAllUsersOnMobile")]
        [HttpGet]
        public List<Current> getAllUsersOnMobile()
        {
            return dOA.getAllOnMobile();
        }
    }
}
