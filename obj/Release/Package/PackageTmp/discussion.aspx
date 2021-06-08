<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion.aspx.cs" Inherits="add1By0.discussion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/css/discussion.css" />
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <style>
        .discussion-heading{
           color:rgb(158, 42, 43);
        }
        .discussion-heading {
    color: rgb(158, 42, 43);
    width: 70%;
    text-align: center;
}
    </style>
    <% if (IsMobileBrowser() == true)
        { %>
    <style>
        body{
            background:darkblue;
        }
     .view-discussion-btn {
        text-align: center;
    width: 194px;
    height: 84px;
    background-color: darkblue;
    color: white;
    border-radius: 29px;
    display: block;
    font-size: 3.5rem;
}
     .discussion-topics-time {
    font-size: 2.5rem;
    color: rgb(111, 29, 27);
    display: inline-block;
    margin-left: 50px;
    float: right;
    transform: translateY(-48px);
    margin-right: 50px;
}
     .discussion-topics-heading {
    display: inline-block;
    font-size: 3rem;
    width: 300px;
    margin-left: 50px;
}
     h1{
         font-size:3rem;
             font-size: 4rem;
    text-transform: capitalize;
     }
     h3{
         font-size:3rem;
     }
     .home-img-discussion {
    height: 112px;
    width: 117px;
    display: inline-block;
    float: left;
    margin-left: 50px;
    transition: all linear 1s;
    margin-right: 119px;
    margin-top: 58px;
}
     .discussion-back {
        margin: auto;
    margin-top: 39px;
    background-color: white;
    width: 99%;
    height: auto;
    border-radius: 49px;
}
     .discussion-topics-block {
    background-color: skyblue;
    padding: 12px;
    width: 94%;
    border-radius: 18px;
    margin: auto;
}
     .discussion-topics {
    display: block;
    width: 95%;
    margin: auto;
    background-color: darkblue;
    color: white;
    border-radius: 22px;
    border-bottom-right-radius: 1px;
}
     .heading-home.discussion {
    color: darkblue;
    font-size: 6.5rem;
    text-align: center;
    padding: 25px;
    margin-bottom: -50px;
    margin-top: 1%;
    margin-left: 1%;
}
     .discussion-heading{
         color:darkblue;
     }
     .add-discussion-pane {
    
    width: 100%;
    background-color: white;
    margin-top: 5px;
    margin-bottom: 30px;
    padding-top: 23px;
    overflow: hidden;
    transition: all ease-in-out 1s;
}
    </style>
    <%} %>
    <script type="text/javascript">
        function AutoRefreshPage(time) {
            setTimeout("location.reload(true)", time);
            console.log("refresd");
        }
    </script>
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
<body onload="Javascrip:AutoRefreshPage(1600000);">
    <form id="form1"  runat="server">
        <div class="discussion-back">
            <h1 class="heading-home discussion">Discussion Portal</h1>
            <% if (IsMobileBrowser() == true)
                { %>
            <a href="web_pages/homepage.aspx?Name=<%=userName.Text %>"><lottie-player src="https://assets4.lottiefiles.com/private_files/lf30_lnlbyoqx.json"  background="transparent"  speed="0.75"  style="width:181px;height:185px;margin-right:50px;display:inline-block;float:left;"  loop  autoplay></lottie-player></a>
            <%} %>

            <% if (IsMobileBrowser() == false)
                { %>
              <a href="web_pages/homepage.aspx?Name=<%=userName.Text %>"><img style="float:left; height: 83px;width: 80px;margin-left: 12px;" src="images/home-512.png" /></a>
          

            <%} %>
            <br />
            <br />
            <h3 class="discussion-heading" style="display:inline-block;  margin:10px;">Discussion Topic</h3>
            <asp:Panel ID="add_discussion_panel" CssClass="add_discussion_panel"  runat="server">
                    <div class="add-discussion">
                        <h3 class="add-discussion-text" style="text-align:center; left:50px; z-index:5; position:absolute; font-size:1.5rem; margin:auto; margin-top:4.5px;" onclick="discussionPane()"> + Add Topic</h3>
                        <div class="add-discussion-newcolor"></div>
                    </div>
             </asp:Panel>
            
            
            <hr style="transform:translateY(-5px);" />
            <div id="add-discussion-pane-id" class="add-discussion-pane">
                <div class="add-discussion-pane-box">
                    <h1 id="discussion-topics-heading-id" class="discussion-topics-heading"  style="text-align:center;box-shadow: 10px 10px 11px rgba(0,0,0,0.5);">Add Topic</h1>
                    <br />
                    <asp:Label ID="teacherName" CssClass="discussion-labels" runat="server" Text="Teacher Name : "></asp:Label>
                    <asp:TextBox ID="userName" CssClass="discussion-inputs" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="topicName" CssClass="discussion-labels" runat="server" Text="Topic Name : "></asp:Label>
                    
                    <asp:TextBox ID="topicNameBox" CssClass="discussion-inputs textarea"  Width="500px" Height="120px" TextMode="MultiLine" Columns="6" Rows="5" MaxLength="290" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="topicnameValidation" ControlToValidate="topicNameBox" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*Required" Text="* Required" runat="server"></asp:RequiredFieldValidator>
                    <asp:Button ID="submitPost" CssClass="discussopn-postbtn" Text="Post"  OnClick="submitPost_Click" runat="server" />
                </div>
            </div>

            <% for (int i = 0; i < Get_discussionName.Count; i++){ %>
       
            <div class="discussion-topics-block " style="box-shadow: 10px 10px 11px rgba(0,0,0,0.5);">
                <div>
            <h1 class="discussion-topics-heading">By : <%= Get_teacherName[i].ToString().ToUpper() %> </h1>
             <h1 class="discussion-topics-time">Created at : <%= Get_createdTime[i].ToString() %> </h1>
                </div>
              <div class="discussion-topics">
                <h1 class="discussion-topics-name"> <%= Get_discussionName[i].ToString() %> </h1>
            </div>
                <a class="view-discussion-btn" href="discussion_chatBox.aspx?id=<%=Get_id[i]+"&name="+userName.Text+"&teacherGroup="+Get_teacherName[i] %>"> View</a>
            </div>
            <br />
            <% }%>
            
        </div>
        
    </form>
    <script type="text/javascript" src="add_topic_discussion.js"></script>
</body>
</html>
