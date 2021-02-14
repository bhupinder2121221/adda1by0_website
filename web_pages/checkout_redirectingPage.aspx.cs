using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using paytm;
using MySql.Data.MySqlClient;
using System.Configuration;


namespace add1By0.web_pages
{
    public partial class checkout_redirectingPage : System.Web.UI.Page
    {
		MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
        {
			string email = Request.QueryString["email"].ToString();
			string orderId = Request.QueryString["orderid"].ToString();
			string amount = Request.QueryString["amt"].ToString();
			string dateOfTransection = DateTime.Now.ToString("dd-MM-yyyy");
			string timeOfTransection = DateTime.Now.ToString("HH:mm:ss");
			String merchantKey = "Mpb_YIN4h5kwMKfY";
			Dictionary<string, string> parameters = new Dictionary<string, string>();
			string paytmChecksum = "";
			foreach (string key in Request.Form.Keys)
			{
				parameters.Add(key.Trim(), Request.Form[key].Trim());
			}
			if (parameters.ContainsKey("CHECKSUMHASH"))
			{
				paytmChecksum = parameters["CHECKSUMHASH"];
				parameters.Remove("CHECKSUMHASH");
			}
			if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
			{
				string paytmStatus = parameters["STATUS"];
				string txnId = parameters["TXNID"];
				pTxnId.InnerText = "Transaction Id : " + txnId;
				if (paytmStatus == "TXN_SUCCESS")
				{
					h1Message.InnerText = "Your payment is success";
					conn.Open();
					MySqlCommand cmd = new MySqlCommand("UPDATE `adda1by0`.`registration` SET `fees` = 'true' WHERE (`email` = '" + email + "');", conn);
					cmd.ExecuteNonQuery();
					conn.Close();
					conn.Open();
					cmd = new MySqlCommand("insert into adda1by0.payments values('"+email+"','"+txnId+"','"+orderId+"','"+amount+"','"+dateOfTransection+"','"+timeOfTransection+"');", conn);
					cmd.ExecuteNonQuery();
					conn.Close();
					Response.Redirect("premiumMembership.aspx?Name="+email+"&status=TygUdgnhftnk4841nN");
				}
				else if (paytmStatus == "PENDING")
				{
					h1Message.InnerText = "Payment is pending !";
					Response.Redirect("premiumMembership.aspx?status=TygUdgnhftnk");

				}
				else if (paytmStatus == "TXN_FAILURE")
				{
					h1Message.InnerText = "Payment Failure !";
					Response.Redirect("premiumMembership.aspx?status=TygUdgnhftnk");
				}
			}
			else
			{
				Response.Write("Checksum MisMatch");
			}
		}
    }
}