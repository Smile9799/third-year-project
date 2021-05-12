using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Meeting
    {
        public int PitchID { set; get; }
        public string TextMessage { get; set; }
        public string EquityMessage { get; set; }
        public string InterviewDate { get; set; }
        public string InterviewRoom { get; set; }
        public string InterviewTime { get; set; }
        public string InterviewVenue { get; set; }
        public string addressVenue { get; set; }
        public int isCompleted { get; set; }
        public int isAccepted { get; set; }
        public int UserId { get; set; }
        public string InvestorMessage { get; set; }
    }
}