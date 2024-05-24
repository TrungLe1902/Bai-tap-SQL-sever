using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace QuanLyCafe.DTO
{
    public class Bill
    {
        public Bill(int id,DateTime? dateCheckin,DateTime? dateCheckOut, int status)
        {
            this.iD = id;
            this. DateCheckIn = dateCheckin;
            this.DateCheckOut = dateCheckOut;
            this.Status = status;
        }

        public Bill(DataRow row) 
        {
            this.ID = (int)row["id"];
            this.DateCheckIn = (DateTime?)row["dateCheckIn"];
            var datecheckOutTemp = row["dateCheckOut"];
            if (datecheckOutTemp.ToString() != " ") //kiểm tra kq có bị null
            this.DateCheckOut = (DateTime?)datecheckOutTemp;
            this.Status = (int)row ["status"];
        }
        private int status;
        public int Status
        {
            get { return status; }
            set { status = value; }
        }

        private DateTime? dateCheckOut;
        public DateTime? DateCheckOut
        {
            get { return dateCheckOut; }
            set { dateCheckOut = value; }
        }

        private DateTime? dateCheckIn;
        public DateTime? DateCheckIn
        {
            get { return dateCheckIn; }
            set { dateCheckIn = value; }
        }
        
        private int iD;
        public int ID
        {
            get { return iD;}
            set { iD = value; }
        }
    }
}
