using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace add1By0.web_pages
{
    public partial class pathshala : System.Web.UI.Page
    {
        public string usernm = "hello";
        public string getusername { get { return usernm; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            usernm = "bhupinder";

        }
    }
}