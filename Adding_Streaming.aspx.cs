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
using Org.BouncyCastle.Asn1.Ocsp;

namespace add1By0
{
    public partial class Adding_Streaming : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        String username = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["Name"];
            teacherNameBox.Text = username;

        }

        protected void golive_Click(object sender, EventArgs e)
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("insert into "+ adda1by0_databasename + ".courses values('"+topicName_box.Text+"','paid','extra','"+timeBox.Text+"','"+dateBox.Text+"');", conn);
            
            cmd.ExecuteNonQuery();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Live Lecture recorded into database !')</script>");
            conn.Close();
            Response.Redirect("web_pages/Redirecting.aspx?Name="+username+"&topicName=" + topicName_box.Text);
        }
    }
}