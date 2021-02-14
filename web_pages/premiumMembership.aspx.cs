using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace add1By0.web_pages
{
    public partial class premiumMembership : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        public string nameOfUser = "";
        public string phoneNo = "";
        public string email = "";

        // for payments done
        public string transectionId = "";
        public string ordersId = "";
        public string dateOfTransection = "";
        public string timeOftransection = "";
        public string amountPaid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["postback"] != null)
            {
                if (Request.QueryString["postback"].ToString() == "fromclasses")
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('You are being redirected from classes as secondary classes and extra classes are not free. Please get our premium membership for joining classes.')</script>");

                }
            }
            conn.Open();
            string fees = "";
            string status = "";
            string user = Request.QueryString["Name"].ToString();
            
            email = user;
            MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + user + "';", conn);
            var rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                status = "student";
                fees = rdr["fees"].ToString();
                nameOfUser = rdr["firstname"].ToString();
                phoneNo = rdr["phno"].ToString();
            }
            rdr.Close();
            conn.Close();
            if(status == "student")
            {
                if (fees == "true")
                {
                    NotSuccess.Visible = false;
                    success.Visible = true;

                    conn.Open();
                    cmd = new MySqlCommand("select * from adda1by0.payments where email='" + email+"';", conn);
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        transectionId = rdr["transection_id"].ToString();
                        ordersId = rdr["order_id"].ToString();
                        amountPaid = rdr["amount"].ToString();
                        dateOfTransection = rdr["date_of_transection"].ToString();
                        timeOftransection = rdr["time_of_transection"].ToString();

                    }
                    rdr.Close();
                    conn.Close();

                }
                else
                {
                    NotSuccess.Visible = true;
                    success.Visible = false;

                }
            }
            else
            {
                NotSuccess.Visible = false;
                success.Visible = true;
            }
            


            Master.set_visible_flex = "false";
            if (Request.QueryString["status"] != null)
            {
                if(Request.QueryString["status"].ToString()== "TygUdgnhftnk4841nN")
                {
                    success.Visible = true;
                    NotSuccess.Visible = false;
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Congratulations! You are now our Premium member. Payment successful.')</script>");



                }
                else
                {
                    success.Visible = false;
                    NotSuccess.Visible = true;
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Your payment was not successful.  Retry or call customer care for more information.')</script>");

                }
            }
        }
    }
}