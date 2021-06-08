using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;

namespace add1By0
{
    public partial class discussion : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        ArrayList discussionsNames = new ArrayList();
        ArrayList teacherName = new ArrayList();
        ArrayList createdTime = new ArrayList();
        ArrayList id = new ArrayList();
        public ArrayList Get_id { get { return id; } }
        public ArrayList Get_discussionName { get { return discussionsNames; } }
        public ArrayList Get_teacherName { get { return teacherName; } }
        public ArrayList Get_createdTime { get { return createdTime; } }
        int indexOdDiscussion = 0;
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            String useremail = Request.QueryString["uid"].ToString();
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".alldiscussions order by id DESC;", conn);
            var rdr = cmd.ExecuteReader();
            var i = 0;
            while (rdr.Read())
            {
                if (i == 0)
                {
                    indexOdDiscussion = Convert.ToInt32(rdr["id"].ToString());
                }
                i = i + 1;
                discussionsNames.Add(rdr["discussionName"].ToString());
                teacherName.Add(rdr["teacherName"].ToString());
                createdTime.Add(rdr["timeOfcreation"].ToString());
                id.Add(rdr["id"].ToString());
                
            }
            
            conn.Close();
            userName.Text = useremail;
            userName.ReadOnly=true;
            if(useremail == "username")
            {
                add_discussion_panel.Visible = false;
            }
            else
            {
                if (adminIsHere())
                {
                    add_discussion_panel.Visible = true;
                }
                else
                {
                    add_discussion_panel.Visible = false;
                }
            }
           


        }
        bool adminIsHere()
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from "+ adda1by0_databasename + ".login_admins where email='"+userName.Text+"';",conn);
            var rdr = cmd.ExecuteReader();
            while(rdr.Read())
            {
                conn.Close();
                return true;
            }
            conn.Close();
            return false;
        }
        void Page_LoadComplete(object sender,EventArgs e)
        {
           
            
        }

        protected void submitPost_Click(object sender, EventArgs e)
        {
            conn.Open();
            String teachername = userName.Text;
            String topiName = topicNameBox.Text;
            String createdDateAndTime = System.DateTime.Now.ToString();
            String newTableName = "adda1by0.Chatbox" + (indexOdDiscussion+1).ToString();
            MySqlCommand cmd = new MySqlCommand("insert into "+ adda1by0_databasename + ".alldiscussions values(null,'"+teachername+"','"+topiName+"','"+createdDateAndTime+"');", conn);
            cmd.ExecuteNonQuery();
            MySqlCommand cmd1 = new MySqlCommand("create table " + newTableName + " (chats varchar(250) not null, userName varchar(50) not null,creationTime varchar(30) not null) ;", conn);
            cmd1.ExecuteNonQuery();
            conn.Close();

            //redirecting to same page to prevent duplicate execution of sql query
            Response.Redirect(Request.Url.AbsoluteUri);
            

        }
    }
}