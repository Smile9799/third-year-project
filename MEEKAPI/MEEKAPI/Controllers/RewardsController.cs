using MEEKAPI.DOA.Rewards;
using MEEKAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MEEKAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RewardsController : ApiController
    {
        [Route("API/GetRewards")]
        [HttpPost]
        public List<RewardsModel> GetRewards(PostRewards rewards)
        {
            Rewards rewards1 = new Rewards();
            if (rewards.role.Equals("Innovator"))
            {
                return rewards1.getInnovatorRewards(rewards);
            }
            else if (rewards.role.Equals("Investor"))
            {
                return rewards1.getInvestorRewards(rewards);
            }
            else if (rewards.role.Equals("Reviewer"))
            {
                return rewards1.getReviewerRewards(rewards);
            }
            else
            {
                return new List<RewardsModel>();
            }
        }

        [Route("API/SaveCoupon")]
        [HttpPost]
        public Response addCoupon(Coupon coupon)
        {
            Rewards rewards = new Rewards();
            if (rewards.AddCouponCode(coupon))
            {
                return new Response { status = "200", message = "OK" };
            }
            else
            {
                return new Response { status = "500", message = "Did not add" };
            }
        }
        [Route("API/GetCoupon")]
        [HttpPost]
        public List<Coupon> GetCoupons (Coupon coupon)
        {
            Rewards rewards = new Rewards();
            return rewards.getDetails(coupon);
        }
    }
}
