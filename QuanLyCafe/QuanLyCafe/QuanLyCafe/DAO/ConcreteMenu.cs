using System.Data;
using System.Windows.Forms;

namespace QuanLyCafe.DAO
{
    public class Menu
    {
        public string Name { get; set; }
        public int Count { get; set; }
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }
        public object FoodName { get; internal set; }

        public Menu(DataRow item)
        {
            this.Name = item["name"].ToString();
            this.Count = (int)item["count"];
            this.Price = (decimal)item["price"];
            this.TotalPrice = (decimal)item["totalPrice"];
        }
    }
} 