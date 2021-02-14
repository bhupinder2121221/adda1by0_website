using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;


namespace add1By0.web_pages
{
    public partial class sponsership : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        public ArrayList namesOfSponsers = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from adda1by0.sponsership;", conn);
            var rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                namesOfSponsers.Add(rdr["Names"].ToString());
            }
            conn.Close();
        }
    }
}