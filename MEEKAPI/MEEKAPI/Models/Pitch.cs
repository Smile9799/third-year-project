using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Pitch
    {
        public int id { get; set; }
        public int PitchID { get; set; }
        public string PitchName { get; set; }
        public string ManagementLocation { get; set; }
        public string Industry { get; set; }
        public string Stage { get; set; }
        public string IdealInvestorRole { get; set; }
        public double Budget { get; set; }
        public double MinimumInvestmentPerInvestor { get; set; }
        public double MaximumInvestmentPerInvestor { get; set; }
        public double PreviousRoundRaise { get; set; }
        public string ShortSummary { get; set; }
        public string TheBusiness { get; set; }
        public string TheMarket { get; set; }
        public string ProgressProof { get; set; }
        public string Objectives { get; set; }
        public string VideoLink { get; set; }
        public int isSuccess { get; set; }
        public int isReviewed { get; set; }
        public string ReviewerMessage { get; set; }
        public int Grade { set; get; }
        public int isDeleted { set; get; }
        public string DeliveryMessage { set; get; }
        public int mobile { set; get; }
        public int submitPitch { set; get; }
        public int web { get; set; }
        public int userId { get; set; }
    }
}