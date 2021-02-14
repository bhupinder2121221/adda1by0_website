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

namespace add1By0.web_pages
{
    public partial class adda_classes : System.Web.UI.Page
    {

        public String DEMOe = "";
        public string status = "";
        public string userEmail = "";


        public string classNo = "";
        public string videoUrl = "";
        public string backView = "";
        public string subjectName = "";
        // current subject selected data
        public ArrayList subject_lessons = new ArrayList();
        public ArrayList NumberOfTopicsOfLesson = new ArrayList();
        public ArrayList SubjectTopics = new ArrayList();
        public ArrayList VedioLectures_NumberOf_topic = new ArrayList();
        public ArrayList vedioLinksOf_Subject = new ArrayList();
        /// <summary>
        /// //////////////////////////
        /// </summary>
        public ArrayList subjectsOfclass = new ArrayList();


        public ArrayList lessonsOfclass = new ArrayList();

        public MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        void Load_vediosLinks_indexes(string subject_name)
        {
            string s = "";

            // getting vedios info
            conn.Open();
            MySqlCommand cmd2 = new MySqlCommand("select distinct lessons from adda1by0." + classNo + " where subject='" + subject_name + "';", conn);
            var rdr = cmd2.ExecuteReader();
            while (rdr.Read())
            {
                subject_lessons.Add(rdr["lessons"].ToString());

            }

            rdr.Close();

            for (int i = 0; i < subject_lessons.Count; i++)
            {


                cmd2 = new MySqlCommand("select distinct topics from adda1by0." + classNo + " where subject='" + subject_name + "' and lessons='" + subject_lessons[i] + "' ;", conn);
                rdr = cmd2.ExecuteReader();
                int countTopics = 0;
                while (rdr.Read())
                {
                    SubjectTopics.Add(rdr["topics"].ToString());
                    countTopics += 1;
                    s = s + rdr["topics"].ToString();
                }
                NumberOfTopicsOfLesson.Add(countTopics);
                rdr.Close();
            }



            for (int i = 0; i < SubjectTopics.Count; i++)
            {
                cmd2 = new MySqlCommand("select distinct contentVideo from adda1by0." + classNo + " where subject='" + subject_name + "'and topics='" + SubjectTopics[i] + "' ;", conn);
                rdr = cmd2.ExecuteReader();
                var countVideos = 0;
                while (rdr.Read())
                {
                    vedioLinksOf_Subject.Add(rdr["contentVideo"].ToString());
                    countVideos += 1;
                }
                VedioLectures_NumberOf_topic.Add(countVideos);
                rdr.Close();
            }
            conn.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            classNo = Request.QueryString["class"];
            userEmail = Request.QueryString["Name"];
            status = Request.QueryString["status"];
            if (status == "admin")
            {
                addItem_panel.Visible = true;
            }
            else
            {
                addItem_panel.Visible = false;
            }

            if (Request.QueryString["subject"] != null)
            {
                backView = Request.QueryString["subject"].ToString();
            }
            else
            {
                backView = "welcome";
            }
            if (Request.QueryString["v_url"] != null)
            {
                videoUrl = Request.QueryString["v_url"].ToString();
            }



            if (Page.IsPostBack)
            {

                if (backView == "welcome")
                {
                    welcome.Visible = true;
                    classPanel.Visible = false;
                }
                else
                {


                    welcome.Visible = false;
                    classPanel.Visible = true;
                    Load_vediosLinks_indexes(subjectName);
                }


            }
            else
            {


                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select distinct subject from adda1by0." + classNo + ";", conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    subjectsOfclass.Add(rdr["subject"].ToString());
                }
                rdr.Close();

                MySqlCommand cmd1 = new MySqlCommand("select distinct lessons from adda1by0." + classNo + ";", conn);
                rdr = cmd1.ExecuteReader();
                while (rdr.Read())
                {
                    lessonsOfclass.Add(rdr["lessons"].ToString());
                }
                rdr.Close();
                conn.Close();


                subjects.DataSource = subjectsOfclass;
                subjects.DataBind();
                lessons.DataSource = lessonsOfclass;
                lessons.DataBind();


                if (backView == "welcome")
                {
                    welcome.Visible = true;
                    classPanel.Visible = false;
                }
                else
                {
                    subjectName = subjectsOfclass[Convert.ToInt32(backView)].ToString();
                    welcome.Visible = false;
                    classPanel.Visible = true;
                    Load_vediosLinks_indexes(subjectName);
                }
            }
        }

        protected void custombtn_Click(object sender, EventArgs e)
        {
            if (custom.Visible == false)
            {
                custom.Visible = true;
                subjects.Visible = false;
                custombtn.Text = "List";
            }
            else
            {
                custombtn.Text = "Custom value";
                subjects.Visible = true;
                custom.Visible = false;
            }
        }

        protected void custombtn2_Click(object sender, EventArgs e)
        {
            if (custombtnm.Visible == false)
            {
                custombtnm.Visible = true;
                lessons.Visible = false;
                custombtn2.Text = "List";
            }
            else
            {
                custombtn2.Text = "Custom value";
                lessons.Visible = true;
                custombtnm.Visible = false;
            }
        }
        bool allEnteriesAreValid()
        {
            if (custombtn.Text == "List")
            {
                if (custom.Text == "")
                {
                    return false;
                }
            }
            else
            {
                if (subjects.SelectedItem.ToString() == "Custom Value")
                {
                    return false;
                }
            }

            if (custombtn2.Text == "List")
            {
                if (custombtnm.Text == "")
                {
                    return false;
                }
            }
            else
            {
                if (lessons.SelectedItem.ToString() == "Custom Value")
                {
                    return false;
                }
            }

            if (topic.Text == "")
            {
                return false;
            }
            if (vedioLink.Text == "")
            {
                return false;
            }
            return true;
        }
        protected void add_item_submit_btn_Click(object sender, EventArgs e)
        {
            var subject = "";
            var lesson = "";
            var topicStr = "";
            var vedioLinkStr = "";
            bool redirectRequired = false;
            if (allEnteriesAreValid())
            {

                if (custombtn.Text == "List")
                {
                    subject = custom.Text;
                    redirectRequired = true;
                }
                else
                {
                    subject = subjects.SelectedValue;
                }
                if (custombtn2.Text == "List")
                {
                    lesson = custombtnm.Text;
                    redirectRequired = true;
                }
                else
                {
                    lesson = lessons.SelectedValue;
                }

                topicStr = topic.Text.ToString();
                vedioLinkStr = vedioLink.Text.ToString();

                conn.Open();
                MySqlCommand cmd1 = new MySqlCommand("insert into adda1by0." + classNo + " values('" + subject + "','" + lesson + "','" + topicStr + "','" + vedioLinkStr + "');", conn);
                var r = cmd1.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script LANGUAGE='JavaScript' >confirm('All Enteries are correct. Now going for Database.')</script>");

                Response.Redirect("adda_classes.aspx");


            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >confirm('No ')</script>");

            }

        }
    }
}