using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class LoggedIn
    {
        public string message { get; set; }

        public string email { get; set; }
        public string usertype { get; set; }
        public string surname { get; set; }
        public string name { get; set; }
        public int id { get; set; }
        public string status { get; set; }
    }
}