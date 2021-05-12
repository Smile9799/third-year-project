using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEEKAPI.Models
{
    public class RewardsModel
    {
        public int mobileXP { get; set; }
        public int registerXP { get; set; }
        public int submitPitchXP { get; set; }
        public int progressXP { get; set; }
        public int reviewerXP { get; set; }
        public int investorXP { get; set; }
        public int invest { get; set; }
        public int isClaimed { get; set; }
    }
}