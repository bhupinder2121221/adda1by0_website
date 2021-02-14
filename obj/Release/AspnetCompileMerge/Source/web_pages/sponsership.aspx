<%@ Page MasterPageFile="~/web_pages/masterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="sponsership.aspx.cs" Inherits="add1By0.web_pages.sponsership" %>
<asp:Content ID="style" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/sponsership.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="work" ContentPlaceHolderID="fullWorkSpace" runat="server">
    <div class="backpage" style="height:90vh;">
        <div class="letter" >
            
            <h1 class="heading_sponsership">Our Sposership</h1>
            <div class="namesspace">
            <%int i; %>
            <%for(i = 0; i < namesOfSponsers.Count; i++){ %>
            
            <h1 class="name"><%=namesOfSponsers[i].ToString().ToUpper() %></h1>

            <%} %>
                </div>
        </div>

    </div>
</asp:Content>