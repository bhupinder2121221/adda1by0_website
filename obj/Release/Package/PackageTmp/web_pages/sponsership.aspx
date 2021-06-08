<%@ Page MasterPageFile="~/web_pages/masterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="sponsership.aspx.cs" Inherits="add1By0.web_pages.sponsership" %>
<asp:Content ID="style" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/sponsership.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="work" ContentPlaceHolderID="fullWorkSpace" runat="server">
    <h1 class="heading_sponsership">Our Sponsership</h1>
    <div class="container-md" style="    max-width: 566px;">
    <asp:Image ID="mine" ImageUrl="~/images/1542594957.svg" runat="server" /> 
    </div>
        <div class="container-sm " style="height:42vh;">
        <div class="container-sm" >
            
            
            <div class="container-sm text-center">
                <marquee class="sponsers" width="60%" direction="up" style="height:39vh">
            <%int i; %>
            <%for(i = 0; i < namesOfSponsers.Count; i++){ %>
            
            <h1 class="name"><%=namesOfSponsers[i].ToString().ToUpper() %></h1>

            <%} %>
                    </marquee>
                </div>
        </div>

    </div>
    <div class="container-md" style="    max-width: 566px;">
    <asp:Image ID="Image1" ImageUrl="~/images/1542594957.svg" runat="server" /> 
        </div>
</asp:Content>