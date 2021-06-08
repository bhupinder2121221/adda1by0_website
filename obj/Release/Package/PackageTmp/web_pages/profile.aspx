<%@ Page MasterPageFile="~/web_pages/masterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="add1By0.web_pages.profile" %>

<asp:Content ID="fonts" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/profile.css" />
    <link rel="stylesheet" href="../App_Themes/css/aboutPage.css" />
    </asp:Content>


<asp:Content ID="content" ContentPlaceHolderID="fullWorkSpace" runat="server">
    <div class="container-fluid">
        <img src="../images/floral-1751088.svg" />
    </div>
    
        <div class="container-md">
            <h1 class="profile_heading"> Profile </h1>
        </div>
       
        <div class="container-sm">
        <table style="height:900px; width:44%;margin:auto"  class=" table ">
           
            
            <tr style="width:100%" >
                <td style="width:100%"></td>
                
                <td class="profile_right" style="width:100%">
                    <div class="photo" style="width:250px;overflow:hidden;">
                   <%if (userpic == "")
                       { %>
                        
                        <asp:Image ID="profilePic" CssClass="profilePicstyle" ImageUrl="~/images/user.svg" runat="server" />
                        <%} %>
                    <%if (userpic != "")
                        { %>
                        <img id="profilePic" class="profilePicstyle" alt="User Pic" src="<%=userpic %>" />
                       <%} %>
                    <div class="pic-edit">
                        <h1 id="picEdit" onclick="epit_pic_method() " class="edit_pic_btn" style="font-size: 2rem;padding:0px; padding-top: 35%; padding-left:18%"> Edit</h1>
                        <input id="upload_pics"  type="file" name="EDIT"  accept=".jpg,.jpeg,.png" style="text-align:center;display:none; color:white;padding:85px;cursor:pointer;" onclick="epit_pic_method()" runat="server" />
                    </div>
                        </div>
                </td>
            </tr>
            <tr style="width:100%">
                <td class="profile_left " style="width:100%">Name</td>
                
                <td class="profile_right" style="width:100%">
                    <asp:TextBox ID="textbox1" Enabled="false" CssClass="profile-details-box" Text="Bhupinder" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="name" runat="server" SetFocusOnError="true" Text="*Required" ForeColor="Red" ControlToValidate="textbox1"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="namecustom" runat="server" SetFocusOnError="true" OnServerValidate="namecustom_ServerValidate" ControlToValidate="textbox1" Text="*Only Text" ForeColor="Red" ></asp:CustomValidator>
                </td>
            </tr>
            <tr style="width:100%" >
                <td class="profile_left" style="width:100%">Class</td>
                
                <td class="profile_right" style="width:100%">
                    <asp:DropDownList Enabled="false" ID ="classBox" CssClass="profile-details-box"   runat="server">
               
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
                </td>
            </tr>
            <tr style="width:100%">
                <td class="profile_left" style="width:100%">Premium Membership</td>
               
                <td class="profile_right" style="color:darkorange;width:100%"> 
                    <%if (premiumMembership_status == "true")
                        { %>
                    Yea! You are our Premium Member.
                    <%} %>
                    <%if (premiumMembership_status != "true")
                        { %>
                    <a href="premiumMembership.aspx?Name=<%=useremail.ToString() %>"> No.   Get Premium!</a>
                    <%} %>

                </td>
            </tr>
            <tr style="width:100%">
                <td class="profile_left"style="width:100%">Age</td>
               
                <td class="profile_right" style="width:100%">
                    <asp:TextBox ID="textbox2" Enabled="false" CssClass="profile-details-box" Text="20" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" runat="server" Text="*Required" ForeColor="Red" ControlToValidate="textbox2"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="age_validate" runat="server" SetFocusOnError="true" Text="Only 1 to 25 allowed" ControlToValidate="textbox2" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="25"></asp:RangeValidator>
                </td>

            </tr>
            <tr style="width:100%">
                <td class="profile_left" style="width:100%">Phone Number</td>
               
                <td class="profile_right" style="width:100%">
                    <asp:TextBox ID="textbox3" Enabled="false" CssClass="profile-details-box" Text="790196491" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" runat="server" Text="*Required" ForeColor="Red" ControlToValidate="textbox3"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="phonenumber_Customvalidation" SetFocusOnError="true" runat="server" Text="" ForeColor="Red" ControlToValidate="textbox3" OnServerValidate="phonenumber_Customvalidation_ServerValidate"></asp:CustomValidator>
                </td>
               
            </tr>
            <tr style="width:100%">
                <td class="profile_left" style="width:100%">Email</td>
                
                <td class="profile_right" style="width:100%"><%=useremail %></td>
            </tr>
            
            
            <tr style="width:100%">
                
                <td class="profile_mid " style="width:100%">
                    <asp:Button ID="edit_btn" CssClass="profile-btn" OnClick="edit_btn_Click" Text="Edit" runat="server" />
                    <asp:Button ID="save_btn" Visible="false" CssClass="profile-btn" OnClick="save_btn_Click" Text="Save" runat="server" />
                </td>
                <td style="width:100%">

                </td>
                
            </tr>
            
        </table>
            </div>
    <script type="text/javascript">
        function epit_pic_method() {
            console.log("edit pic clicked");
            document.getElementById("<%=upload_pics.ClientID%>").click();
        }

        window.addEventListener('load', function () {
            document.querySelector('input[type="file"]').addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    var img = document.getElementById("profilePic");  // $('img')[0]
                    var sourceOfImage = URL.createObjectURL(this.files[0]); // set src to blob url
                    if (validateFileType()) {
                        img.src = sourceOfImage;
                        img.onload = imageIsLoaded;


                    }
                    else {
                        alert("Only jpg/jpeg and png files are allowed!");
                    }



                }
            });
        });


        function imageIsLoaded() {
            alert("Image Loaded.");

        }



        function validateFileType() {
            var fileName = document.getElementById("<%=upload_pics.ClientID%>").value;
            var idxDot = fileName.lastIndexOf(".") + 1;
            var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
            if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
                return true;
            } else {

                return false;
            }
        }

    </script>
</asp:Content>