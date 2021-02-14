<%@ Page Language="C#" AutoEventWireup="true" Theme="css" CodeBehind="loginPage.aspx.cs" Inherits="add1By0.web_pages.loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    
   <script runat="server">


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
                   name.Text = "not a valid file";
               }

           }

       }

       void Page_Load(object sender, EventArgs e)
       {
           if (chooseoption.SelectedValue == "webcam")
           {
               webcam_security_panel_signin.Visible = true;
               password_security_panel_signin.Visible = false;
           }
           else
           {

               webcam_security_panel_signin.Visible = false;
               password_security_panel_signin.Visible = true;
           }



         



           if (chooseoption.SelectedValue == "webcam")
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
    <title>Adda1by0 | Registration</title>
</head>
<body>
    <asp:Image ID="comparetoimage" runat="server" />
    <div class="background-pic" style="margin-top:-21px;">
    <br /><br />
    <div class="login-backpage">
        <div class="login-portal">
    <form id="form1" method="post" runat="server">
        <div>
            <asp:HiddenField ID="pathToImageUpload" Value="" runat="server" />
            <asp:Label ID="heading" CssClass="heading" runat="server">Registration Portal</asp:Label>
            <hr style="margin-top:-25px;" />
            <br /><br />
            <asp:Label ID="name" CssClass="logup-details left" AssociatedControlID="nameBox" runat="server">First Name </asp:Label>
            <asp:TextBox ID="nameBox" CssClass="login-inputs left" placeholder="Eg. Harry" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lastName" CssClass="logup-details left" AssociatedControlID="lastNameBox" runat="server">Last Name </asp:Label>
            <asp:TextBox ID="lastNameBox" CssClass="login-inputs left" placeholder="Eg. Potter" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="age" CssClass="logup-details left" AssociatedControlID="ageBox" runat="server">Age </asp:Label>
            <asp:TextBox ID="ageBox" CssClass="login-inputs left" Text="" placeholder="Eg. 18" TextMode="Number" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="classs" CssClass="logup-details left" AssociatedControlID="classBox" runat="server">Class</asp:Label>
            <asp:DropDownList ID ="classBox" CssClass="login-inputs left" runat="server">
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

            <br />
            <asp:Label ID="phno" CssClass="logup-details left" AssociatedControlID="phnoBox" runat="server">Ph. Number</asp:Label>
            <asp:TextBox ID="phnoBox" CssClass="login-inputs left" TextMode="Number" placeholder="0123456789" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="email" CssClass="logup-details left" AssociatedControlID="emailBox" runat="server">Email</asp:Label>
            <asp:TextBox ID="emailBox" CssClass="login-inputs left" TextMode="Email" placeholder="Eg abc@gmail.com" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="password" CssClass="logup-details left" AssociatedControlID="passwordBox" runat="server">Password</asp:Label>
            <asp:TextBox ID="passwordBox" CssClass="login-inputs left" placeholder="includes a-z A-Z 0-9 @ _"  TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="rewritePassword" CssClass="logup-details left" AssociatedControlID="rewritePasswordBox"  runat="server">Rewrite Password</asp:Label>
            <asp:TextBox ID="rewritePasswordBox" CssClass="login-inputs left" placeholder="includes a-z A-Z 0-9 @ _" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
           
            <asp:Label ID="security" CssClass="logup-details left" runat="server">For Security</asp:Label>
            
                
             <div class="login-inputs left" >
                    <asp:DropDownList ID="chooseoption"  runat="server" AutoPostBack="true" CssClass="login-inputs left">
                        <asp:ListItem id="ListItem1"  Text="Web Camera" Value="webcam" runat="server"></asp:ListItem>
                        <asp:ListItem id="ListItem2" Text="Image Uplaod" Value="fileupload" runat="server"></asp:ListItem>
                    </asp:DropDownList>
                   
                 
                      
                 </div>
            <asp:Button ID="choosebtn" Text="Go!" CssClass="choose-btn-registration" runat="server" />

            <br />
            
               
            <div class="security">
             <asp:Panel ID="webcam_security_panel_signin" Visible="true" CssClass="security" runat="server">
                     <div class="camera-section visible">  
              

                    <div class="camera">
                        <video id="video">Video stream not available.</video>
                    </div>
                    <canvas id="canvas" class="d-none"></canvas>
                    <div class="output">
                         <asp:Image id="photo" alt="The screen capture will appear in this box." runat="server"></asp:Image> 
                     </div>
                              <br />
                              <br />
                        <button id="startbutton" onclick="take_snap()" class="login-inputs">SNAP</button>
                    </div>
                 </asp:Panel>
               

           
                <asp:Panel ID="password_security_panel_signin" Visible="false" CssClass="security"  runat="server">          
                   
                    <asp:FileUpload ID="FileUpload"  CssClass="login-inputs left file-choose"    runat="server" />
                    
                    <asp:Button ID="fileshow" CssClass="showfile" Text="Show --> " OnClick="fileshow_Click" runat="server" />
                     <asp:Image ID="uploadedImg" CssClass="login-inputs"  runat="server" Width="200px" Height="150px" />
                 </asp:Panel>
                
            </div>
                      <br />
            
            <asp:Button ID="submit"  CssClass="submit-btn registration" runat="server"  OnClick="submit_Click" Text="Submit" />
            <a href="signInPage.aspx"><h3 style="margin-left: 64%;width: 100%;margin-top: 10px;"> Have account? Login Here...</h3> </a>
           <asp:HiddenField ID="hiddenurl" runat="server" />
                  </div>
        <div class="errorMsg registration">
            <h3 style="color:wheat;">Oh! Error List</h3>
            <asp:Label ID="error" ForeColor="Wheat" Text="No Error Hurray!" runat="server"></asp:Label>
        </div>
    </form>
        </div>
        
    </div>
    <script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
    <script type="text/javascript" src="../webcamClicking_picture.js"></script>
    
   
</div>
</body>
   
</html>
