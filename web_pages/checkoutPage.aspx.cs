using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.IO;
using System.Net;
using Newtonsoft.Json;
using Paytm;
using paytm;

namespace add1By0.web_pages
{
    public partial class checkoutPage : System.Web.UI.Page
    {
		string adda1by0_databasename = "adda1by0";
		private string CreateToken(string message, string secret)
		{
			secret = secret ?? "";
			var encoding = new System.Text.ASCIIEncoding();
			byte[] keyByte = encoding.GetBytes(secret);
			byte[] messageBytes = encoding.GetBytes(message);
			using (var hmacsha256 = new HMACSHA256(keyByte))
			{
				byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
				return Convert.ToBase64String(hashmessage);
			}
		}
		
			protected void Page_Load(object sender, EventArgs e)
        {
			
			string email_id = Request.QueryString["Name"];
			string phone_no = Request.QueryString["phoneNo"];
			String order_id = "orders_0786_"+phone_no;
			string customer_id = "cust0_" + phone_no;
			string amountToPay = "111";

			// Gentering and getting chcksum for paytm
			String merchantKey = "Mpb_YIN4h5kwMKfY";
			Dictionary<string, string> parameters = new Dictionary<string, string>();
			parameters.Add("MID", "YuCIKo79275916814234");
			parameters.Add("CHANNEL_ID", "WEB");
			parameters.Add("INDUSTRY_TYPE_ID", "Retail");
			parameters.Add("WEBSITE", "WEBSTAGING");
			parameters.Add("EMAIL", email_id);
			parameters.Add("MOBILE_NO", phone_no);
			parameters.Add("CUST_ID", customer_id);
			parameters.Add("ORDER_ID", order_id);
			parameters.Add("TXN_AMOUNT", amountToPay);
			string callbackurl = "https://localhost:44361/web_pages/checkout_redirectingPage.aspx?email="+email_id+"&orderid="+order_id+"&amt="+amountToPay;
			parameters.Add("CALLBACK_URL", callbackurl); //This parameter is not mandatory. Use this to pass the callback url dynamically.   premiumMembership.aspx?status=TygUdgnhftnk4841nN

			string checksum = CheckSum.generateCheckSum(merchantKey, parameters);
			string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction?orderid=" + order_id;
			string outputHTML = "<html>";
			outputHTML += "<head>";
			outputHTML += "<title>Merchant Check Out Page</title>";
			outputHTML += "</head>";
			outputHTML += "<body>";
			outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
			outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
			outputHTML += "<table border='1'>";
			outputHTML += "<tbody>";
			foreach (string key in parameters.Keys)
			{
				outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
			}
			outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
			outputHTML += "</tbody>";
			outputHTML += "</table>";
			outputHTML += "<script type='text/javascript'>";
			outputHTML += "document.f1.submit();";
			outputHTML += "</script>";
			outputHTML += "</form>";
			outputHTML += "</body>";
			outputHTML += "</html>";
			Response.Write(outputHTML);
		}

    
		

		protected void checkout2_Click(object sender, EventArgs e)
        {
			
		}
    }
}