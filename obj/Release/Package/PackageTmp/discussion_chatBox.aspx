<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion_chatBox.aspx.cs" Inherits="add1By0.discussion_chatBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="App_Themes/css/discussion.css" />

        <% if (IsMobileBrowser() == true)
            { %>
    <style>
        .otherMassages-charBox {
    margin-left: 21px;
    padding: 0px;
    background-color: rgb(84, 11, 14);
    border-radius: 17px;
    height: auto;
    overflow: initial;
    color: rgb(255, 243, 176);
    font-size: 2.1rem;
    font-weight: bolder;
    width: 66%;
}
        .picofuser {
    position: relative;
    height: 90px;
    width: 101px;
    background: red;
    border-radius: 51px;
    top: 6px;
    left: 0px;
}
        .discussion-back-chatbox {
    margin: auto;
    margin-top: 7px;
    background-color: rgb(255, 243, 176);
    width: 92%;
    height: 98vh;
    border-radius: 0.5%;
}
        .discussopn-postbtn-chatbox {
    float: right;
    display: inline-block;
    width: 148px;
    height: 62px;
    border-radius: 32px;
    background-color: saddlebrown;
    color: wheat;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 2.2rem;
    font-weight: bolder;
    margin-left: 20px;
    margin-top: 5px;
    margin-right: 77px;
}
        .sendmsg-chatbox {
    display: inline-block;
    float: left;
    width: 88%;
    height: 59px;
    background-color: rgb(255, 230, 167);
    margin-left: 5%;
    border-radius: 10px;
    font-size: 2.2rem;
}
        .home-img-discussion {
    height: 95px;
    width: 90px;
    display: inline-block;
    float: left;
    margin-left: 50px;
    transition: all linear 1s;
}
    </style>
    <%} %>

    <script runat="server">
        public bool IsMobileBrowser()
        {
            String labelText = "";
            System.Web.HttpBrowserCapabilities myBrowserCaps = Request.Browser;
            if (((System.Web.Configuration.HttpCapabilitiesBase)myBrowserCaps).IsMobileDevice)
            {
                labelText = "Browser is a mobile device.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('"+ labelText + "');", true);
      
                return true;
            }
            else
            {
                labelText = "Browser is not a mobile device.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('"+ labelText + "');", true);
      
                return false;
            }
              }
    </script>
    <title></title>
</head>
<body onload="Javascrip:AutoRefreshPage(555000);">
    <form id="form1" onsubmit="postbtn" runat="server">
        <!--   hidden field for username -->
        <asp:HiddenField id="usernameHiddenField" Value="" runat="server" />
        <asp:HiddenField ID="teacherNameHiddenField" value="" runat="server" />
        <asp:HiddenField ID="signinOrNot" Value="" runat="server" />
        <asp:HiddenField ID="msgtosend" Value="" runat="server" />


        <div class="discussion-back-chatbox">
             <a href="web_pages/homepage.aspx?Name=<%=Get_useremail %>"><asp:Image ID="home_img" CssClass="home-img-discussion" ImageUrl="~/images/home-512.png" runat="server" /></a>
           
            <h1 class="heading-home discussion"><%="Teacher Group : "+Get_teacherName %></h1>
            <br />
            <hr />
            
            <div id="chatboxPane" class="chatbox-pane">
                <% for (int i = 0; i < Get_msges.Count; i++)
                    { %>
                <% if (Get_usernames[i].ToString().ToUpper() != usernameHiddenField.Value.ToString().ToUpper())
                    { %>
                <div class="picofuser" style="overflow:hidden;"><img height="100%" width="100%" src="App_Themes/User_uploaded_Pics/<%= Get_usernames[i].ToString() %>.png" /></div>
                <div class="otherMassages-charBox">
                    <h4 class="username-chatbox"><%= Get_usernames[i].ToString() %></h4>
                    <h4 class="msgTime-chatBox"><%= Get_createdTime[i].ToString() %></h4>
                    <br />
                    <h3 style="margin-left:20px; margin:5px; clear:both; padding-top:15px;background:rgb(255, 243, 176);color:rgb(84, 11, 14);border-radius:15px;  padding-left:45px; display:block;"><%= Get_msges[i].ToString() %></h3>
                    
                </div>
                <%} %>
                <br />
                <% if(Get_usernames[i].ToString().ToUpper() == usernameHiddenField.Value.ToString().ToUpper())  { %>
                <div class="myuser-charBox">
                    
                    <h4 class="msgTime-chatBox"><%= Get_createdTime[i].ToString() %></h4>
                    <br />
                    <h4 style="margin-left:20px; margin:5px;  clear:both; padding-top:15px;background:rgb(255, 243, 176);color:rgb(84, 11, 14);border-radius:15px; padding-left:45px; display:block;"><%= Get_msges[i].ToString() %></h4>
                    
                </div>
                <% } %>
                <br />
                <%} %>
            </div>
            <hr />
            <asp:TextBox ID="sendMsg_chatBox" CssClass="sendmsg-chatbox"  OnTextChanged="sendMsg_chatBox_TextChanged"  placeholder="Type Here : " runat="server"></asp:TextBox>
            
            <asp:Button ID="postbtn" CssClass="discussopn-postbtn-chatbox" OnClick="postbtn_Click"  Text="Post" runat="server" />
        </div>
    </form>
    <script type="text/javascript" src="discussion_javascript.js"></script>
     <script type="text/javascript">

         const msg = document.getElementById('<%= sendMsg_chatBox.ClientID%>');
        
        
        
        

        
         function AutoRefreshPage(time) {
             console.log("msg to send=" + document.getElementById("sendMsg_chatBox").value + msg.value);
             
             setTimeout("location.reload(true)", time);
             console.log("refresd");
         }
     </script>
</body>
</html>
