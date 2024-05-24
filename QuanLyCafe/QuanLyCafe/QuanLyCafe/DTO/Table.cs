using System;
using System.Data;

namespace QuanLyCafe.DTO
{
    public class Table  // Make sure this class is public
    {
        public Table(int id, string name, string status)
        {
            this.ID = id;
            this.Name = name;
            this.Status = status;
        }

        public Table(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Name = row["name"].ToString();
            this.Status = row["status"].ToString();
        }

        public string Status { get; set; }
        public string Name { get; set; }
        public int ID { get; set; }
    }
}