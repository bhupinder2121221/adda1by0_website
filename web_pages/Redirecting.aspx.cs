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
using System.Threading;

namespace add1By0.web_pages
{
    public partial class Redirecting : System.Web.UI.Page
    {
        public string namee = "";
        public string redirectingLinkSTR = "";
        public string redirectingmsg = "";
        public string useremail = "";
        public String payment = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            useremail = Request.QueryString["Name"];
            if (Session["adda_user_email"] != null)
            {
                useremail = Session["adda_user_email"].ToString();
            }
            else
            {
                useremail = "Visitor";
            }

            string status = "";


            if (Request.QueryString["Profile"]!=null)
            {

                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + useremail + "';", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    
                    status = "student";
                }
                rdr.Close();
                if (status.ToLower() == "student")
                {
                    redirectingLinkSTR = "profile.aspx";
                    redirectingmsg = "Redirecting to Profile.";


                }
            // admin here
                else
                {
                    MySqlCommand cmd1 = new MySqlCommand("select * from adda1by0.login_admins where email='" + useremail + "';", conn);
                    rdr = cmd1.ExecuteReader();
                    while (rdr.Read())
                    {
                        status = "admin";
                    }
                    if (status == "")
                    {
                        redirectingLinkSTR = "homepage.aspx";
                        redirectingmsg = "Not a valid user. Redirecting to Home Page.";
                    }
                    else
                    {
                        redirectingLinkSTR = "homepage.aspx";
                        redirectingmsg = "You are Admin. You can get or change your profile by contacting Admin team.";
                    }
                    rdr.Close();
                    conn.Close();



                    
                }
            }
            else if (Request.QueryString["logout"] != null)
            {
               
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("delete from adda1by0.currentusers where email='" + useremail + "';", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                redirectingLinkSTR = "homePage.aspx";
                redirectingmsg = "Redirecting to Home Page.";

            }
            else if (Request.QueryString["booking"] != null)
            {
                if (Request.QueryString["booking"].ToString() == "frmhmtrdrpg")
                {
                    bool signin = true;
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + useremail+"';", conn);
                    var rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        signin = false;
                    }
                    rdr.Close();
                    conn.Close();
                    if (signin)
                    {
                        redirectingLinkSTR = "signinPage.aspx?booking=frmhmtrdrpg";
                        redirectingmsg = "Sign In Required.   Then Book it.";
                    }
                    else
                    {
                        redirectingLinkSTR = "premiumMembership.aspx?Name=" + useremail + "&signin=required";
                        redirectingmsg = "Now Book your seat.";
                    }
                }
            }




            //for classes and extraclasses
            else if (Request.QueryString["class"] != null)
            {


                string classs = Request.QueryString["class"];
                classs = "classes" + (Convert.ToInt32(classs) + 1);


                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + useremail + "';", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    payment = rdr["fees"].ToString();
                    status = "student";
                }
                rdr.Close();
                if (status.ToLower() == "student")
                {
                    if (Convert.ToInt32(Request.QueryString["class"]) < 10)
                    {
                        redirectingLinkSTR = "adda_classes.aspx?Name=" + useremail + "&status=" + status + "&class=" + classs;
                        redirectingmsg = "Everything is correct. Click OK to continue.";
                    }
                    else
                    {
                        if (payment == "true")
                        {
                            redirectingLinkSTR = "adda_classes.aspx?Name=" + useremail + "&status=" + status + "&class=" + classs;
                            redirectingmsg = "Everything is correct. Click OK to continue.";
                        }
                        else
                        {
                            redirectingLinkSTR = "premiumMembership.aspx?Name=" + useremail + "&postback=fromclasses&signin=required";
                            redirectingmsg = "You are accessing Premium Source. But you have no Premium account Please buy Premium account!";
                        }
                    }
                }
                else
                {
                    MySqlCommand cmd1 = new MySqlCommand("select * from adda1by0.login_admins where email='" + useremail + "';", conn);
                    rdr = cmd1.ExecuteReader();
                    while (rdr.Read())
                    {
                        status = "admin";
                    }
                    rdr.Close();
                    conn.Close();



                    if (status == "")
                    {
                        redirectingmsg = "You have not logined or we donot have your information. Please Login or Sign in!";
                        redirectingLinkSTR = "courses.aspx?Name=" + useremail + "&postback=true&signin=required";
                    }
                    else
                    {

                        redirectingLinkSTR = "adda_classes.aspx?Name=" + useremail + "&status=" + status + "&class=" + classs;
                        redirectingmsg = "Everything is correct. Click OK to continue.";

                    }
                }

            }
            else if (Request.QueryString["topicName"] != null)
            {
                String topicname = Request.QueryString["topicName"];
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + useremail + "';", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    payment = rdr["fees"].ToString();
                    status = "student";
                }
                rdr.Close();
                if (status == "student")
                {
                   
                        if (payment == "true")
                        {
                            redirectingLinkSTR = "../setLiveStreaming.aspx?Name=" + useremail + "&status=" + status + "&topicName="+topicname;
                            redirectingmsg = "Everything is correct. Click OK to continue.";
                        }
                        else
                        {
                            redirectingLinkSTR = "courses.aspx?Name=" + useremail + "&postback=true&signin=required";
                            redirectingmsg = "You are accessing Premium Source. But you have no Premium account Please buy Premium account!";
                        }
                    
                }
                else
                {
                    MySqlCommand cmd1 = new MySqlCommand("select * from adda1by0.login_admins where email='" + useremail + "';", conn);
                    rdr = cmd1.ExecuteReader();
                    while (rdr.Read())
                    {
                        status = "admin";
                    }
                    rdr.Close();
                    conn.Close();
                }


                if (status == "")
                {
                    redirectingmsg = "You have not logined or we donot have your information. Please Login or Sign in!";
                    redirectingLinkSTR = "courses.aspx?Name=" + useremail + "&postback=true&signin=required";
                }
                else
                {

                    redirectingLinkSTR = "../setLiveStreaming.aspx?Name=" + useremail + "&status=" + status + "&topicName=" + topicname;
                    redirectingmsg = "Everything is correct. Click OK to continue.";

                }

            }
            else
            {
                redirectingLinkSTR = "homepage.aspx?booking=frmhmtrdrpg";
                redirectingmsg = "Wrong Command. Try Again.";

            }

        }
    }
}