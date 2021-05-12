﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Progress
    {
        public int PitchID { get; set; }
        public string TextMessage { get; set; }
        public string EquityMessage { get; set; }
        public string InterviewDate { get; set; }
        public string InterviewTime { get; set; }
        public string InterviewVenue { get; set; }
        public string addressVenue { get; set; }
        public string ReviewerMessage { get; set; }
    }
}