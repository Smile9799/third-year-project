using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class User
    {
        public int UserId { set; get; }
        public string  FullName { set; get; }
        public string Email { set; get; }
        public string Password { set; get; }
        public string Role { set; get; }
        public string Cell_Number { set; get; }
        public string IDNumber { set; get; }
        public string City { set; get; }
        public string Province { set; get; }
        public string Street { set; get; }
        public string ZipCode { set; get; }
        public int isActive { set; get; }
        public string YearDOB { set; get; }
        public string DateMonth { set; get; }
        public int OnMobile { set; get; }
        public int isDetails { set; get; }
    }
}