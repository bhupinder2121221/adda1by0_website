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
using System.IO;

namespace add1By0.web_pages
{
    public partial class profile : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        public string nameOfUser = "";
      
        public string useremail="";
        public string phoneNumber = "";
        public string classEnrolled = "";
        public string premiumMembership_status="";
        public string age = "";
        public string LoginAS = "";
        public string userpic = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            
           

            if (Session["adda_user_email"] != null)
            {
                nameOfUser = Session["adda_user_email"].ToString();
            }
            else
            {
                Response.Redirect("homepage.aspx");
            }
            if (Session["adda_login_as"] != null)
            {
                if (Session["adda_login_as"].ToString().ToLower() == "student")
                {
                    LoginAS = "student";
                }
                else
                {
                    LoginAS = "admin";
                }
            }
            else
            {
                Response.Redirect("homepage.aspx");
            }
          
            
            
             MySqlCommand cmd = new MySqlCommand();
            if (LoginAS == "student")
            {
                conn.Open();
               MySqlCommand cmd1 = new MySqlCommand("select * from "+ adda1by0_databasename + ".registration where email='" + nameOfUser + "';", conn);
                var rdr = cmd1.ExecuteReader();
                string found = "Not founded";
                while (rdr.Read())
                {
                    found = "founded";
                    useremail = rdr["email"].ToString();
                    nameOfUser = rdr["firstname"].ToString();
                    phoneNumber = rdr["phno"].ToString();
                    classEnrolled = rdr["class"].ToString();
                    premiumMembership_status = rdr["fees"].ToString();
                    age = rdr["age"].ToString();
                    if (rdr["uploadedImg"].ToString() == "")
                    {
                        userpic = rdr["webcam"].ToString();
                    }
                    else
                    {
                        userpic = rdr["uploadedImg"].ToString();
                    }


                }
                
                rdr.Close();
                conn.Close();
                
               

                if (found == "Not founded")
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Data Not Found. Try Again Later. If same problem comes then contact support team.')</script>");

                }
                Response.Write("<script LANGUAGE='JavaScript'>alert('"+userpic+"')</script>");



            }
            else
            {
                Response.Redirect("homepage.aspx?Name=" + useremail);
            }
            
            if (Page.IsPostBack)
            {
              
            }
            else
            {
                
                textbox1.Text = nameOfUser.ToUpper();
                classBox.SelectedValue = classEnrolled;
                textbox2.Text = age;
                textbox3.Text = phoneNumber;
            }

        }

        protected void edit_btn_Click(object sender, EventArgs e)
        {
            textbox1.Enabled = true;
            textbox2.Enabled = true;
            textbox3.Enabled = true;
            classBox.Enabled = true;
            save_btn.Visible = true;
            edit_btn.Visible = false;
        }
        bool check_degit(char c)
        {
            switch (c)
            {
                case '1': return  false;
                case '2': return false;
                case '3': return false;
                case '4': return false;
                case '5': return false;
                case '6': return false;
                case '7': return false;
                case '8': return false;
                case '9': return false;
                case '0': return false;

                default: return true;

            }
        }
        protected void namecustom_ServerValidate(object source, ServerValidateEventArgs args)
        {

            bool ans = true;
            foreach (char c in textbox1.Text)
            {
                if (check_degit(c))
                {
                    continue;
                }
                else
                {
                    ans = false;
                    break;
                }
            }
            args.IsValid = ans;

        }

        protected void phonenumber_Customvalidation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (textbox3.Text.Length == 10)
            {
                bool ans = true;
                foreach (char c in textbox3.Text)
                {
                    if (!check_degit(c))
                    {
                        continue;
                    }
                    else
                    {
                        ans = false;
                        break;
                    }
                }
                phonenumber_Customvalidation.Text = "Must be only digits";
                phonenumber_Customvalidation.ErrorMessage = "Must be only digits";
                args.IsValid = ans;
            }
            else
            {
                phonenumber_Customvalidation.Text = "* Must be 10 digits";
                phonenumber_Customvalidation.ErrorMessage = "* Must be 10 digits";
                args.IsValid = false;
            }
            
            
            
        }

        protected void edit_bic_btn_Click(object sender, EventArgs e)
        {
          
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            string pathtosavefile = "~/App_Themes/User_uploaded_Pics/" + useremail  + Path.GetExtension(upload_pics.PostedFile.FileName).ToLower();
            upload_pics.PostedFile.SaveAs(Server.MapPath(pathtosavefile));
            conn.Open();
            MySqlCommand cmd1 = new MySqlCommand("update "+ adda1by0_databasename + ".registration set firstname='" + textbox1.Text.ToString()+"', class='"+classBox.SelectedValue.ToString()+"',age='"+textbox2.Text.ToString()+"',phno='"+textbox3.Text.ToString()+ "',uploadedImg='"+pathtosavefile+"'  where email='karan@gmail.com';", conn);
            cmd1.ExecuteNonQuery();
            Response.Write("<script LANGUAGE='JavaScript'>alert('Profile Successfuly Updated !')</script>");
            conn.Close();
            save_btn.Visible = false;
            edit_btn.Visible = true;

            textbox1.Enabled = false;
            textbox2.Enabled = false;
            textbox3.Enabled = false;
            classBox.Enabled = false;
           

        }
    }
}