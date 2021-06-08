using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Http;
using System.IO;

namespace add1By0.web_pages
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string adda1by0_databasename = "adda1by0";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String codeSentToEmail = "";
        Random ran = new Random();
        public string get_emailId { get { return userName.Text; } }
        public string set_visible_flex { set { flex_panel.Visible = Convert.ToBoolean(value); } }


       
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        public void picpathfinder()
        {

            string picpath = "";
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM "+ adda1by0_databasename + ".registration where email='"+get_emailId.ToUpper()+"';", conn);
            var r = cmd.ExecuteReader();
            while (r.Read())
            {
                if (r["uploadedImg"].ToString().Length <= 2)
                {
                    picpath = r["webcam"].ToString();
                }
                else
                {
                    picpath = r["uploadedImg"].ToString();
                }
            }
            conn.Close();
            loginimg.ImageUrl = picpath;
            logininamge2.ImageUrl = picpath;
            Response.Write("<script LANGUAGE='JavaScript' >alert('pic path is'," + picpath + ")</script>");

        }
        public void Email()
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("bhupinder292000@gmail.com");
                message.To.Add(new MailAddress(get_emailId.ToString()));
                message.Subject = "Adda1by0 | Request for Change Password";
                message.IsBodyHtml = true; //to make message body as html  
               

                message.Body = "<h1>Adda1by0</h1><br>" +
                    "<h3>Hello,</h3>" +
                    "<h3>You have requested for the password change" +
                    "<p>" + codeSentToEmail + "  is your code. Please use it to change your password.</p>";
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("bhupinder292000@gmail.com", "Bhupinder@2121221_");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);


                
                
                codSent.Value = codeSentToEmail;
                Response.Write("<script LANGUAGE='JavaScript' >alert('Code sent to Email !')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + "')</script>");
            }
        }

        public void sendemail()
        {
            for (int i = 0; i < 6; i++)
            {
                int genrateNumber = ran.Next(1, 10);
                codeSentToEmail = codeSentToEmail + genrateNumber.ToString();
            }
            Email();
        }

        public bool changepasswordBtn_Click(string code,string newpassword)
        {
            if (code != codSent.Value)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Code doesnot matched ! Type it carefully.')</script>");
                return false;
            }
            else
            {
                conn.Open();
                try
                {


                    MySqlCommand cmd = new MySqlCommand("update "+ adda1by0_databasename + ".registration set password='" + newpassword + "' where email='" + userName.Text + "';", conn);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Password Changed')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + " Typed Email :"+userName.Text+" ')</script>");
                }
                conn.Close();

                return true;
            }
        }
    }
}