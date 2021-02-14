<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion_chatBox.aspx.cs" Inherits="add1By0.discussion_chatBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="App_Themes/css/discussion.css" />
     <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <style>
         .discussion-heading {
    color: rgb(158, 42, 43);
    width: 70%;
    text-align: center;
}
        .msg{
            background:rgb(255, 243, 176);
            color:rgb(84, 11, 14);
        }
        .mymsg{
            margin-left:20px;
            margin:5px; margin-top:2px;
            clear:both; padding-top:15px;
            background:rgb(255, 243, 176);
            color:rgb(84, 11, 14);
            border-radius:15px; 
            padding-left:45px; 
            display:block;
        }
    </style>
        <% if (IsMobileBrowser() == true)
            { %>
    <style>
        .msgTime-chatBox {
    display: inline-block;
    width: 200px;
    float: right;
    margin: 0px;
    margin-left: 20px;
    font-size: 2rem;
    

}
        .sendmsg-chatbox {
    display: inline-block;
    float: left;
    width: 63%;
    height: 70px;
    background-color: rgb(255, 230, 167);
    margin-left: 5%;
    border-radius: 10px;
    font-size: 3.2rem;
}
        .otherMassages-charBox {
    margin-left: 23px;
    padding: 0px;
    background-color: darkblue;
    border-radius: 17px;
    height: auto;
    overflow: initial;
    color: white;
    font-size: 2.1rem;
    font-weight: bolder;
    width: 66%;
    box-shadow: 3px 11px 22px rgb(0 0 0 / 50%);
}
        .picofuser {
            position: relative;
            height: 136px;
            width: 142px;
            background: darkblue;
            border-radius: 73px;
            top: 6px;
            left: 1px;
            border-style:solid;
        }
}
        .myuser-charBox {
            margin-left: 39%;
            padding: 1px;
            background-color: rgba(84, 11, 14,0.5);
            border-radius: 25px;
            height: auto;
            overflow: initial;
            color: rgb(255, 243, 176);
            font-size: 1rem;
            font-weight: bolder;
            width: 59%;
            font-size: 2rem;
        }
        .discussion-back-chatbox {
                margin: auto;
    margin-top: 13px;
    background-color: white;
    width: 100%;
    height: 99vh;
    border-radius: 49px;
        }

        .discussopn-postbtn-chatbox {
    display: inline-block;
    width: 196px;
    height: 71px;
    border-radius: 19px;
    background-color: saddlebrown;
    color: wheat;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 3.2rem;
    font-weight: bolder;
    margin-left: 20px;
    margin-top: 5px;
}

        

        .home-img-discussion {
    height: 100px;
    width: 100px;
    margin-left: 24px;
    transition: all linear 1s;
    margin-right: 119px;
    margin-top: 45px;
    position: fixed;
}
        h3{
                font-size: 4rem;
    text-transform: capitalize;
        }
        h4 {
            font-size:3rem;
        }
        .username-chatbox {
            display: inline-block;
            float: left;
            width: auto;
            margin: 0px;
            margin-left: 20px;
        }

        body{
            background:darkblue;
        }
        .discussion-back {
    margin: auto;
    margin-top: 40px;
    background-color: azure;
    width: 100%;
    height: auto;
    border-radius: 2.5%;
}
        .heading-home.discussion {
    color: darkblue;
    font-size: 3.5rem;
    text-align: end;
    padding: 21px;
    margin-bottom: -41px;
    margin-top: 1%;
    margin-left: 1%;
}
        .msg{
            background: skyblue;
    color: darkblue;
        }

        .sendmsg-chatbox {
    display: inline-block;
    float: left;
    width: 63%;
    height: 70px;
    background-color: skyblue;
    margin-left: 5%;
    border-radius: 10px;
    font-size: 3.2rem;
    color: darkblue;
}
        
.discussion-back-chatbox {
    margin: auto;
    margin-top: 13px;
    background-color: azure;
    width: 100%;
    height: 99vh;
    border-radius: 49px;
}
.discussopn-postbtn-chatbox {
    display: inline-block;
    width: 196px;
    height: 71px;
    border-radius: 19px;
    background-color: darkblue;
    color: white;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 3.2rem;
    font-weight: bolder;
    margin-left: 20px;
    margin-top: 5px;
}
        .chatbox-pane {
            height: 77%;
        }

        .myuser-charBox {
    margin-left: 37%;
    padding: 1px;
    background-color: darkblue;
    border-radius: 25px;
    height: auto;
    overflow: initial;
    color: white;
    font-size: 1rem;
    font-weight: bolder;
    width: 63%;
}
        .mymsg{
                margin-left: 20px;
    margin: 5px;
    margin-top: 2px;
    clear: both;
    padding-top: 15px;
    background: skyblue;
    color: darkblue;
    border-radius: 15px;
    padding-left: 45px;
    display: block;
    text-transform: capitalize;
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
                
                return true;
            }
            else
            {
                
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

            
     <% if (IsMobileBrowser() == true)
                { %>
     <a href="web_pages/homepage.aspx?Name=<%=Get_useremail %>"><lottie-player src="https://assets4.lottiefiles.com/private_files/lf30_lnlbyoqx.json"  background="transparent"  speed="0.75"  style="width:181px;height:185px;margin-right:50px;display:inline-block;float:left;"  loop  autoplay></lottie-player></a>
           
           <%} %>

            <% if (IsMobileBrowser() == false)
                { %>
             <a href="web_pages/homepage.aspx?Name=<%=Get_useremail %>"><img style="float:left; height: 83px;width: 80px;margin-left: 12px;" src="images/home-512.png" /></a>
          <%} %>


             
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
                    <h3 class="msg" style="margin-left:20px; margin:5px; clear:both; padding-top:15px;border-radius:15px;  padding-left:45px; display:block;"><%= Get_msges[i].ToString() %></h3>
                    
                </div>
                <%} %>
                <br />
                <% if(Get_usernames[i].ToString().ToUpper() == usernameHiddenField.Value.ToString().ToUpper())  { %>
                <div class="myuser-charBox">
                    
                    <h4 class="msgTime-chatBox"><%= Get_createdTime[i].ToString() %></h4>
                    <br />
                    <h4 class="mymsg" ><%= Get_msges[i].ToString() %></h4>
                    
                </div>
                <% } %>
                <br />
                <%} %>
            </div>
            <hr />
            <asp:TextBox ID="sendMsg_chatBox" CssClass="sendmsg-chatbox"    placeholder="Type Here : " runat="server"></asp:TextBox>
            
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
