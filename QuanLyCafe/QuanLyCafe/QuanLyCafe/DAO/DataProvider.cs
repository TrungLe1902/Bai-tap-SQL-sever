using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCafe.DAO
{
    public class DataProvider
    {   //Design patern Singleton tại 1 thời điểm 1 thể hiện tạo ra
        private static DataProvider instance;
        public static DataProvider Instance
        {
            get { if (instance == null) instance = new DataProvider(); return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        private DataProvider() { }
        private string connectionSTR = @"Data Source=DESKTOP-J6E5FOR;Initial Catalog=QuanLyQuanCafe;Integrated Security=True;TrustServerCertificate=True";

        public DataTable ExecuteQuery(string query, object[]parameter = null)
        {
            DataTable data = new DataTable();
            SqlConnection connection = new SqlConnection(connectionSTR) ;

            //try-catch-finally để xử lý ngoại lệ và đảm bảo kết nối được đóng ngay cả khi có lỗi.
            try
            {
                connection.Open(); // Mở kết nối
                SqlCommand command = new SqlCommand(query, connection);
                
                if(parameter != null )
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach ( string item in listPara ) 
                    {
                        if ( item.Contains("@") ) 
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(data); // Nạp dữ liệu vào DataTable
            }
            catch (SqlException ex)
            {
                MessageBox.Show("SQL Error: " + ex.Message);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close(); // Đảm bảo kết nối được đóng
                }
            }

            return data; // Luôn trả về DataTable, ngay cả khi có lỗi
        }

        internal int ExecuteNonQuery(string query)
        {
            throw new NotImplementedException();
        }
    }
}
