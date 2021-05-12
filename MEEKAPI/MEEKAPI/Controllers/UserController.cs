using MEEKAPI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using System.Web.Http.Cors;
using System.Net.Mail;

namespace MEEKAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController
    {

        private int GetUserId(string email,string password)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            int userId = 0;
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,FullName,Role,Email From Users WHERE Email='" + email + "'and Password='" + SaveMD5.HashPassword(password) + "'";
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
        [Route("API/User/UserRegistration")]
        [HttpPost]
        public Response AddUser(Registration register)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "INSERT INTO Users(FullName,Email,Password,Role,Cell_Number,IDNumber,Province,City,Street,ZipCode,isActive,YearDOB,DateMonth,onMobile,isDetails,registerXP,mobileXP) Values('" + register.FullName+"','"+ register.Email+"','"+ SaveMD5.HashPassword
                    (register.Password)+"','"+ register.Role+ "','Unknown','Unknown','Unknown','Unknown','Unknown','Unknown',1,'Unknown','Unknown',0,0,25,25)";
                 int row = sql.ExecuteNonQuery();
                if (row > 0)
                {
                    int userId = GetUserId(register.Email, register.Password);
                    AddRewards(userId);
                }
                return new Response { status = "200", message = "OK" };
            }
            catch (Exception ex)
            {
                return new Response { status = "401", message = ex.Message.ToString() };
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        private void AddRewards(int logged)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Insert into RewardsTable (UserId,RegisterXP,MobileXP,SubmitPitch,ReviewPitch,Invest,PitchSuccess,isClaimed) values('" +logged + "',25,0,0,0,0,0,0)";
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

        [Route("API/User/UserLogin")]
        [HttpPost]
        public List<LoggedIn> Login(Login user)
        {
            List<LoggedIn> loggedIns = new List<LoggedIn>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,FullName,Role,Email From Users WHERE Email='" + user.Email + "'and Password='" + SaveMD5.HashPassword(user.Password) + "'";
                LoggedIn logged = null;
                MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        logged = new LoggedIn();
                        logged.id = Convert.ToInt32(reader["UserId"]);
                        logged.usertype = reader["Role"].ToString();
                        logged.surname = reader["FullName"].ToString();
                        logged.email = reader["Email"].ToString();
                        loggedIns.Add(logged);
                    }
                    return loggedIns;
                }
                else
                {
                    return new List<LoggedIn>();
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

        [Route("API/User/GetUserDetails")]
        [HttpPost]
        public List<User> GetUserDetails(User user)
        {
            List<User> loggedIns = new List<User>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select * From Users WHERE UserId='" + user.UserId+"'";
                User logged = null;
                MySqlDataReader reader = sql.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        logged = new User();
                        logged.UserId = Convert.ToInt32(reader["UserId"]);
                        logged.Cell_Number = reader["Cell_Number"].ToString();
                        logged.FullName = reader["FullName"].ToString();
                        logged.Email = reader["Email"].ToString();
                        logged.IDNumber = reader["IDNumber"].ToString();
                        logged.Province = reader["Province"].ToString();
                        logged.City = reader["City"].ToString();
                        logged.Street = reader["Street"].ToString();
                        logged.ZipCode = reader["ZipCode"].ToString();
                        loggedIns.Add(logged);
                    }

                    return loggedIns;
                }
                else
                {
                    return new List<User>();
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
        [Route("API/User/UpdateUserDetails")]
        [HttpPost]
        public Response UpdateUserDetails(User user)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();
            

            try
            {
                
                sql = connection.CreateCommand();
                sql.CommandText = "UPDATE Users SET FullName='" + user.FullName+ "',Email='" + user.Email+ "',IDNumber='" + user.IDNumber+ "',Province='" +user.Province + "',City='" +user.City + "',Street='" +user.Street + "',ZipCode='" + user.ZipCode+"' Where UserId ='" + user.UserId + "'";

                int row = sql.ExecuteNonQuery();

                if (row > 0)
                {
                    return new Response { status = "201", message = "OK" };
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

        [Route("API/User/Contact")]
        [HttpPost]
        public Response SendQuery(Contact contact)
        {
            string MyAddress = "MeekInvestment2020@gmail.com";
            string YourAddress = contact.Email;
            string myPassword = "2t&O4iGdAtf!";
            string sub = contact.subject;
            string body = "From: " + contact.name + "\n";
            body += "Message: \n" + contact.message + "\n";
            body += "Reply To: " + contact.Email + "\n";
            var smtpMail = new SmtpClient();
            {
                smtpMail.Host = "smtp.gmail.com";
                smtpMail.Port = 587;
                smtpMail.EnableSsl = true;
                smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpMail.Credentials = new NetworkCredential(MyAddress, myPassword);
                smtpMail.Timeout = 30000;
            }
            smtpMail.Send(YourAddress, MyAddress, sub, body);

            return new Response { status = "200", message = "Query logged" };
        }

    }
}
