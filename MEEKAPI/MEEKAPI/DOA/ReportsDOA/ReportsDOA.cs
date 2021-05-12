using MEEKAPI.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace MEEKAPI.DOA.ReportsDOA
{
    public class ReportsDOA
    {
        public List<Current> getSubmittedPitchesByProvince()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.ManagementLocation, count(Pitch.ManagementLocation) from Pitch GROUP By Pitch.ManagementLocation";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch =  new Current();
                        pitch.ManagementLocation = reader["ManagementLocation"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.ManagementLocation)"]);
                        pitches.Add(pitch);    
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
            }
            catch(Exception ex)
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
        public List<Current> getSubmittedPitchesByIndustry()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.Industry, count(Pitch.Industry) from Pitch GROUP By Pitch.Industry";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.Industry = reader["Industry"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.Industry)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
        public List<Current> getSuccesfulPitchByIndustry()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.Industry, count(Pitch.Industry) from Pitch WHERE isSuccess=1 GROUP By Pitch.Industry";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.Industry = reader["Industry"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.Industry)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
        public List<Current> getSuccesfulPitchByLocation()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.ManagementLocation, count(Pitch.ManagementLocation) from Pitch WHERE isSuccess=1 GROUP By Pitch.ManagementLocation";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.Industry = reader["ManagementLocation"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.ManagementLocation)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
        public List<Current> getSuccesfulPitchForInvestorByLocation()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.ManagementLocation, count(Pitch.ManagementLocation) from Pitch,BidEquity WHERE BidEquity.isAccepted=1 AND BidEquity.PitchID = Pitch.PitchID GROUP By Pitch.ManagementLocation";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.ManagementLocation = reader["ManagementLocation"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.ManagementLocation)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
        public List<Current> getSuccesfulPitchForInvestorByIndustry()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Pitch.Industry, count(Pitch.Industry) from Pitch,BidEquity WHERE BidEquity.isAccepted=1 AND BidEquity.PitchID = Pitch.PitchID GROUP By Pitch.Industry";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.Industry = reader["Industry"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Pitch.Industry)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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

        public List<Mobile> getAllUsers()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Mobile> pitches = new List<Mobile>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT COUNT(*) AS tot_users from Users";
                MySqlDataReader reader = sql.ExecuteReader();
                Mobile pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Mobile();
                        pitch.mobile = Convert.ToInt32(reader["tot_users"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Mobile>();
                }
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
        public List<Mobile> getAllReviewers()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Mobile> pitches = new List<Mobile>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Users.Role, count(Users.Role) from Users WHERE Users.Role='Reviewer'";
                MySqlDataReader reader = sql.ExecuteReader();
                Mobile pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Mobile();
                        pitch.mobile = Convert.ToInt32(reader["count(Users.Role)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Mobile>();
                }
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
        public List<Mobile> getAllPitches()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Mobile> pitches = new List<Mobile>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT COUNT(*) AS tot_pitches from Pitch";
                MySqlDataReader reader = sql.ExecuteReader();
                Mobile pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Mobile();
                        pitch.mobile = Convert.ToInt32(reader["tot_pitches"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Mobile>();
                }
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

        public List<Current> getAllUsersByLocation()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT Users.Province, count(Users.Province) from Users where Users.Role='Innovator' GROUP By Users.Province ";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.ManagementLocation = reader["Province"].ToString();
                        pitch.values = Convert.ToInt32(reader["count(Users.Province)"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
        public List<Current> getAllOnMobile()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            List<Current> pitches = new List<Current>();
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "SELECT count(*) as onMobile from Users where Users.onMobile=1";
                MySqlDataReader reader = sql.ExecuteReader();
                Current pitch = null;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pitch = new Current();
                        pitch.values = Convert.ToInt32(reader["onMobile"]);
                        pitches.Add(pitch);
                    }

                    return pitches;
                }
                else
                {
                    return new List<Current>();
                }
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
    }
}