using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Communication
    {
        public int id { set; get; }
        public int PitchID { set; get; }
        public string TextMessage { set; get; }
        public string EquityMessage { set; get; }
        public string DateAdded { set; get; }
        public string InterviewDate { set; get; }
        public string InterviewTime { get; set; }
        public string InterviewVenue { get; set; }
        public string addressVenue { get; set; }
        public int isCompleted { get; set; }
        public int isAccepted { get; set; }
        public int UserId { get; set; }
    }
}