using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;

namespace add1By0.web_pages
{
    public partial class aboutPage : System.Web.UI.Page
    {
        public ArrayList questionsFAQ = new ArrayList();
        public ArrayList answersFAQ = new ArrayList();
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(" select * from adda1by0.questions_in_about;", conn);
            var rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                questionsFAQ.Add(rdr["question"].ToString());
                answersFAQ.Add(rdr["answer"].ToString());
            }
            rdr.Close();
            conn.Close();
        }
    }
}