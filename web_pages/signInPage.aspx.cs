using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AForge.Video;
using AForge.Video.DirectShow;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace add1By0.web_pages
{
    public partial class signInPage : System.Web.UI.Page
    {
        
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<script type=text/javascript>alert('For getting premium membership. Sign In first or Register if you are new user!')</script>");


            if (Request.QueryString["booking"] != null)
            {
                if(Request.QueryString["booking"].ToString()== "frmhmtrdrpg")
                {
                    Response.Write("<script type=text/javascript>alert('For getting premium membership. Sign In first or Register if you are new user!')</script>");
                }
            }

           

        }
        bool check_student_user_exist_by_password()
        {
            conn.Open();
           MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where firstname=\"" + name_signin_box.Text + "\" and email=\"" + emailbox.Text + "\" and password =\"" + passwordBox.Text.ToString() + "\";", conn);
            try
            {
                var rdr = cmd.ExecuteReader();

                var name = "";
                var count = 0;
                while (rdr.Read())
                {
                    name = rdr["firstname"].ToString();
                    count += 1;


                }
                rdr.Close();

                if (name != "")
                {

                    Response.Write("<script type=text/javascript>alert('Signin Successful  " + name + " as Student')</script>");
                    
                    return true;




                }
                else
                {
                    return false;

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type=text/javascript>alert('Signin Error" + ex.Message + "')</script>");
                return false;

            }
        }

       
     
        bool check_admin_user_exist()
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from adda1by0.login_admins where name = \"" + name_signin_box.Text + "\" and email=\"" + emailbox.Text + "\" and password = \"" + passwordBox.Text + "\";", conn);

            try
            {
                var rdr = cmd.ExecuteReader();

                var name = "";
                while (rdr.Read())
                {
                    name = rdr["name"].ToString();

                }
                rdr.Close();
                if (name != "")
                {                 
                    conn.Close();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type=text/javascript>alert('Signin Error'"+ex.Message+")</script>");
                return false;
            }

        }
        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        public string encrypt(string encryptString)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }
        public bool ifcookiePresent()
        {
            Response.Write("<script type=text/javascript>alert('cookies ckecking')</script>");

            
            if (Request.Cookies["Adda1By0_cookies"] != null)
            {
                Session["adda_user_name"] = Request.Cookies["Adda1By0_cookies"]["uname"];
                Session["adda_user_email"] = Request.Cookies["Adda1By0_cookies"]["email"];
                Session["adda_user_encription"] = Request.Cookies["Adda1By0_cookies"]["encript"];
                Session["adda_login_as"] = Request.Cookies["Adda1By0_cookies"]["login_as"];
                Response.Write("<script type=text/javascript>alert('cookies Found')</script>");

                return true;
            }
            Response.Write("<script type=text/javascript>alert('cookies Not Found')</script>");

            return false;
        }
        void create_cookies()
        {
            removePrevCookies();
            Response.Cookies["Adda1By0_cookies"]["uname"] = name_signin_box.Text;
            Response.Cookies["Adda1By0_cookies"]["email"] = emailbox.Text;
            Response.Cookies["Adda1By0_cookies"]["login_as"] = loginasBox_signin.SelectedValue.ToString();
            Response.Cookies["Adda1By0_cookies"]["encript"] = encrypt(emailbox.Text);
            Response.Cookies["Adda1By0_cookies"].Expires = DateTime.Now.AddDays(100);
            
           
        }
        void removePrevCookies()
        {
            HttpCookie temp = Request.Cookies["Adda1By0_cookies"];
            if (temp != null)
            {
                temp.Expires = DateTime.Now.AddSeconds(-10);
                Response.Cookies.Add(temp);
            }
        }
        protected void signin_btn(object sender, EventArgs e)
        {
            if (loginasBox_signin.SelectedValue == "admin")
            {
                if (check_admin_user_exist())
                {
                    if (remembermecheckbox.Checked)
                    {
                        create_cookies();

                    }
                    Session["adda_user_name"] = name_signin_box.Text;
                    Session["adda_user_email"] = emailbox.Text;
                    Session["adda_user_encription"] = encrypt(emailbox.Text);
                    Session["adda_login_as"] = loginasBox_signin.SelectedValue.ToString();
                    
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script type=text/javascript>alert('No Record Found')</script>");
                }
            }
            else
            {
                    if (check_student_user_exist_by_password())
                    {
                    if (remembermecheckbox.Checked)
                    {
                        create_cookies();

                    }
                    Session["adda_user_name"] = name_signin_box.Text;
                    Session["adda_user_email"] = emailbox.Text;
                    Session["adda_user_encription"] = encrypt(emailbox.Text);
                    Session["adda_login_as"] = loginasBox_signin.SelectedValue.ToString();
                    
                    Response.Redirect("homepage.aspx");
                }
                    else
                    {
                        Response.Write("<script type=text/javascript>alert('No Record Found as Student')</script>");
                    }
                
            }
        }

  
    }
}