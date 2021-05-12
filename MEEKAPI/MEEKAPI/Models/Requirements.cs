using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Requirements
    {
        public int  InvestorID { set; get; }
        public int ID { set; get; }
        public string ProjectGroup { set; get; }
        public double Budget { set; get; }
        public double MaximumAmount { get; set; }
        public string Stage { get; set; }
        public string Location { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
    }
}