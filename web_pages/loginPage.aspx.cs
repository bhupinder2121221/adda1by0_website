using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using Org.BouncyCastle.Asn1.Cmp;
using System.Threading;
using System.Net.Http;
using Emgu.CV;
using System.Drawing;
using Emgu.CV.Structure;

namespace add1By0.web_pages
{
    public partial class loginPage : System.Web.UI.Page
    {
        public string focusto = "";
        public string filenameofPic = "";
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String fileUploading_path = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('postback called')</script>");

            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('post back not called')</script>");

            }


        }
       
        
        protected void SubmitForm()
        {
            if(chooseoptions.Value=="webcam")
            {
                // for webcam

                String dirPath = Server.MapPath("~/App_Themes/User_uploaded_Pics/");


                String imgName = dirPath + emailBox.Text + ".png";

                byte[] imgByteArray = Convert.FromBase64String(hiddenurl.Value.ToString());
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imgByteArray, 0, imgByteArray.Length);
                ms.Write(imgByteArray, 0, imgByteArray.Length);
                System.Drawing.Image imageCaptured = System.Drawing.Image.FromStream(ms, true);
                try
                {

                    imageCaptured.Save(imgName, System.Drawing.Imaging.ImageFormat.Png);
                    
                    

                }
                catch (Exception ex)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Image Uploading Error "+ex.Message+"')</script>");
                }

                Response.Write("<script LANGUAGE='JavaScript' >console.log('All Fields are correct.  Now going for registration.')</script>");

                try
                {
                    Response.Write("<script LANGUAGE='JavaScript' >console.log('Registration started!')</script>");

                    conn.Open();
                    MySqlCommand cmd1 = new MySqlCommand("Insert into adda1by0.registration values('" + nameBox.Text.ToUpper()+"','"+ lastNameBox.Text.ToUpper() + "','"+ ageBox.Text + "','"+ classBox.SelectedValue.ToString() + "','"+ phnoBox.Text + "','"+ emailBox.Text.ToUpper() + "','"+ passwordBox.Text + "','"+imgName+"','null','false');", conn);
                    
                    cmd1.ExecuteNonQuery();


                    Response.Write("<script LANGUAGE='JavaScript' >console.log('Registration Successful')</script>");

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Registration Successful')</script>");
                    Response.Redirect("signInPage.aspx");

                }
                catch (MySqlException ex)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Registration Error"+ex.Message+"')</script>");
                    Response.Write("<script LANGUAGE='JavaScript' >console.log('Registration Error " + ex.Message + "')</script>");
                }
                finally
                {
                    conn.Close();
                }
                Response.Write("<script LANGUAGE='JavaScript' >alert('Might be you are using already registered phone number. Use different Phone Number or Logion in')</script>");


            }
            else
            {
                try
                {
                
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand("Insert into adda1by0.registration values(@FirstName,@LsName,@Age,@class,@phno,@email,@password,'',@uploadedImage,'false')", conn);
                    cmd.Parameters.AddWithValue("@FirstName", nameBox.Text.ToUpper());
                    cmd.Parameters.AddWithValue("@LsName", lastNameBox.Text.ToUpper());
                    cmd.Parameters.AddWithValue("@Age", ageBox.Text);
                    cmd.Parameters.AddWithValue("@class", classBox.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@phno", phnoBox.Text);
                    cmd.Parameters.AddWithValue("@email", emailBox.Text.ToUpper());
                    cmd.Parameters.AddWithValue("@password", passwordBox.Text);
                    cmd.Parameters.AddWithValue("@uploadedImage", pathToImageUpload.Value);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Registration Successful')</script>");
                    Response.Redirect("signInPage.aspx");



                }
                catch (MySqlException ex)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Registration Error'"+ex.Message+")</script>");
                }
                finally
                {
                    conn.Close();
                }
            }


      
        }
       bool ifUser_email_already_present()
        {
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from adda1by0.registration where email='" + emailBox.Text.ToUpper() + "';", conn);
            var rdr = cmd.ExecuteReader();
            int Count = 0;
            while (rdr.Read())
            {
                Count += 1;

            }
            rdr.Close();
            if (Count == 0) { conn.Close(); return false; }
            conn.Close();
            return true;

        }
        bool chechIf_numnber(char c)
        {
            switch (c) {
                case '1': return true;
                case '2':return true;
                case '3': return true;
                case '4': return true;
                case '5': return true;
                case '6': return true;
                case '7':return true;
                case '8':return true;
                case '9':return true;
                case '0':return true;
                default: return false;
                    }

        }
        bool checkfile_extension(string filename)
        {
            String extension = System.IO.Path.GetExtension(filename);
            switch (extension.ToLower())
            {
                case ".gif": return true;
                case ".jpeg": return true;
                case ".jpg": return true;
                case ".png": return true;
                default: return false;
            }
        }

        protected void fileshow_Click(object sender, EventArgs e)
        {
            
            if (FileUpload.HasFile)
            {

                if (checkfile_extension(FileUpload.FileName))
                {
                    String filepath = "~/App_Themes/User_uploaded_Pics/" + emailBox.Text + System.IO.Path.GetExtension(FileUpload.FileName);
                    FileUpload.SaveAs(MapPath(filepath));
                    uploadedImg.ImageUrl = filepath;
                    pathToImageUpload.Value = filepath;
                    filenameofPic = FileUpload.FileName;
                    fileuploaded.Text = "File Uploaded";

                }
                else
                {
                    error.Text = "* Not a valid File";
                    fileuploaded.Text = "Not a valid File";
                }

            }
            else
            {
                fileuploaded.Text = "No File Selected";
                focusto = "submit";
            }

        }
        String CheckValidations_registration()
        {
            String errorMessage = "";
            if (nameBox.Text == "" | ageBox.Text == "" | classBox.SelectedValue == "Choose" | phnoBox.Text == "" | emailBox.Text == "" | passwordBox.Text == "" | rewritePasswordBox.Text == "")
            {
                
                
                if (nameBox.Text == "")
                {
                    errorMessage = errorMessage + "* First Name Required <br />";
                    nameBox.Text = "";
                 
                }
                else
                {
                    if (nameBox.Text.Length > 10)
                    {
                        errorMessage = errorMessage + "* First Name length must be less than 10 <br />";
                        nameBox.Text = "";
                    }
                    else
                    {
                        for (int i = 0; i < nameBox.Text.Length; i++)
                        {

                            {
                                if (((int)nameBox.Text[i] < 91 & (int)nameBox.Text[i] > 64) | ((int)nameBox.Text[i] > 96 & (int)nameBox.Text[i] < 123))
                                { }
                                else
                                {
                                    errorMessage = errorMessage + "* First Name Can only be text <br />";
                                    nameBox.Text = "";
                                    break;

                                }
                            }
                        }
                    }
                }

                if(lastNameBox.Text != "")
                {
                    if (lastNameBox.Text.Length > 10)
                    {
                        errorMessage = errorMessage + "* Last Name length must be less than 10 <br />";
                        lastNameBox.Text = "";
                    }
                    else
                    {
                        for (int i = 0; i < lastNameBox.Text.Length; i++)
                        {

                            {
                                if (((int)lastNameBox.Text[i] < 91 & (int)lastNameBox.Text[i] > 64) | ((int)lastNameBox.Text[i] > 96 & (int)lastNameBox.Text[i] < 123))
                                { }
                                else
                                {
                                    errorMessage = errorMessage + "* Last Name Can only be text <br />";
                                    lastNameBox.Text = "";
                                    break;

                                }
                            }
                        }
                    }
                }

                if (ageBox.Text =="")
                {
                    errorMessage = errorMessage + "* Age cannot be Empty <br />";
                    ageBox.Text = "";
                }
                else
                {
                   if(Convert.ToInt32(ageBox.Text) > 50)
                    {
                        errorMessage = errorMessage + "* Age should be less than 50 <br />";
                        ageBox.Text = "";
                    }
                   else if (Convert.ToInt32(ageBox.Text) < 1)
                    {
                        errorMessage = errorMessage + "*Age shold be Greater than 0 <br />";
                        ageBox.Text = "";
                    }

                    
                }

                if (classBox.SelectedIndex == 0)
                {
                    errorMessage = errorMessage + "* Class should be choosen <br />";
                    
                }

                if (phnoBox.Text == "") { errorMessage = errorMessage + "* Phone Number Required <br />"; }
                else
                {
                    if (phnoBox.Text.Length != 10) { errorMessage = errorMessage + "* Phone Number must be of 10 characters <br/>" ; phnoBox.Text = ""; }
                    
                    else
                    {
                        for (int i = 0; i < 10; i++)
                        {
                            if (!chechIf_numnber(phnoBox.Text[i]))
                            {
                                errorMessage = errorMessage + "* Phone Number Must be digits <br />";
                                phnoBox.Text = "";
                            }

                        }
                    }
                }

                if (emailBox.Text == "") { errorMessage = errorMessage + "* Email is Required <br/>"; emailBox.Text = ""; }
                else
                {

                    if (emailBox.Text.ToLower().EndsWith("@gmail.com") | emailBox.Text.ToLower().EndsWith("@yahoo.com")) { }
                    else
                    {
                        errorMessage = errorMessage + "* Email Must be gamil or Yahoo <br />";
                        emailBox.Text = "";
                    }
                }

                if (passwordBox.Text == "") { errorMessage = errorMessage + "* Password Required <br/>"; passwordBox.Text = ""; }
                else
                {
                    if (passwordBox.Text.Length > 15) { errorMessage = errorMessage + "* Password length must be less than 15 <br />"; passwordBox.Text = ""; }

                }

                if (rewritePasswordBox.Text == "") { errorMessage = errorMessage + "* Rewrite Password Must Be Matched <br />"; rewritePasswordBox.Text = ""; }
                else
                {
                    if (rewritePasswordBox.Text != passwordBox.Text) { errorMessage = errorMessage + "* Rewrite Password Must Be Matched <br/>"; rewritePasswordBox.Text = ""; }
                }
            }
            return errorMessage;
        }
        String security_checking()
        {
            if(chooseoptions.Value == "webcam")
            {
                if (hiddenurl.Value == "")
                {
                    return "* Click on Snap Button to click Photo<br>";
                }
                return "Success";
            }
            else
            {
                if (uploadedImg.ImageUrl!="")
                {
                   
                        return "Success";
                   
                }
                else
                {
                    return "* No Image Uploaded yet.<br>  Select The Image File then <br>  Click on Show Button";
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            var return_of_validations = CheckValidations_registration();
            if (return_of_validations=="")
            {
                
                String Security_checking_result = security_checking();
                if(Security_checking_result == "Success")
                {
                    error.Text = "All Success Ready to Submit";
                    if (ifUser_email_already_present())
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Email Already Registered !')</script>");
                    }
                    else
                    {
                        
                        SubmitForm();
                    }
                    
                }
                else
                {
                    alertmsges.InnerHtml = Security_checking_result;
                }
            }  
            else
            {
                alertmsg.Visible = true;
                alertmsges.InnerHtml = return_of_validations;
                if(return_of_validations.StartsWith("* First"))
                {
                    nameBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Last"))
                {
                    lastNameBox.Focus();
                }
                else if (return_of_validations.StartsWith("* Age"))
                {
                    ageBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Class"))
                {
                    classBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Phone"))
                {
                    phnoBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Email"))
                {
                    emailBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Password"))
                {
                    passwordBox.Focus();
                }
                else if(return_of_validations.StartsWith("* Rewrite"))
                {
                    rewritePasswordBox.Focus();
                }
            }
            
        }

       
    }
}