﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DAO
{
    internal class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }
        private AccountDAO() { }
        public bool Login(string userName, string passWord)
        {
            string query = "USP_Login @userName , @passWord ";//nhớ cách userName 
            //object[] parameters = new object[] { userName, passWord };
            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] {userName,passWord});
            //DataTable result = dataTable;

            return result.Rows.Count > 0;
        }
    }

}
