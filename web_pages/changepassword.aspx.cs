using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace add1By0.web_pages
{
    public partial class changepassword : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (!IsPostBack)
            {
                changepasswordpanel.Visible = true;
                successchangepassword.Visible = false;
                failedchangepassword.Visible = false;
                mustbesamemsg2.Visible = false;
            }
            
        }

        void removePrevCookies()
        {
            HttpCookie temp = Request.Cookies["Adda1By0_cookies"];
            if (temp != null)
            {
                Request.Cookies["Adda1By0_cookies"].Expires = DateTime.Now.AddDays(-1);
            }
            Session.Remove("adda_user_email");
            Session.Remove("adda_user_encription");
            Session.Remove("adda_login_as");
        }
        protected void codesend_Click(object sender, EventArgs e)
        {
            Master.sendemail();
        }

        protected void changepassword_Click(object sender, EventArgs e)
        {
            if (inputPassword6.Text == password7.Text)
            {
                if (Master.changepasswordBtn_Click(code.Text, password7.Text))
                {
                    removePrevCookies();
                    changepasswordpanel.Visible = false;
                    successchangepassword.Visible = true;
                    failedchangepassword.Visible = false;
                }
                else
                {
                    failedchangepassword.Visible = true;
                    changepasswordpanel.Visible = false;
                    successchangepassword.Visible = false;
                }
            }
            else
            {
                mustbesamemsg2.Visible = true;
                mustbesamemsg1.Visible = false;
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("signInPage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }
    }
}