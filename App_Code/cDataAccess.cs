using System;
using System.Data;
using System.Data.SqlClient; // Replace with the appropriate data provider for your database

namespace SampleVinithApplication
{
    public class DataAccess
    {
        private string connectionString; // Your database connection string

        public DataAccess(string connectionString)
        {
            this.connectionString = connectionString;
        }
        public DataAccess()
        {
        }

        public DataSet GetDataSet(string query)
        {
            DataSet dataSet = new DataSet();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    adapter.Fill(dataSet);
                }
            }

            return dataSet;
        }
    }

    public class a
    {
        DataAccess s = new DataAccess();
    }
}
