using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class BidEquity
    {
        public int InvestorUserID { set; get; }
        public int pitchId { set; get; }
       public double Investorfunds { set; get; }
       public double Investorpercentage { set; get; }
        public double Innovatorfunds { set; get; }
        public double Innovatorpercentage { set; get; }
        public int isAccepted { set; get; }
        public int isRejected { set; get; }
        public string InvestorMessage { set; get; }
        public string InnovatorMessage { set; get; }
        public int isComplete { set; get; }
    }
}