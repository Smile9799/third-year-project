using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class SubmitPitch
    {
        public string id { get; set; }
        public string PitchName { get; set; }
        public string ManagementLocation { get; set; }
        public string Industry { get; set; }
        public string Stage { get; set; }
        public string IdealInvestorRole { get; set; }
        public string Budget { get; set; }
        public string MinimumInvestmentPerInvestor { get; set; }
        public string MaximumInvestmentPerInvestor { get; set; }
        public string PreviousRoundRaise { get; set; }
        public string ShortSummary { get; set; }
        public string TheBusiness { get; set; }
        public string TheMarket { get; set; }
        public string ProgressProof { get; set; }
        public string Objectives { get; set; }
        public string VideoLink { get; set; }
        public string isSuccess { get; set; }
        public string isReviewed { get; set; }
        public string isDeleted { set; get;}
    }
}