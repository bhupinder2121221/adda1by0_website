using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace add1By0
{
    public partial class logout : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        void removePrevCookies()
        {
            HttpCookie temp = Request.Cookies["Adda1By0_cookies"];
            if (temp != null)
            {
                temp.Expires = DateTime.Now.AddSeconds(-10);
                Response.Cookies.Add(temp);
            }
            Session["adda_user_name"] = null;
            Session["adda_user_email"] = null;
            Session["adda_user_encription"] = null;
            Session["adda_login_as"] = null;

        }
        public void deleteallsessions()
        {
            if (Session["adda_user_email"] != null)
            {
                removePrevCookies();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var str = "";
            if (Session["adda_user_email"] != null)
            {
                str = Session["adda_user_email"].ToString();





                MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("delete from "+ adda1by0_databasename + ".currentusers where email='" + str + "';", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                logouttext.Text = "Successfully Logout";
                Response.Redirect("web_pages/homepage.aspx");

            }
        }
    }
}