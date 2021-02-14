<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion.aspx.cs" Inherits="add1By0.discussion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function AutoRefreshPage(time) {
            setTimeout("location.reload(true)", time);
            console.log("refresd");
        }
    </script>
    <link rel="stylesheet" href="App_Themes/css/discussion.css" />
    
    <title></title>
</head>
<body onload="Javascrip:AutoRefreshPage(5000);">
    <form id="form1"  runat="server">
        <div class="discussion-back">
            <h1 class="heading-home discussion">Discussion Portal</h1>
            <a href="web_pages/homepage.aspx?Name=<%=userName.Text %>"><asp:Image ID="home_img" CssClass="home-img-discussion" ImageUrl="~/images/home-512.png" runat="server" /></a>
            <br />
            <br />
            <h3 style="display:inline-block; color:rgb(158, 42, 43); margin:10px;">Discussion Topic</h3>
            <asp:Panel ID="add_discussion_panel" CssClass="add_discussion_panel"  runat="server">
                    <div class="add-discussion">
                        <h3 class="add-discussion-text" style="text-align:center; left:50px; z-index:5; position:absolute; font-size:1.5rem; margin:auto; margin-top:4.5px;" onclick="discussionPane()"> + Add Topic</h3>
                        <div class="add-discussion-newcolor"></div>
                    </div>
             </asp:Panel>
            
            
            <hr style="transform:translateY(-5px);" />
            <div id="add-discussion-pane-id" class="add-discussion-pane">
                <div class="add-discussion-pane-box">
                    <h1 id="discussion-topics-heading-id" class="discussion-topics-heading"  style="text-align:center;">Add Topic</h1>
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
       
            <div class="discussion-topics-block">
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
