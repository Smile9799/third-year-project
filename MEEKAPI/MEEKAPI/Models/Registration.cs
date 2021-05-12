using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class Registration
    {
        public string FullName { set; get; }
        public string Email { set; get; }
        public string Password { set; get; }
        public string Role { set; get; }
    }
}