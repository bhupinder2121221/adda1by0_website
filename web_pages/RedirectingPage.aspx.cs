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
    public partial class RedirectingPage : System.Web.UI.Page
    {
        string adda1by0_databasename = "db_a6f987_bhupind";
        public string namee = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string useremail = Request.QueryString["Name"];
            string status = "";
            string classs = Request.QueryString["class"];
            classs = "classes" + (Convert.ToInt32(classs) + 1);

            name.Text = useremail;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".registration where email='" + useremail + "';", conn);
            var rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                status = "student";
            }
            rdr.Close();
            if (status == "student")
            {
                Response.Redirect("classesPage.aspx?Name=" + useremail + "&status=" + status + "&class=" + classs);
            }
            else
            {
                MySqlCommand cmd1 = new MySqlCommand("select * from "+ adda1by0_databasename + ".login_admins where email='" + useremail + "';", conn);
                rdr = cmd1.ExecuteReader();
                while (rdr.Read())
                {
                    status = "admin";
                }
            }


            if (status == "")
            {
                Response.Redirect("courses.aspx?Name=" + useremail + "&postback=true");
            }
            else
            {
                Response.Redirect("classesPage.aspx?Name=" + useremail + "&status=" + status + "&class=" + classs);
            }

        }
    }
}