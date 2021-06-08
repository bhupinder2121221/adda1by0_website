<%@ Page Language="C#" AutoEventWireup="true" Theme="css" CodeBehind="signInPage.aspx.cs" Inherits="add1By0.web_pages.signInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="../bootsrap/bootstrap-5.0.0-beta1-dist/css/bootstrap.min.css" />
    <script src="../bootsrap/bootstrap-5.0.0-beta1-dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .HomeIntro {
    height: 580px;
    width: 200%;
    overflow-x:hidden;
    
    
    background: url("../../images/banner-bg.svg");
    background-size: contain;
    
    background-repeat:no-repeat;
}
        .anotheremail {
            width: 100%;
    background: white;
    border-radius: 10px;
    font-size: 1.4rem;
    text-transform: capitalize;
    font-weight: bold;
    cursor:pointer;
   
        }
    </style>
   

    <script runat="server">
        public string emailpresent = "";
        public string cookiepresent = "";
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

        void Page_Load(object sender, EventArgs e)
        {



            if (ifcookiePresent())
            {
                emailpresent = Request.Cookies["Adda1By0_cookies"]["email"];
                cookiepresent = "yes";
                useanotheridpanel.Visible = true;
            }
            else
            {
                useanotheridpanel.Visible = false;
                cookiepresent = "no";
            }
        }
    </script>
    <script type="text/javascript">
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
    <title></title>

</head>
<body  style="background:none;">
    



        <form id="form1" runat="server">

            <!--Automatic login-->
            <asp:Panel ID="useanotheridpanel" runat="server">
            <div class="container-fluid" style="z-index: 54;position: fixed; height: 100vh;">
           
         <div class="container-sm" style="margin-top:40vh;padding:20px; max-width:375px;   background: darkblue;border-radius: 10px;">
            <h2 style="color:white;">Adda1By0</h2>
             <a style="background: white;border-radius: 10PX;color: darkblue;font-family: cursive;font-size:1.1rem!important;" href="homepage.aspx">
    <div class="container-sm">
      <h3 style="font-size:1.1rem!important">Continue as <%=emailpresent %>  </h3>
  </div>
      </a>
    <hr style=" margin-top: 83px;color: white;height: 3px;" />
    <div class="container-sm anotheremail"  onclick="useanotheremailfunction()"><h3>Use Another Email</h3></div>
   
        </div>
                </div>
                </asp:Panel>
            <!---->

            <div id="loginfullpage" class="row" style="height:100%;">
                <div class="col-sm-6" style="height:100vh;background-color:white">

            <div class="container-md" style="margin-top:14%;color:darkblue">
              <h2>Adda1By0</h2>
              <div class="display-2 text-center fw-bolder headind-login"> Login Portal</div>
                <div class="form-group">
                  <label for="uname">Username:</label>
                   <asp:TextBox ID="name_signin_box" CssClass="form-control" placeholder="Enter username" runat="server" required></asp:TextBox>
              

                      <div class="valid-feedback">Valid.</div>
                      <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                 <div class="form-group">
                   <label for="validationServer04" class="form-label">State</label>
                              <asp:DropDownList ID="loginasBox_signin" CssClass="form-select is-valid" AutoPostBack="true" runat="server">
                                 <asp:ListItem id="student_dropdown_signin" Value="student" runat="server" >Student</asp:ListItem>
                                 <asp:ListItem ID="Admin_dropdown_signin" Value="admin" runat="server">Admin</asp:ListItem>
                           </asp:DropDownList>
                    <div id="validationServer04Feedback" class="invalid-feedback">
                      Plese select "Login As" option
                    </div>
                 </div>
                <div class="form-group">
                     <label for="validationServerUsername" class="form-label">Email</label>
                    <div class="input-group has-validation">
                      <span class="input-group-text" id="inputGroupPrepend3">@</span>
                        <asp:TextBox ID="emailbox" Placeholder="abc@gmail.com" CssClass="form-control" runat="server" ></asp:TextBox>
                       <div id="validationServerUsernameFeedback" class="invalid-feedback">
                        Please Type Your Email.
                      </div>
                    </div>
                </div>
             <div class="form-group">
                 <label for="passwordBox">Password:</label>
                  <asp:TextBox ID="passwordBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
            </div>
                <div class="form-group form-check text-center">
              <label class="form-check-label">
                  <input id="remembermecheckbox" runat="server" class="form-check-input" type="checkbox" name="remember" > Remember Me.
               
                  </label>
            </div>
            <div class="form-group form-check text-center">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> I agree Terms and Conditions.
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this checkbox to continue.</div>
              </label>
            </div>
      <div style="width:100%;text-align:center">
          <asp:Button ID="submit"  CssClass="btn btn-primary" Text="Submit" runat="server" OnClick="signin_btn" />
    
          </div>

</div>
</div>
                <% if (IsMobileBrowser() == false)
                    { %>
                <div class="col-sm ">
                    <div class="row">
                        <div class="display-2" style="text-align: center;    font-weight: bold;    font-family: cursive;">Where Journey Begins.</div>
                    </div>
                </div>
                <%} %>
                </div>







              








            </form>
       <%if (cookiepresent == "yes")
           { %>
    <script type="text/javascript" >
        document.getElementById("loginfullpage").style.opacity = "0.2";
        function useanotheremailfunction() {
            console.log("use another email");
            document.getElementById("loginfullpage").style.opacity = "1";
            document.getElementById("useanotheridpanel").style.display = "none";
        }
    </script>
    <%} %>
   <script type="text/javascript" src="../webcamClicking_picture.js">  </script> 
    <script type="text/javascript" src="../validations_for_inputs.js" ></script>
   <!-- <script  type="text/javascript" src="../face-api.min.js"> </script>
    <script type="text/javascript" src="../face-api.js"></script>
    <script  type="text/javascript" src="../face-recognition-signin.js"></script>   -->
</body>
</html>
