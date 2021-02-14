<%@ Page MasterPageFile="~/web_pages/masterPage.Master"  Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="add1By0.web_pages.homepage" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>
<asp:Content ID="fonts" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/homePage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet" />
</asp:Content>
<asp:Content ID ="homeback" ContentPlaceHolderID="fullWorkSpace"  runat="server">
    
    <div class="homeBack">
        <br />
        <br />
        <div class="heading-home"><h1 style="font-family: 'Stylish', sans-serif;text-align:center; font-size:2.9rem; color:purple;">WELCOME  IN ADDA1BY0</h1></div>
        <div class="barline-home"></div>
        <br />

        <div class="HomeIntro">
            <div class="HomeIntoText">
                <h1 style="font-weight:bold;">Online Coaching</h1>
                <h3>By Adda1By0</h3>
                <h3>A Free Platform To Upgrade Your Skills</h3>
                <br />
                <br />
               <a href="Redirecting.aspx?Name=<%=Master.get_emailId.ToString().ToLower() %>&booking=frmhmtrdrpg"> <h1 class="home-btn">Book Now</h1></a>
            </div>
            <div class="HomeIntroPic">

            </div>
            <br />
            <br />
        </div>
        <div class="below-intro-home">
                <h1 class="choose-Home-Text">Why Adda1By0 Only ?</h1>
                <div class="choos-img-home">
                    <div class="ans-home-pic">
                        <asp:Image ID="pic1" runat="server" CssClass="ans-home-pic-img" AlternateText="ans-img" ImageUrl="~/images/indea-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Large Study Resources </h3>
                </div>
                <div class="choos-img-home">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image1" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/discuss-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Discuss Your Doubts </h3>
                </div>
                <div class="choos-img-home">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image2" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/certificates-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Get ISO Certificates </h3>
                </div>
                <div class="choos-img-home">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image3" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/become-creative-home.png" />
                    </div>
                    <h3 class="choose-img-text-home">Share Your Thoughts</h3>
                </div>
             
                <div class="choos-img-home">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image4" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/all-world-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> International Techers </h3>
                </div>
            </div>
        <br />
        <br />
        <div class="features-home">
            <div class="features-text-home">
                <h3>Heading</h3>
                <h3>Heading</h3>
                <h3>Heading</h3>
                <h3>Heading</h3>
                <h3>Heading</h3>

            </div>
            <div class ="features-pic-home"></div>

        </div>
        <br />
        <br />
        <h1 style="font-family:'Stylish', sans-serif;font-weight:bolder;text-align:center;">Advantages Are</h1>
        <div class="barline-home"></div>
        <br />
        <br />
        <div class="advantage-home">
            <div class="advantage-element-home">
                <h3 class="advantage-text-home-header">Personalised extra classes</h3>
                <h4 class="advantage-text-home">Students can attend extra classes with BYJU’S teachers for additional support. This will help them to revise missed lessons, prepare for exams and improve weak topics.</h4>
            </div>
            <div class="advantage-element-home">
                <h3 class="advantage-text-home-header">Classes by India's top teachers</h3>
                <h4 class="advantage-text-home">Every class will be taught using visual aids to make learning simple and engaging. Students can also get their doubts solved immediately from assigned teachers during the class to strengthen conceptual understanding.</h4>
            </div>
            <div class="advantage-element-home">
                <h3 class="advantage-text-home-header"> Individual attention from mentors</h3>
                <h4 class="advantage-text-home">BYJU’S mentors are aided by technology to guide and support students throughout. They will keep track of students' learning blueprint and suggest how to learn better, improve on their weak areas and score higher.</h4>
            </div>
           
        </div>
        <br />

        
      </div>
       
    
</asp:Content>




<asp:Content ID="googlemap" ContentPlaceHolderID="scripts" runat="server">
 
 
</asp:Content>