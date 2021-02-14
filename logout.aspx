<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="add1By0.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script runat="server">
        void Page_Load(object sender, EventArgs e)
        {
            deleteallsessions();
            Response.Redirect("web_pages/homepage.aspx");
        }

    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Logout</h1>
            <asp:Label ID="logouttext" Text="" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
