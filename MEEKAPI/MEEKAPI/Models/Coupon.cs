using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Coupon
    {
        public int userId { get; set; }
        public string date { get; set; }
        public string code { get; set; }
        public string value { get; set; }
    }
}