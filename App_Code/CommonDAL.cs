using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace SampleVinithApplication
{
    public class CommonDAL
    {

        SqlConnection connectionString = null;
        public CommonDAL()
        {
            connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        }

        #region"Declaration"

        DataSet ds;
        //DataAccess DAL;
        SqlCommand c;
        SqlDataAdapter adapter;

        #endregion

        #region"Properties"
        public int Id { get; set; }
        public string Name { get; set; }
        public int Pincode { get; set; }
        public DateTime Created_On { get; set; }
        #endregion

        #region"Common Methods"

        public DataSet InsertDistrict()
        {
            ds = new DataSet();
            try
            {
                c = new SqlCommand();
                c.CommandType = CommandType.StoredProcedure;
                c.CommandText = "InsertDistrict";
                c.Parameters.Add("@Id", Id);
                c.Parameters.Add("@Name", Name);
                c.Parameters.Add("@Pincode", Pincode);
                c.Connection = connectionString;
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(c);
                adp.Fill(dt);
                ds.Tables.Add(dt);
            }
            catch (Exception ex)
            {
                //Log.Information(ex.ToString());
            }
            return ds;
        }


        public DataSet GetDistrict()
        {
            ds = new DataSet();
            try
            {
                c = new SqlCommand();
                connectionString.Open();
                c.CommandType = CommandType.StoredProcedure;
                c.CommandText = "GetDistrict";
                c.Connection = connectionString;
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(c);
                adp.Fill(dt);
                ds.Tables.Add(dt);
            }
            catch (Exception ex)
            {
                //Log.Information(ex.ToString());
            }
            return ds;

        }
        public DataSet GetDistrictById()
        {
            ds = new DataSet();
            try
            {
                c = new SqlCommand();
                connectionString.Open();
                c.CommandType = CommandType.StoredProcedure;
                c.CommandText = "GetDistrictById";
                c.Parameters.Add("@Id", Id);
                c.Connection = connectionString;
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(c);
                adp.Fill(dt);
                ds.Tables.Add(dt);
            }
            catch (Exception ex)
            {
                //Log.Information(ex.ToString());
            }
            return ds;

        }
        public DataSet DeleteDistrictById()
        {
            ds = new DataSet();
            try
            {
                c = new SqlCommand();
                connectionString.Open();
                c.CommandType = CommandType.StoredProcedure;
                c.CommandText = "DeleteDistrictById";
                c.Parameters.Add("@Id", Id);
                c.Connection = connectionString;
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(c);
                adp.Fill(dt);
                ds.Tables.Add(dt);
            }
            catch (Exception ex)
            {
                //Log.Information(ex.ToString());
            }
            return ds;

        }
        #endregion
    }
}