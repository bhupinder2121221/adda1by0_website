<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion_chatBox.aspx.cs" Inherits="add1By0.discussion_chatBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="App_Themes/css/discussion.css" />
    
    <title></title>
</head>
<body onload="Javascrip:AutoRefreshPage(5000);">
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
