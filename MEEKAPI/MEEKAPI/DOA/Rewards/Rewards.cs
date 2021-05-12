using MEEKAPI.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace MEEKAPI.DOA.Rewards
{
    public class Rewards
    {
        public List<RewardsModel> getInnovatorRewards(PostRewards rewards)
        {
            string sqlQuery = "";
                sqlQuery = "SELECT Users.mobileXP,Users.registerXP,Pitch.SubmitPitchXP,Pitch.ProgressXP from Users Join Pitch On Users.UserId='" + rewards.userId+"' Where Users.UserId=Pitch.UserId";
                string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
                MySqlConnection connection = new MySqlConnection(ConnectionString);
                List<RewardsModel> rewardsModels = new List<RewardsModel>();
                RewardsModel model = null;
                MySqlCommand sql;
            ArrayList arra = new ArrayList();
                connection.Open();
            try
            {
                    sql = connection.CreateCommand();
                    sql.CommandText = sqlQuery;
                    MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        model = new RewardsModel();
                        model.mobileXP = Convert.ToInt32(reader["mobileXP"]);
                        model.registerXP = Convert.ToInt32(reader["registerXP"]);
                        model.submitPitchXP = Convert.ToInt32(reader["SubmitPitchXP"]);
                        model.progressXP = Convert.ToInt32(reader["ProgressXP"]);

                        rewardsModels.Add(model);
                    }
                    return rewardsModels;
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

        public List<RewardsModel> getInvestorRewards(PostRewards rewards)
        {
            string sqlQuery = "";
            sqlQuery = "SELECT Users.mobileXP,Users.registerXP,BidEquity.InvestorXP from Users,BidEquity where Users.UserId='"+rewards.userId+"' and Users.UserId=BidEquity.InvestorUserID";
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            List<RewardsModel> rewardsModels = new List<RewardsModel>();
            RewardsModel model = null;
            ArrayList arra = new ArrayList();
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = sqlQuery;
                MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        model = new RewardsModel();
                        model.mobileXP = Convert.ToInt32(reader["mobileXP"]);
                        model.registerXP = Convert.ToInt32(reader["registerXP"]);
                        model.investorXP = Convert.ToInt32(reader["InvestorXP"]);
                        rewardsModels.Add(model);
                    }
                    return rewardsModels;
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
        public List<RewardsModel> getReviewerRewards(PostRewards rewards)
        {
            string sqlQuery = "";
            sqlQuery = "SELECT Users.registerXP,Pitch.ReviewerXP from Users,Pitch where Users.UserId='"+rewards.userId+"' and Users.UserId=Pitch.ReviewerId";
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            List<RewardsModel> rewardsModels = new List<RewardsModel>();
            RewardsModel model = null;
            ArrayList arra = new ArrayList();
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = sqlQuery;
                MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        model = new RewardsModel();
                        model.registerXP = Convert.ToInt32(reader["registerXP"]);
                        model.reviewerXP = Convert.ToInt32(reader["ReviewerXP"]);

                        rewardsModels.Add(model);
                    }
                    return rewardsModels;
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

        public bool AddCouponCode(Coupon coupon)
        {
            string sqlQuery = "";
            sqlQuery = "Insert into coupon(UserId,code,datetim) values('"+coupon.userId+"','"+coupon.code+"','"+coupon.date+"')";
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            ArrayList arra = new ArrayList();
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = sqlQuery;

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    connection.Close();
                    return true;
                }

                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        public List<Coupon> getDetails(Coupon coupon)
        {
            string sqlQuery = "";
            sqlQuery = "select * from coupon where UserId='"+coupon.userId+"'";
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            List<Coupon> rewardsModels = new List<Coupon>();
            Coupon model = null;
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = sqlQuery;
                MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        model = new Coupon();
                        model.code = reader["code"].ToString();
                        model.date = reader["datetim"].ToString();
                        model.value = reader["value"].ToString();
                        rewardsModels.Add(model);
                    }
                    return rewardsModels;
                }
                else
                {
                    return new List<Coupon>();
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