using MEEKAPI.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace MEEKAPI.DOA.Application
{
    public class Applications
    {
        public void addRewards(Pitch pitch)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry FROM Pitch";
                MySqlDataReader dataReader = sql.ExecuteReader();
              
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                      
                    }
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

        public List<Pitch> getAllPitches()
        {
            List<Pitch> pitches = new List<Pitch>();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Mysql"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            MySqlCommand sql;
            connection.Open();

            try
            {
                sql = connection.CreateCommand();
                sql.CommandText = "Select UserId,PitchID,PitchName,Industry FROM Pitch";
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
    }
}