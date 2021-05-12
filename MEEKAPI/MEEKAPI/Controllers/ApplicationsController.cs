using MEEKAPI.DOA.Application;
using MEEKAPI.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MEEKAPI.Controllers
{
    /// <summary>
    /// A controller that handles all applications related requests
    /// </summary>

    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ApplicationsController : ApiController
    {
        private void UpdateRewardsPitchAdd (int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            int points = getPitchPoints(id);
            int newPoints = points + 25;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update RewardsTable set SubmitPitch = '"+newPoints+"' where UserId='"+id+"'";
                sql.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        /// <summary>
        /// Adds the users pitch to the table
        /// </summary>
        /// <param name="pitch">The Json parameter sent from the client.</param>
        [Route("API/Application/AddPitch")]
        [HttpPost]
        public Response AddApplication(SubmitPitch pitch)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "INSERT INTO Pitch (UserId,PitchName,ManagementLocation,Industry,Stage,IdealInvestorRole,Budget,MinimumInvestmentPerInvestor,MaximumInvestmentPerInvestor,PreviousRoundRaise,ShortSummary,TheBusiness,TheMarket,ProgressProof,Objectives,VideoURLLink,ReviewerMessage,DeliveryMessage,isSubmitted,isDeleted,isSuccess,isReviewed,ReviewerId,ReviewerXP,SubmitPitchXP,ProgressXP) Values('" + pitch.id + "','" + pitch.PitchName + "','" + pitch.ManagementLocation + "','" + pitch.Industry + "','" + pitch.Stage + "','" + pitch.IdealInvestorRole + "','" + pitch.Budget + "','" + pitch.MinimumInvestmentPerInvestor + "','" + pitch.MaximumInvestmentPerInvestor + "','" + pitch.PreviousRoundRaise + "','" + pitch.ShortSummary + "','" + pitch.TheBusiness + "','" + pitch.TheMarket + "','" + pitch.ProgressProof + "','" + pitch.Objectives + "','" + pitch.VideoLink + "','" + "N/A" + "','" + "Hi there we have received your pitch our reviewes will look at it before passing it to our investors"+"',0,'" + pitch.isDeleted + "','" + pitch.isSuccess + "','" + pitch.isReviewed + "',0,0,25,0)";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    UpdateRewardsPitchAdd(Convert.ToInt32(pitch.id));
                    return new Response { status = "200", message = "OK" };
                }

                else
                {
                    return new Response { status = "404", message = "Something Wrong happened" };
                }

            }
            catch (Exception ex)
            {
                return new Response { status = "401", message = ex.Message.ToString()};
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Returns all the pitches
        /// </summary>
        [Route("API/Application/GetPitches")]
        [HttpGet]
        public List<Pitch> GetAllPitches()
        {
            Applications app = new Applications();
            return app.getAllPitches();
        }

        [Route("API/Application/GetSavedPitches")]
        [HttpPost]
        public List<Pitch> GetSavedPitches(Pitch pitch1)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select SavedPitches.id,SavedPitches.PitchID,Pitch.PitchName,Pitch.Industry,Pitch.Budget,Pitch.IdealInvestorRole,Pitch.ManagementLocation,Pitch.Stage FROM SavedPitches,Pitch Where SavedPitches.PitchID=Pitch.PitchID and SavedPitches.UserID ='"+pitch1.id+"'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["id"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"]);
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        [Route("API/Application/ClaimRewards")]
        [HttpPost]
        public Response SaveCode(Coupon coupon)
        {
            string[] Rewards = { "20% OFF McDonalds Milkshake", "FREE McDonalds Coffee", "2 Chip Choc McDonalds Ice Cream" };
            //string inputString = Rewards.ToList().PickRandom();
            string sqlQuery = "";
            sqlQuery = "Insert into coupon(UserId,code,datetim,value) values('" + coupon.userId + "','" + SaveMD5.GetCoupon(5) + "','" + DateTime.Now.ToString("M/d/yyyy") + "','"+ Rewards.ToList().PickRandom() + "')";
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = sqlQuery;

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    UpdateNumberOfClaims(coupon.userId);
                    return new Response { message = "OK", status = "200" };
                }

                else
                {
                    return new Response { message = "Error", status = "400" };
                }

            }
            catch (Exception ex)
            {
                return new Response { message= ex.Message};
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        [Route("API/Application/GetRewardsList")]
        [HttpPost]
        public List<RewardsModel> GetUserRewards(RewardsUser rewardsUser)
        {
            List<RewardsModel> rewards = new List<RewardsModel>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select * from RewardsTable where UserId='"+rewardsUser.id+"'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                RewardsModel rewardsModel = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        rewardsModel = new RewardsModel();
                        rewardsModel.invest = Convert.ToInt32(dataReader["Invest"]);
                        rewardsModel.mobileXP = Convert.ToInt32(dataReader["MobileXP"]);
                        rewardsModel.registerXP = Convert.ToInt32(dataReader["RegisterXP"]);
                        rewardsModel.submitPitchXP = Convert.ToInt32(dataReader["SubmitPitch"]);
                        rewardsModel.reviewerXP = Convert.ToInt32(dataReader["ReviewPitch"]);
                        rewardsModel.progressXP = Convert.ToInt32(dataReader["PitchSuccess"]);
                        rewardsModel.isClaimed = Convert.ToInt32(dataReader["isClaimed"]);
                        rewards.Add(rewardsModel);
                    }
                    return rewards;
                }
                else
                {
                    return new List<RewardsModel>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        [Route("API/Application/GetPitchesNotReviewedByCategory")]
        [HttpPost]
        public List<Pitch> GetAllPitchesNotReviewedByCAtegory(Pitch p)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=0 and Industry='" + p.Industry+"'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        [Route("API/Application/GetPitchesNotReviewedByLocation")]
        [HttpPost]
        public List<Pitch> GetAllPitchesNotReviewedByLocation(Pitch p)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=0 and ManagementLocation='" + p.ManagementLocation + "'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        /// <summary>
        /// Returns all the pitches that have not been reviewed
        /// </summary>
        [Route("API/Application/GetPitchesNotReviewed")]
        [HttpGet]
        public List<Pitch> GetAllPitchesNotReviewed()
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=0";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        /// <summary>
        /// Adds investor requirements
        /// </summary>
        /// <param name="requirements">The Json parameter sent from the client.</param>
        [Route("API/Application/AddInvestorRequirements")]
        [HttpPost]
        public Response AddRequirements(Requirements requirements)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try

            {
                sql = connection.CreateCommand();
                sql.CommandText = "Insert into Investor (ProjectGroup,Budget,MaximumAmount,Stage,Location,UserId) Values('" + requirements.ProjectGroup + "','" + requirements.Budget + "','" + requirements.MaximumAmount + "','" + requirements.Stage + "','" + requirements.Location + "','" + requirements.ID + "')";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                    return new Response { status = "200", message = "OK" };
                else
                    return null;
            }
            catch (Exception)
            {
                return new Response { status = "401", message = "Requirements not added" };
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Returns requirements for a particular project
        /// </summary>
        /// <param name="requirements">The Json parameter sent from the client.</param>
        [Route("API/Application/GetInvestorRequirements")]
        [HttpPost]
        public List<Requirements> GetAllRequirementsByProject(Requirements requirements)
        {
            List<Requirements> AllRequirements = new List<Requirements>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select Users.FullName, Investor.ProjectGroup,Investor.Budget, Investor.MaximumAmount, Investor.Stage, Investor.Location From Users Join Investor On Investor.ProjectGroup='" + requirements.ProjectGroup + "' Where Users.UserId = Investor.UserId";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Requirements req = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        req = new Requirements();
                        req.FirstName = dataReader["FullName"].ToString();
                        req.ProjectGroup = dataReader["ProjectGroup"].ToString();
                        req.Budget = Convert.ToDouble(dataReader["Budget"]);
                        req.MaximumAmount = Convert.ToDouble(dataReader["MaximumAmount"]);
                        req.Stage = dataReader["Stage"].ToString();
                        req.Location = dataReader["Location"].ToString();

                        AllRequirements.Add(req);
                    }
                    return AllRequirements;
                }
                else
                    return new List<Requirements>();

            }
            catch (Exception)
            {
                throw;

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

        /// <summary>
        /// Allows an Investor to add meeting details
        /// </summary>
        [Route("API/Application/AddMeetingDetails")]
        [HttpPost]
        public Response AddMeetingDetails(Meeting meeting)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Insert into MeetingDetails(PitchID,InterviewDate,InterviewTime,InterviewRoom,isSuccess,UserId,InvestorMessage) Values('" + meeting.PitchID + "','" + meeting.InterviewDate + "','" + meeting.InterviewTime + "','" + meeting.InterviewRoom + "','" + meeting.isCompleted + "','" + meeting.UserId + "','" + meeting.TextMessage + "')";
                int row = sql.ExecuteNonQuery();

                if (row > 0)
                    return new Response { status = "200", message = "OK" };
                else
                    return new Response { status = "401", message = "Could not add detaials" };
            }
            catch (Exception ex)
            {
                return new Response { status = "401", message = ex.Message.ToString() };
                throw;
            }
            finally
            {

                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

        [Route("API/Application/GetMeetingPitches")]
        [HttpPost]
        public List<Pitch> GetMeetingPitches(Pitch pitch1)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            sql = connection.CreateCommand();
            sql.CommandText = "Select Pitch.PitchID, Pitch.PitchName,Pitch.Industry,Pitch.Budget,Pitch.Stage,Pitch.ManagementLocation,Pitch.IdealInvestorRole FROM Pitch,MeetingDetails WHERE Pitch.PitchID=MeetingDetails.PitchID AND MeetingDetails.UserId='"+pitch1.id+"'";
            Pitch pitch = null;
            MySqlDataReader dataReader = sql.ExecuteReader();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    pitch = new Pitch();
                    pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                    pitch.PitchName = dataReader["PitchName"].ToString();
                    pitch.Industry = dataReader["Industry"].ToString();
                    pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                    pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                    pitch.Stage = dataReader["Stage"].ToString();
                    pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                    pitches.Add(pitch);
                }
                return pitches;
            }
            else
            {
                return new List<Pitch>();
            }
        }
        /// <summary>
        /// Returns meeting details
        /// </summary>
        [Route("API/Application/GetMeetingDetails")]
        [HttpPost]
        public List<Meeting> GetMeetingDetails(Pitch pitch)
        {
            List<Meeting> MeetingDetails = new List<Meeting>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "select * from MeetingDetails where PitchID='" + pitch.PitchID + "'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Meeting meeting = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        meeting = new Meeting();
                        meeting.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        meeting.UserId = Convert.ToInt32(dataReader["UserId"]);
                        meeting.InterviewDate = dataReader["InterviewDate"].ToString();
                        meeting.InterviewRoom = dataReader["InterviewRoom"].ToString();
                        meeting.InterviewTime = dataReader["InterviewTime"].ToString();
                        meeting.InvestorMessage = dataReader["InvestorMessage"].ToString();

                        MeetingDetails.Add(meeting);
                    }

                    return MeetingDetails;
                }
                else
                {
                    return new List<Meeting>();
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }


        /// <summary>
        /// Returns meeting details
        /// </summary>
        [Route("API/Application/GetMeetingDetailsForInvestor")]
        [HttpPost]
        public List<Meeting> GetMeetingDetailsForInvestor(Pitch pitch)
        {
            List<Meeting> MeetingDetails = new List<Meeting>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "select * from MeetingDetails where PitchID='" + pitch.PitchID + "' and  UserId='"+pitch.id+"'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Meeting meeting = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        meeting = new Meeting();
                        meeting.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        meeting.UserId = Convert.ToInt32(dataReader["UserId"]);
                        meeting.InterviewDate = dataReader["InterviewDate"].ToString();
                        meeting.InterviewRoom = dataReader["InterviewRoom"].ToString();
                        meeting.InterviewTime = dataReader["InterviewTime"].ToString();
                        meeting.InvestorMessage = dataReader["InvestorMessage"].ToString();

                        MeetingDetails.Add(meeting);
                    }

                    return MeetingDetails;
                }
                else
                {
                    return new List<Meeting>();
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Returns all the pitches that have been reviewed
        /// </summary>
        [Route("API/Application/GetPitchesReviewed")]
        [HttpGet]
        public List<Pitch> GetAllPitchesReviewed()
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=1";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }
        [Route("API/Application/GetPitchesReviewedByCategory")]
        [HttpPost]
        public List<Pitch> GetAllPitchesReviewedByCategory(Pitch p)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=1 and Industry='" + p.Industry+"'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        [Route("API/Application/GetPitchesReviewedByLocation")]
        [HttpPost]
        public List<Pitch> GetAllPitchesReviewedByLocation(Pitch p)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=1 and ManagementLocation='" + p.ManagementLocation + "'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        /// <summary>
        /// Checks the progress of the pitch
        /// </summary>
        [Route("API/Application/GetProgress")]
        [HttpPost]
        public List<Progress> GetPitchProgress(Pitch pitch)
        {

            List<Progress> progresses = new List<Progress>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select Pitch.DeliveryMessage, Pitch.ReviewerMessage From Pitch Where Pitch.PitchID='" + pitch.PitchID + "'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Progress progress = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        progress = new Progress();
                        progress.TextMessage = dataReader["DeliveryMessage"].ToString();
                        progress.ReviewerMessage = dataReader["ReviewerMessage"].ToString();

                        progresses.Add(progress);
                    }
                    return progresses;
                }
                else
                {
                    return new List<Progress>();
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
            }
        /// <summary>
        /// Adds pitches that the investor wants under his belt
        /// </summary>
        [Route("API/Application/ChoosePitch")]
        [HttpPost]
        public Response SavePitch(Communication communication)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {

                sql = connection.CreateCommand();
                sql.CommandText = "Insert into SavedPitches (PitchID,UserID) Values('" + communication.PitchID + "','" + communication.UserId + "')";
                int row = sql.ExecuteNonQuery();

                if (row > 0)
                    return new Response { status = "200", message = "OK" };
                else
                    return null;


            }
            catch (Exception)
            {
                //return new Response { status = "401", message = "No pitch chosen" };
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Returns all the Innovator pithes
        /// </summary>
        [Route("API/Application/GetUsersPitch")]
        [HttpPost]
        public List<Pitch> GetAllPitchesForInnovator(Pitch p)
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where UserId='" + p.id + "'";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

        /// <summary>
        /// Returns all the pitches that have been reviewed and are successful
        /// </summary>
        [Route("API/Application/GetPitchesReviewedisSuccess")]
        [HttpGet]
        public List<Pitch> GetAllPitchesReviewedisSuccess()
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry,Budget,IdealInvestorRole,Stage,ManagementLocation FROM Pitch Where isReviewed=1 and isSuccess=1";
                MySqlDataReader dataReader = sql.ExecuteReader();
                Pitch pitch = null;
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        pitch = new Pitch();
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"].ToString());
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }

            }
            catch (Exception)
            {
                throw;

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Looks up for a pitch with a matching ID and returns it
        /// </summary>
        /// <param name="p">The ID of the data.</param>
        [Route("API/Application/GetPitchById")]
        [HttpPost]
        public List<Pitch> GetPitchById(Pitch p)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select * FROM Pitch WHERE PitchID='" + p.PitchID + "'";
                Pitch pitch = new Pitch();
                List<Pitch> pitches = new List<Pitch>();
                MySqlDataReader dataReader = sql.ExecuteReader();
                if (dataReader.HasRows)
                {

                    while (dataReader.Read())
                    {
                        pitch.id = Convert.ToInt32(dataReader["UserId"]);
                        pitch.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        pitch.PitchName = dataReader["PitchName"].ToString();
                        pitch.ManagementLocation = dataReader["ManagementLocation"].ToString();
                        pitch.Industry = dataReader["Industry"].ToString();
                        pitch.Stage = dataReader["Stage"].ToString();
                        pitch.IdealInvestorRole = dataReader["IdealInvestorRole"].ToString();
                        pitch.Budget = Convert.ToDouble(dataReader["Budget"]);
                        pitch.MinimumInvestmentPerInvestor = Convert.ToDouble(dataReader["MinimumInvestmentPerInvestor"]);
                        pitch.MaximumInvestmentPerInvestor = Convert.ToDouble(dataReader["MaximumInvestmentPerInvestor"]);
                        pitch.PreviousRoundRaise = Convert.ToDouble(dataReader["PreviousRoundRaise"]);
                        pitch.ShortSummary = dataReader["ShortSummary"].ToString();
                        pitch.TheBusiness = dataReader["TheBusiness"].ToString();
                        pitch.TheMarket = dataReader["TheMarket"].ToString();
                        pitch.ProgressProof = dataReader["ProgressProof"].ToString();
                        pitch.Objectives = dataReader["Objectives"].ToString();
                        pitch.VideoLink = dataReader["VideoURLLink"].ToString();
                        pitches.Add(pitch);
                    }
                    return pitches;
                }
                else
                {
                    return new List<Pitch>();
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        private int getPitchPoints(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select SubmitPitch from RewardsTable where UserId='" + id + "'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        points = Convert.ToInt32(reader["SubmitPitch"]);
                    }
                    return points;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private int getReviewPoints(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select ReviewPitch from RewardsTable where UserId='" + id + "'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        points = Convert.ToInt32(reader["ReviewPitch"]);
                    }
                    return points;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private int getInvestPoints (int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select Invest from RewardsTable where UserId='" + id + "'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        points = Convert.ToInt32(reader["Invest"]);
                    }
                    return points;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private int getSuccessPoints (int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select PitchSuccess from RewardsTable where UserId='" + id + "'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        points = Convert.ToInt32(reader["PitchSuccess"]);
                    }
                    return points;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private int GetUserIdByPitch(int pitchId)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int userId = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId from Pitch where PitchID='" + pitchId+"'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userId = Convert.ToInt32(reader["UserId"]);
                    }
                    return userId;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private void UpdateReviewerPoints(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            int points = getReviewPoints(id);
            int newPoints = points + 25;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update RewardsTable set ReviewPitch = '"+newPoints+"' where UserId='" + id + "'";
                sql.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private void UpdateInnovatorPoints(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            int points = getSuccessPoints(id);
            int newPoints = points + 25;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update RewardsTable set PitchSuccess = '"+newPoints+"' where UserId='" + id + "'";
                sql.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private void UpdateInvestorPoints(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            int points = getInvestPoints(id);
            int newPoints = points + 25;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update RewardsTable set Invest = '"+newPoints+"' where UserId='" + id + "'";
                sql.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private int getNumberOfClaims(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select isClaimed from RewardsTable where UserId='" + id + "'";
                MySqlDataReader reader = sql.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        points = Convert.ToInt32(reader["isClaimed"]);
                    }
                    return points;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }
        private void UpdateNumberOfClaims(int id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int points = getNumberOfClaims(id);
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update RewardsTable set isClaimed ='"+points+1+"' where UserId='" + id + "'";
                sql.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Looks up for a pitch with a matching ID and Updates the reviewer decision it
        /// </summary>
        /// <param name="pitch">The Json parameter sent from the client.</param>
        [Route("API/Application/UpdatePitchDecision")]
        [HttpPost]
        public Response UpdatePitchDecision(Pitch pitch)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int progressXP = 0;

            try
            {
                if (pitch.isSuccess == 0)
                {
                    progressXP = 0;
                }
                else
                {
                    progressXP = 25;
                }
                sql = connection.CreateCommand();
                sql.CommandText = "UPDATE Pitch SET isReviewed =1,isSuccess='" + pitch.isSuccess + "',ReviewerMessage='" + pitch.ReviewerMessage + "',ReviewerId='"+pitch.id+"',ReviewerXP=25,ProgressXP='"+progressXP+"' Where PitchID ='" + pitch.PitchID + "'";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    int userId = GetUserIdByPitch(Convert.ToInt32(pitch.PitchID));
                    UpdateReviewerPoints(Convert.ToInt32(pitch.userId));
                    UpdateInnovatorPoints(userId);
                    return new Response { status = "201", message = "Pitch descion captured" };
                }
                else
                {
                    return new Response { status = "400", message = "Something wrong happend" };
                }

            }
            catch (Exception)
            {
                return new Response { status = "401", message = "Error Encountered" };
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }


        /// <summary>
        /// Investor places bids
        /// </summary>
        ///  /// <param name="pitch">The Json parameter sent from the client.</param>
        [Route("API/Application/BidEquity")]
        [HttpPost]
        public Response InvestorBid(BidEquity bid)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Insert into BidEquity (PitchID,InvestorUserID,Investorfunds,Investorpercentage,Innovatorfunds,Innovatorpercentage,isComplete,isAccepted,isRejected,InvestorMessage,InnovatorMessage,InvestorXP) Values('" + bid.pitchId + "','"+bid.InvestorUserID+"','" + bid.Investorfunds + "','" + bid.Investorpercentage + "',0,0,0,0,0,'" + bid.InvestorMessage + "','" + "N/A" + "',0)";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                    return new Response { status = "200", message = "OK" };
                else
                    return null;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

        }

        /// <summary>
        /// Innovator updates his decisions
        /// </summary>
        /// <param name="bidEquity">The Json parameter sent from the client.</param>
        [Route("API/Application/UpdateInnovatorDecision")]
        [HttpPost]
        public Response UpdateInnovatorDecision(BidEquity bidEquity)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update BidEquity set isAccepted='" + bidEquity.isAccepted + "',isRejected='" + bidEquity.isRejected + "',isComplete=1,InvestorXP=25 where PitchID='" + bidEquity.pitchId + "' and InvestorUserID='"+bidEquity.InvestorUserID+"'";
                int row = sql.ExecuteNonQuery();
                if(row > 0)
                {
                    int userId = GetUserIdByPitch(bidEquity.pitchId);
                    UpdateInvestorPoints(bidEquity.InvestorUserID);
                    UpdateInvestorPoints(userId);
                }
                return new Response { status = "201", message = "Pitch descion captured" };
            }
            catch (Exception)
            {
                return new Response { status = "401", message = "Something wrong happened" };
                throw;

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Innovator counter the offered bid
        /// </summary>
        /// <param name="bidEquity">The Json parameter sent from the client.</param>
        [Route("API/Application/CounterOffer")]
        [HttpPost]
        public Response InnovatorCounterOffer(BidEquity bidEquity)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Update BidEquity set Innovatorfunds='" + bidEquity.Innovatorfunds + "',Innovatorpercentage='" + bidEquity.Innovatorpercentage + "',InnovatorMessage='"+bidEquity.InnovatorMessage+"' where PitchID='" + bidEquity.pitchId + "' and InvestorUserID='"+bidEquity.InvestorUserID+"'";
                
                int row =sql.ExecuteNonQuery();
                if(row > 0)
                {
                    return new Response { status = "201", message = "Counter Accepted" };
                }
                else
                {
                    return new Response { status = "201", message = "Did  not Accept" };
                }
            }
            catch (Exception)
            {
                return new Response { status = "401", message = "Something wrong happened" };
                throw;

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        [Route("API/Application/GetBidDetails")]
        [HttpPost]
        public List<BidEquity> bids (BidEquity bidEquity)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select * from BidEquity Where PitchID='" + bidEquity.pitchId + "'";
                BidEquity bid = new BidEquity();
                List<BidEquity> bidEquities = new List<BidEquity>();
                MySqlDataReader dataReader = sql.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        bid.pitchId = Convert.ToInt32(dataReader["PitchID"]);
                        bid.InvestorUserID = Convert.ToInt32(dataReader["InvestorUserID"]);
                        bid.Innovatorfunds = Convert.ToDouble(dataReader["Innovatorfunds"]);
                        bid.InnovatorMessage = dataReader["Innovatormessage"].ToString();
                        bid.Innovatorpercentage = Convert.ToDouble(dataReader["Innovatorpercentage"]);
                        bid.Investorfunds = Convert.ToDouble(dataReader["Investorfunds"]);
                        bid.InvestorMessage = dataReader["Investormessage"].ToString();
                        bid.Investorpercentage = Convert.ToDouble(dataReader["Investorpercentage"]);
                        bid.isAccepted = Convert.ToInt32(dataReader["isAccepted"]);
                        bid.isRejected = Convert.ToInt32(dataReader["isRejected"]);
                        bid.isComplete = Convert.ToInt32(dataReader["isComplete"]);

                        bidEquities.Add(bid);
                    }
                    return bidEquities;
                }
                else
                {
                    return new List<BidEquity>();
                }
            }
            catch(Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        [Route("API/Application/GetBidDetailsForInvestor")]
        [HttpPost] 
        public List<BidEquity> bidsForInvestor(BidEquity bidEquity)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select * from BidEquity Where PitchID='" + bidEquity.pitchId + "' and InvestorUserID='"+bidEquity.InvestorUserID+"'";
                BidEquity bid = new BidEquity();
                List<BidEquity> bidEquities = new List<BidEquity>();
                MySqlDataReader dataReader = sql.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        bid.pitchId = Convert.ToInt32(dataReader["PitchID"]);
                        bid.InvestorUserID = Convert.ToInt32(dataReader["InvestorUserID"]);
                        bid.Innovatorfunds = Convert.ToDouble(dataReader["Innovatorfunds"]);
                        bid.InnovatorMessage = dataReader["Innovatormessage"].ToString();
                        bid.Innovatorpercentage = Convert.ToDouble(dataReader["Innovatorpercentage"]);
                        bid.Investorfunds = Convert.ToDouble(dataReader["Investorfunds"]);
                        bid.InvestorMessage = dataReader["Investormessage"].ToString();
                        bid.Investorpercentage = Convert.ToDouble(dataReader["Investorpercentage"]);
                        bid.isAccepted = Convert.ToInt32(dataReader["isAccepted"]);
                        bid.isRejected = Convert.ToInt32(dataReader["isRejected"]);
                        bid.isComplete = Convert.ToInt32(dataReader["isComplete"]);

                        bidEquities.Add(bid);
                    }
                    return bidEquities;
                }
                else
                {
                    return new List<BidEquity>();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// Looks up for a pitch with a matching ID and Updates the reviewer decision it
        /// </summary>
        /// <param name="pitch">The Json parameter sent from the client.</param>
        [Route("API/Application/InvestorUpdateBid")]
        [HttpPost]
        public Response InvestorBidUpdate(BidEquity bid)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "UPDATE BidEquity SET Investorfunds ='" + bid.Investorfunds + "',Investorpercentage ='" + bid.Investorpercentage + "',InvestorMessage ='" + bid.InvestorMessage + "' Where PitchID ='" + bid.pitchId + "' and InvestorUserID='"+bid.InvestorUserID+"'";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    return new Response { status = "201", message = "Bid Sent" };
                }
                else
                {
                    return new Response { status = "400", message = "Something wrong happend" };
                }

            }
            catch (Exception)
            {
                return new Response { status = "401", message = "Error Encountered" };
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

        /// <summary>
        /// Looks up for a pitch with a matching ID and deletes it
        /// </summary>
        /// <param name="pitch">The ID of the data.</param>
        [Route("API/Application/DeletePitch")]
        [HttpDelete]
        public Response DeleteSelectedPitch(Pitch pitch)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Delete from Pitch Where PitchID='" + pitch.PitchID + "'";
                int rows = sql.ExecuteNonQuery();
                if (rows > 0)
                {
                    return new Response { status = "202", message = "Pitch Deleted" };
                }
                else
                {
                    return new Response { status = "400", message = "Something wrong happend" };
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

        /// <summary>
        /// Returns the progress of the application
        /// </summary>
        [Route("API/Application/TrackProgress")]
        [HttpPost]
        public List<Progress> TrackProgress(Progress progress)
        {
            List<Progress> progresses = new List<Progress>();
            Progress progress1 = new Progress();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select Pitch.ReviewerMessage, communication.TextMessage, communication.InterviewDate,communication.InterviewTime,communication.InterviewVenue,communication.addressVenue, communication.PitchID from Pitch join communication on Pitch.PitchID = communication.PitchID where Pitch.PitchID ='" + progress.PitchID + "'";

                MySqlDataReader dataReader = sql.ExecuteReader();
                if (dataReader.HasRows)
                {

                    while (dataReader.Read())
                    {
                        progress1.PitchID = Convert.ToInt32(dataReader["PitchID"]);
                        progress1.ReviewerMessage = dataReader["ReviewerMessage"].ToString();
                        progress1.TextMessage = dataReader["TextMessage"].ToString();
                        progress1.InterviewDate = dataReader["InterviewDate"].ToString();
                        progress1.InterviewTime = dataReader["InterviewTime"].ToString();
                        progress1.addressVenue = dataReader["addressVenue"].ToString();

                        progresses.Add(progress1);
                    }
                    return progresses;
                }
                else
                {
                    return new List<Progress>();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }


        }

    }
}
