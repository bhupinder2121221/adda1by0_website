<%@ Page Language="C#" AutoEventWireup="true" Theme="css" CodeBehind="loginPage.aspx.cs" Inherits="add1By0.web_pages.loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="../bootsrap/bootstrap-5.0.0-beta1-dist/css/bootstrap.min.css" />
    <script src="../bootsrap/bootstrap-5.0.0-beta1-dist/js/bootstrap.bundle.min.js"></script>
   <style>
       .webcamdisplay {
           position:initial;
       }
       
   </style>
   
   
    
    <script runat="server">
        public bool IsMobileBrowser()
        {
            String labelText = "";
            System.Web.HttpBrowserCapabilities myBrowserCaps = Request.Browser;
            if (((System.Web.Configuration.HttpCapabilitiesBase)myBrowserCaps).IsMobileDevice)
            {
                labelText = "Browser is a mobile device.";

                return true;
            }
            else
            {
                labelText = "Browser is not a mobile device.";

                return false;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('"+ labelText + "');", true);

        }

        protected String LabelProperty
        {
            get
            {
                return hiddenurl.Value;
            }
            set
            {
                hiddenurl.Value = value;
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
        void imagebtn_show_image()
        {
            if (FileUpload.HasFile)
            {

                if (checkfile_extension(FileUpload.FileName))
                {
                    String filepath = "~/UploadImages/" + emailBox.Text + System.IO.Path.GetExtension(FileUpload.FileName);
                    FileUpload.SaveAs(MapPath(filepath));

                }
                else
                {

                }

            }

        }

        void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                nameBox.Text = nameBox.Text;
                lastNameBox.Text = lastNameBox.Text;
                ageBox.Text = ageBox.Text;
                classBox.SelectedValue = classBox.SelectedValue;
                phnoBox.Text = phnoBox.Text;
                emailBox.Text = emailBox.Text;
                passwordBox.Text = passwordBox.Text;
                rewritePasswordBox.Text = rewritePasswordBox.Text;

                fileuploaded.Text = fileuploaded.Text;
                if (focusto == "submit")
                {
                    submit.Focus();
                }


            }
            else
            {

            }


            if (chooseoptions.Value == "webcam")
            {
                webcam_security_panel_signin.Visible = true;
                password_security_panel_signin.Visible = false;
            }
            else
            {

                webcam_security_panel_signin.Visible = false;
                password_security_panel_signin.Visible = true;
            }







            if (chooseoptions.Value == "webcam")
            {
                webcam_security_panel_signin.Visible = true;
                password_security_panel_signin.Visible = false;
            }
            else
            {
                webcam_security_panel_signin.Visible = false;
                password_security_panel_signin.Visible = true;
            }
        }



   </script> 

   
    
    <script type="text/javascript">
        
        function showpicClick() {
            while (true) {
                if (document.getElementById('FileUpload').value != "") {
                    console.log("File Uploaded Successfully");
                    break;
                }
                console.log("searching.");
            }
        }
        showpicClick();
        function OnChange(dropdown) {
            var myindex = document.getElementById('chooseoptions').selectedIndex;
            var SelValue = document.getElementById('chooseoptions').options[myindex].value;
            document.getElementById("choosebtn").click();
            console.log("value is", SelValue);
                }
    </script>
    <title>Adda1by0 | Registration</title>
</head>
<body class="backgroundpicture">
    

    <nav class="navbar navbar-expand bg-light navbar-light" style="z-index:3;    box-shadow: 0px 3px 19px;">
       <a href="homepage.aspx"> <h1 class="navbar-brand fs-1">Adda1By0</h1></a>
    </nav>
    
    <asp:Image ID="comparetoimage" runat="server" />

    <br /><br />
    
   <div class="row">
       <% if (IsMobileBrowser() == false)
           { %>
       <div class="col ">
          <div class="container-md p-1" style="margin-top:65px;">
           <div class="fs-1" style="    color: blueviolet;    font-weight: 600;    text-align: center;    font-family: cursive;">Lets Dive into the portal.</div>
       </div>
           <div class="container-md text-center">
               <img src="../images/adda1by0.png" class="img-fluid" />
           </div>
           <br />
           <div class="display-1" style="text-align: center;
    font-family: initial;
    color: darkblue;
    margin-top: 19%;">"Lets touch the height together."</div>
           </div>
       <%} %>
       <div class="col">
        <div class="container-sm">
            
    <form id="form1" method="post" class="fomstyle" runat="server">
        <div class="container-fluid">
    <asp:Panel ID="alertmsg" Visible="false" runat="server">
        <div class="alert alert-danger" role="alert" style="margin-top:16px;">
            <p class="fs-6" id="alertmsges" runat="server"></p>
        </div>
    </asp:Panel>
            <asp:HiddenField ID="pathToImageUpload" Value="" runat="server" />
            <asp:Label ID="heading" CssClass="heading fs-2" runat="server">Registration Portal</asp:Label>
            <hr style="" />
            <div class="row">
            <h4 style="    font-size: 1rem;width:auto;    color: darkblue;">Already have an Adda1by0 account?</h4><a style="color: purple; width:auto;    font-weight: 600;" href="signInPage.aspx">Login Here</a>
            </div>
                <br /><br />

            <div class="row">
                <div class="col-md">
            <div class="form-floating">
             <asp:TextBox ID="nameBox" CssClass="login-inputs left form-control" placeholder="Eg. Harry" runat="server"></asp:TextBox>
            <label for="nameBox">First Name</label>
                
                </div>
                    </div>
                
            <br />
                <br />
                <div class="col-md">
                    <div class="form-floating formobile">
             <asp:TextBox ID="lastNameBox" CssClass="login-inputs left form-control" placeholder="Eg. Potter" runat="server"></asp:TextBox>
            <label for="lastNameBox">Last Name</label>
            </div>
                    </div>
                </div>
                <br />
            <div class="row">
                <div class="col-md">
            <div class="form-floating">
             <asp:TextBox ID="ageBox" CssClass="login-inputs left form-control" Text="" placeholder="Eg. 18" TextMode="Number" runat="server"></asp:TextBox>
           <label for="ageBox">Age</label>
                </div>
                <br />
            </div>
                
                <div class="col-md">
                    <div class="form-floating">
            <asp:DropDownList ID ="classBox" CssClass="login-inputs left form-control" runat="server">
                <asp:ListItem id="choose" Value="Choose" runat="server"> Choose </asp:ListItem>
                <asp:ListItem id="class1" Value="Class 1st" runat="server"> Class 1st</asp:ListItem>
                <asp:ListItem id="class2" Value="Class 2nd" runat="server"> Class 2nd</asp:ListItem>
                <asp:ListItem id="class3" Value="Class 3rd" runat="server"> Class 3rd</asp:ListItem>
                <asp:ListItem id="class4" Value="Class 4th" runat="server"> Class 4th</asp:ListItem>
                <asp:ListItem id="class5" Value="Class 5th" runat="server"> Class 5th</asp:ListItem>
                <asp:ListItem id="class6" Value="Class 6th" runat="server"> Class 6th</asp:ListItem>
                <asp:ListItem id="class7" Value="Class 7th" runat="server"> Class 7th</asp:ListItem>
                <asp:ListItem id="class8" Value="Class 8th" runat="server"> Class 8th</asp:ListItem>
                <asp:ListItem id="class9" Value="Class 9th" runat="server"> Class 9th</asp:ListItem>
                <asp:ListItem id="class10" Value="Class 10th" runat="server"> Class 10th</asp:ListItem>
                <asp:ListItem id="class11" Value="Class 11th" runat="server"> Class 11th</asp:ListItem>
                <asp:ListItem id="class12" Value="Class 12th" runat="server"> Class 12th</asp:ListItem>
                
            </asp:DropDownList>
                    <label for="classBox">Choose Class</label>
                </div>
                    </div>
                </div>
            <br />
            <br />
            <div class="form-floating">
            <asp:TextBox ID="phnoBox" CssClass="login-inputs left form-control" TextMode="Number" placeholder="0123456789" runat="server"></asp:TextBox>
           <label for="phnoBox">Phone No.</label>
                </div>
                <br />
            <div class="form-floating">
             <asp:TextBox ID="emailBox" CssClass="login-inputs left form-control" TextMode="Email" placeholder="Eg abc@gmail.com" runat="server"></asp:TextBox>
            <label for="emailBox">Email</label>
                </div>
                <br />
            <div class="row">
                <div class="col-md">
            <div class="form-floating">
             <asp:TextBox ID="passwordBox" CssClass="login-inputs left form-control" placeholder="includes a-z A-Z 0-9 @ _"  TextMode="Password" runat="server"></asp:TextBox>
            <label for="passwordBox">Password</label>
            </div>
                    </div>
                <br />
                
                <div class="col-md">
            <div class="form-floating formobile">
             <asp:TextBox ID="rewritePasswordBox" CssClass="login-inputs left form-control" placeholder="includes a-z A-Z 0-9 @ _" TextMode="Password" runat="server"></asp:TextBox>
            <label for="rewritePasswordBox">Rewrite Password</label>
            </div>
                    </div>
                </div>
                <br />
            <br />
           
           
            <asp:Label ID="security" CssClass="logup-details left form-label" runat="server">For Security</asp:Label>
           
                <select id="chooseoptions" name="select1" runat="server" onchange='OnChange(this.form.select1);'  class="login-inputs left  form-control">
                <option  value="webcam" runat="server">Webcam</option>
                <option  value="fileupload"  runat="server">Image Upload</option>
            </select>
                
             
            <asp:Button ID="choosebtn" Text="Go!" CssClass="choose-btn-registration "  runat="server" />

            <br />
            
              </div>
        <div class="container-fluid">
            
             <asp:Panel ID="webcam_security_panel_signin" Visible="true" CssClass=" webcamdisplay " runat="server">
                 
                    
                 <div class="camera-section visible" style="width:auto;    padding: 0px;    margin-top: 39px;">  
               <div class="row">
                    <div class="col" style="margin-left:10%;">
                    <div class="camera img-fluid">
                        <video id="video">Video stream not available.</video>
                    </div>
                    <canvas id="canvas" class="d-none img-fluid"></canvas>
                        </div>
                     <div class="col" style="margin-left:10%;">
                    <div class="output" style="margin-left:0px;float:none;">
                         <asp:Image id="photo" CssClass="img-fluid" alt="The screen capture will appear in this box." runat="server"></asp:Image> 
                     </div>
                         </div>
                              <br />
                              <br />
                     </div>
                        
                         </div>
                     
                      <div class="row">
                        <button id="startbutton" onclick="take_snap()" style="margin-top:5px;position:inherit;width:108px" class="btn btn-light">SNAP</button>
                    </div>
                       
                     
                 </asp:Panel>
               
                 
         
                <asp:Panel ID="password_security_panel_signin" Visible="false" CssClass=" webcamdisplay"  runat="server">          
                   <br />
                    <br />
                   
                    <div class="row">
                       <div class="col">
                           <div class="row">
                    <asp:FileUpload ID="FileUpload"   CssClass="login-inputs left file-choose" runat="server" />
                    </div>
                           <br />
                           <div class="row">
                    <asp:Button ID="fileshow" CssClass="btn btn-dark" Text="Upload Pic" OnClick="fileshow_Click" runat="server" />
                     </div>
                           <br />
                           <div class="row">
                               <asp:Label ID="fileuploaded" Text="No File." runat="server" CssClass="fs-5 "></asp:Label>
                           </div>
                           </div>
                       <div class="col-sm">
                           <asp:Image ID="uploadedImg" CssClass="img-fluid"  runat="server" Width="200px" Height="150px" />
                 </div>
                       </div>
                       </asp:Panel>
           
           
                      
                   
            
           
         </div>
        <div class="container-fluid" style="    text-align: center;    margin-top: 33px;">
         <asp:Button ID="submit"  CssClass="btn btn-success" runat="server"  OnClick="submit_Click" Text="Submit" />
          </div>
               
        <asp:HiddenField ID="hiddenurl" runat="server" />

        </form>
        <div class="errorMsg registration" style="display:none">
            <h3 style="color:wheat;">Oh! Error List</h3>
            <asp:Label ID="error" ForeColor="Wheat" Text="No Error Hurray!" runat="server"></asp:Label>


             <a href="signInPage.aspx"><h3 style="margin-left: 64%;width: 100%;margin-top: 10px;"> Have account? Login Here...</h3> </a>
           
            </div>


        </div>
    </div>
       
           
         </div>
        
        
  
    <script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
    <script type="text/javascript" src="../webcamClicking_picture.js"></script>
    
   

</body>
   
</html>
