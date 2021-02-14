<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adding_Streaming.aspx.cs" Inherits="add1By0.Adding_Streaming" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <link rel="stylesheet" href="App_Themes/css/livestreamingPortal.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="background">
            <div class="portal">
                <h1 style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-weight:bolder;margin:auto;margin-bottom:30px; color:white;text-align:center;">Live Streaming</h1>
                <h3 class="portal-labels">Topic Name </h3>
                <asp:TextBox ID="topicName_box" CssClass="portal-text-boxes" runat="server"></asp:TextBox>
                
                <br />
                <h3 class="portal-labels">Date of Lecture </h3>
                <asp:TextBox ID="dateBox" runat="server" CssClass="portal-text-boxes" TextMode="Date"></asp:TextBox>
                
                <br />
                <h3 class="portal-labels">Time </h3>
                <asp:TextBox ID="timeBox" CssClass="portal-text-boxes" runat="server" TextMode="Time"></asp:TextBox>
               
                <br />
                <h3 class="portal-labels">Teacher Name </h3>
                <asp:TextBox ID="teacherNameBox" CssClass="portal-text-boxes" runat="server" Text="" Enabled="false"></asp:TextBox>
                   <asp:Button ID="golive" CssClass="golive_btn" Text="Go Live !" OnClick="golive_Click" runat="server" />
             <div class="validationDiv">
                 <h3 style="color:red; font-size:1.2rem;">Error List :</h3>
                <asp:RequiredFieldValidator ID="topicname"  CssClass="validation" Text="Topic Required" ControlToValidate="topicName_box" runat="server"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation"  Text="Time Required" ControlToValidate="timeBox" runat="server"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation"  Text="Date Box Required" ControlToValidate="dateBox" runat="server"></asp:RequiredFieldValidator>
               </div>
                 <br />
             
            </div>
        </div>
    </form>
</body>
</html>
