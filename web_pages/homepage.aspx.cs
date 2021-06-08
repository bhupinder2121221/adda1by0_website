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

namespace add1By0.web_pages
{
    public partial class homepage : System.Web.UI.Page
    {
        string adda1by0_databasename = "adda1by0";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        public string useremail = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           

            useremail = Master.get_emailId.ToUpper();
            if (Page.IsPostBack)
            {
                useremail = Master.get_emailId.ToUpper();

            }


        }
       


        
    }
}