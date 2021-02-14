<%@ Page Language="C#" AutoEventWireup="true" Theme="css" CodeBehind="signInPage.aspx.cs" Inherits="add1By0.web_pages.signInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <script runat="server">
      
        void Page_Load(object sender, EventArgs e)
        {
            if (loginasBox_signin.SelectedValue == "admin")
            {
                security_option_signin.Visible = false;
                webcam_signin.Visible = false;
                password_signin.Visible = false;
                password_admin_security_panel_signin.Visible = true;
                webcam_security_panel_signin.Visible = false;
                password_security_panel_signin.Visible = false;
            }
            else
            {
                if (webcam_signin.Checked)
                {
                    webcam_signin.Visible = true;
                    password_signin.Visible = true;
                    security_option_signin.Visible = true;
                    password_admin_security_panel_signin.Visible = false;
                    webcam_security_panel_signin.Visible = true;
                    password_security_panel_signin.Visible = false;
                }
                else
                {
                    webcam_signin.Visible = true;
                    password_signin.Visible = true;
                    security_option_signin.Visible = true;
                    password_admin_security_panel_signin.Visible = false;
                    webcam_security_panel_signin.Visible = false;
                    password_security_panel_signin.Visible = true;
                }
            }
            
                    
           
        }
    </script>
    <title></title>
</head>
<body>
    <div class="background-pic">
        <form id="form1" runat="server">
        <div class="login-portal signup">
            
                <div>
                    <!-- Hidden items-->
                    
                    <asp:Image ID="hiddenimage" ImageUrl="~/App_Themes/User_uploaded_Pics/demo.jpg" Visible="false"  runat="server" Height="10px" />
                    <asp:HiddenField ID="hiddenurl" runat="server" />
                        <!-- Hidden items-->


                    <asp:Label ID="heading" CssClass="heading" runat="server">Login Portal</asp:Label>
                    <hr style="margin-top:-25px;" />
                    <br /><br />
                    <asp:Label ID ="name_signin" CssClass="logup-details left" Text="Name" runat="server"></asp:Label>
                    <asp:TextBox ID="name_signin_box" CssClass="login-inputs left" runat="server"></asp:TextBox>
                      
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="Medium" runat="server" SetFocusOnError="true" ForeColor="Red" ControlToValidate="name_signin_box" Display="Dynamic" ErrorMessage="Type Your Name">*</asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="NameValidation" runat="server" ClientValidationFunction="nameValidate" ForeColor="Red" SetFocusOnError="true" ControlToValidate="name_signin_box" ErrorMessage="Only Text Possible" >*</asp:CustomValidator> 
                    <br />
                    <asp:Label ID="loginas_signin" CssClass="logup-details left" Text="Login As" runat="server"></asp:Label>
                    <asp:DropDownList ID="loginasBox_signin" CssClass="login-inputs left" AutoPostBack="true" runat="server">
                        <asp:ListItem id="student_dropdown_signin" Value="student" runat="server" >Student</asp:ListItem>
                        <asp:ListItem ID="Admin_dropdown_signin" Value="admin" runat="server">Admin</asp:ListItem>
                    </asp:DropDownList>
                    
                    
                    <asp:Label ID="email_signin" CssClass="logup-details left" Text="Email Id" runat="server"></asp:Label>
                    <asp:TextBox ID="email_signin_box" CssClass="login-inputs left" TextMode="Email" placeholder="Registered Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="email_signin_box" ForeColor="Red" runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Enter Your Email Id">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="emailValidation" ControlToValidate="email_signin_box" ForeColor="Red" ErrorMessage="use Google or Yahoo email only!" SetFocusOnError="true" Display="Dynamic" ClientValidationFunction="isEmail" runat="server">*</asp:CustomValidator>
                    <br />
                    <br />
                    <asp:Label ID="security_option_signin" Text="Login Options" CssClass="logup-details mid" runat="server"></asp:Label>
                    <div class="security-options">
                        <asp:RadioButton ID="webcam_signin" ForeColor="White" GroupName="secure"  AutoPostBack="true" Checked="true" OnCheckedChanged="Page_Load" runat="server" Text="Web Camera" />
                        <br />
                        <asp:RadioButton ID="password_signin" ForeColor="White" GroupName="secure" AutoPostBack="true" OnCheckedChanged="Page_Load" runat="server" Text="Password" />
                    </div>
                        <br />
                    <br />
                    <div class="security">
                        <asp:Panel ID="webcam_security_panel_signin" Visible="true" CssClass="security" runat="server">
                                    <div class="camera">
                                            <video id="video" autoplay muted>Video stream not available.</video>
                                    </div>
                                    <canvas id="canvas" class="d-none"></canvas>
                                    <div class="output">
                                          <asp:Image id="photo" alt="The screen capture will appear in this box." runat="server"></asp:Image> 
                                    </div>
                                                  <br />
                                                  <br />
                                    <button id="startbutton"   style="margin-top:-50px; clear:both;" class="login-inputs">SNAP</button>
                                    
                        </asp:Panel>
                        <asp:Panel ID="password_security_panel_signin" Visible="false" CssClass="security"  runat="server">
                            <asp:Label ID="password_security_signin" CssClass="logup-details" Text="Password" runat="server"></asp:Label>
                            <asp:TextBox ID="passwordBox_security_signin" CssClass="login-inputs" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="passwordValidation" ForeColor="Red" ControlToValidate="passwordBox_security_signin" runat="server" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Type Your Password"></asp:RequiredFieldValidator>
                            <p class="security_password_msg" style="padding:7px;"> * Your Password is very important. <br />  Please Don't share it to anyone. <br /> Other wise you will not able to access it.</p>
                            

                        </asp:Panel>
                        <asp:Panel ID="password_admin_security_panel_signin" Visible="false" CssClass="security"  runat="server">
                            <asp:Label ID="admin_password_security_signin" CssClass="logup-details" Text="Password" runat="server"></asp:Label>
                            <asp:TextBox ID="admin_passwordBox_security_signin" CssClass="login-inputs" runat="server"></asp:TextBox>
                            

                        </asp:Panel>
                    </div>

                    <asp:Button ID="submit_signin"  CssClass="submit-btn signin" OnClick="signin_btn" Text="Sign In" runat="server" />
                    <hr />
                    <div style="text-align:center;height:50px;width:100%">
                    <h3 style="margin:10px; color:white;display:inline-block;  ">New User?</h3>
                    <a href="loginPage.aspx" style="float:right"><h3 class="newuserLink" style="margin:10px;  display:inline-block;text-decoration:underline;"> Registration Here</h3></a>
               
                    </div>
                </div>
               
          
            
        </div>
            <div class="errorMsg">
                <h2 style="color:wheat;">Oh !  - Error List</h2>
                  <asp:ValidationSummary  Font-Size="Large" DisplayMode="BulletList" ShowSummary="true" EnableClientScript="true"   ForeColor="Red" ID="signinValidations" runat="server"  />
            </div>
        </form>
       </div>
   <script type="text/javascript" src="../webcamClicking_picture.js">  </script> 
    <script type="text/javascript" src="../validations_for_inputs.js" ></script>
   <!-- <script  type="text/javascript" src="../face-api.min.js"> </script>
    <script type="text/javascript" src="../face-api.js"></script>
    <script  type="text/javascript" src="../face-recognition-signin.js"></script>   -->
</body>
</html>
