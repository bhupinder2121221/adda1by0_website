using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;
using System.Management;

namespace add1By0
{
    public partial class discussion_chatBox : System.Web.UI.Page
    {
        string msgtobesend = "";
        ArrayList msges = new ArrayList();
        ArrayList createdTime = new ArrayList();
        ArrayList usernames = new ArrayList();
        public ArrayList Get_usernames { get { return usernames; } }
        public ArrayList Get_createdTime { get { return createdTime; } }
        public ArrayList Get_msges { get { return msges; } }
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        String chatTableName =  "";


        //demo string
        
        String username = "username";
        String teachername = "";
        public string Get_teacherName { get { return teachername; } }
        public string Get_useremail { get { return username; } }
       

        protected void Page_Load(object sender, EventArgs e)
        {


            

            chatTableName = Request.QueryString["id"].ToString();
            username = Request.QueryString["name"].ToString();
            teachername = Request.QueryString["teacherGroup"].ToString();
            usernameHiddenField.Value = username;

            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from adda1by0.chatbox" + chatTableName + "; ", conn);
            var rdr = cmd.ExecuteReader();
            var count = 0;
            while (rdr.Read()) 
            {
                count += 1;
                Get_msges.Add(rdr["chats"].ToString());
                Get_createdTime.Add(rdr["creationTime"].ToString());
                Get_usernames.Add(rdr["userName"].ToString());

            }
            rdr.Close();
            conn.Close();
            

           
            
        }
        protected void Page_Unload(object sender , EventArgs e)
        {
            
        }
        protected void postbtn_Click(object sender, EventArgs e)
        {
            if (username == "username")
            {
                Response.Write("<script LANGUAGE='JavaScript' >confirm('You Must Login To message.  Login !')</script>");
                Response.Redirect("~/web_pages/signInPage.aspx");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >confirm('message sent'"+sendMsg_chatBox.Text+")</script>");

                conn.Open();

                MySqlCommand cmd = new MySqlCommand("insert into adda1by0.chatbox" + chatTableName + " values('" + sendMsg_chatBox.Text + "','" + username + "','" + System.DateTime.Now.ToString() + "'); ", conn);
                var rdr = cmd.ExecuteNonQuery();


                conn.Close();
                sendMsg_chatBox.Text = "";

                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void sendMsg_chatBox_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}