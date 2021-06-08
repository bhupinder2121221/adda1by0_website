using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Threading;
using System.Collections;

namespace add1By0
{
    public partial class setLiveStreaming : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        public string userEmail = "";
        public string topicName = "";
        public string status = "";

        
        protected void Page_Load(object sender, EventArgs e)
        {
            userEmail = Request.QueryString["Name"];
            topicName = Request.QueryString["topicName"];
            status = Request.QueryString["status"];
            if (status == "student")
            {
                admin_vision.Visible = true;
            }
            else
            {
                admin_vision.Visible = true;
            }

            if (status == "student")
            {
                bool found = false;
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".registration where email='" + userEmail+"';", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    found = true;
                }
                rdr.Close();
                conn.Close();
                if (!found)
                {
                    Response.Redirect("web_pages/courses.aspx?Name=" + userEmail + "&postback=true&signin=required");
                }
            }
            else
            {
                bool found = false;
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".login_admins where email='" + userEmail + "';", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    found = true;
                }
                rdr.Close();
                conn.Close();
                if (!found)
                {
                    Response.Redirect("web_pages/courses.aspx?Name=" + userEmail + "&postback=true&signin=required");
                }

                close.Visible = true;

            }


            
        }

        protected void close_Click(object sender, EventArgs e)
        {

            
                if (status != "student")
                {
                    bool closeClass = false;
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".login_admins where email='" + userEmail + "';", conn);
                    var rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        closeClass = true;
                    }
                    rdr.Close();
                    if (closeClass)
                    {
                        cmd = new MySqlCommand("delete from "+ adda1by0_databasename + ".courses where CourseName='" + topicName + "';", conn);
                        cmd.ExecuteNonQuery();

                    }
                    conn.Close();

                Response.Redirect("web_pages/courses.aspx?Name=" + userEmail + "&signin=required");
            }
            }
        
    }
}