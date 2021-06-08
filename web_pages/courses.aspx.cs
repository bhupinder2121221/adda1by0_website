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
using Org.BouncyCastle.Asn1.Ocsp;

namespace add1By0.web_pages
{
    public partial class courses : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        public string uid = "";
        bool postback = false;
        ArrayList priliminary_classes = new ArrayList();
        ArrayList plusTwo_classes = new ArrayList();
        ArrayList plusOne_classes = new ArrayList();
        public ArrayList extra_classes = new ArrayList();
        public ArrayList extra_classes_date = new ArrayList();
        public ArrayList extra_classes_time = new ArrayList();
        public string Get_uid { get { return uid; } }
        public  ArrayList priliminary_classes_property { get { return priliminary_classes; } }
        public ArrayList extra_classes_property { get { return extra_classes; } }

        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Request.QueryString["Name"].ToString();
            if (Session["adda_user_email"] != null)
            {
                uid = Session["adda_user_email"].ToString();
            }
            else
            {
                uid = "Visitor";
            }


            if (Request.QueryString["postback"] != null)
            {
                if (Request.QueryString["postback"].ToString() == "true")
                {
                    postback = true;
                    Response.Write("<script LANGUAGE='JavaScript' >alert('You must buy the Premium to access this section ! Plz Go Back and Buy our Premium . Hurry up!')</script>");
                    if (Request.QueryString["signin"] != null)
                    {
                        if (Request.QueryString["signin"].ToString() == "required")
                        {
                            Response.Redirect("signInPage.aspx?fromclass=true");
                        }
                    }
                }
            }


            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".courses;", conn);
            var rdr = cmd.ExecuteReader();
            var Count = 0;
            while (rdr.Read())
            {
                if (rdr["level"].ToString() == "priliminary")
                {

                    priliminary_classes.Add(rdr["CourseName"].ToString());
                }
                else if (rdr["level"].ToString() == "+1")
                {
                    plusOne_classes.Add(rdr["CourseName"].ToString());
                }
                else if (rdr["level"].ToString() == "+2")
                {
                    plusTwo_classes.Add(rdr["CourseName"].ToString());
                }
                else
                {
                    extra_classes.Add(rdr["CourseName"].ToString());
                    extra_classes_date.Add(rdr["dateOfCreation"].ToString());
                    extra_classes_time.Add(rdr["timeOfCreation"].ToString());
                }

            }

            rdr.Close();

            
            conn.Close();

            bool adminhere = false;
            if (Session["adda_login_as"] != null)
            {
                if (Session["adda_login_as"].ToString().ToLower() == "student")
                {
                    adminhere = false;
                }
                else
                {
                    adminhere = true;
                }
            }
            else
            {
                adminhere = false;
            }

            if (adminhere)
            {
                addExtraclases.Visible = true;
            }
            else
            {
                addExtraclases.Visible = false;
            }

            Page.DataBind();
        }

        protected void addExtraclases_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/Adding_Streaming.aspx?Name=" + uid);
        }
    }
}