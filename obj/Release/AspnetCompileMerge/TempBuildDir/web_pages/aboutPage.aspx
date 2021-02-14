<%@ Page Language="C#" MasterPageFile="~/web_pages/masterPage.Master"  AutoEventWireup="true" CodeBehind="aboutPage.aspx.cs" Inherits="add1By0.web_pages.aboutPage" %>
<asp:Content
    id="linking"
    ContentPlaceHolderID="linker"
    runat="server"
    >
    <link rel="stylesheet" href="../App_Themes/css/aboutPage.css" />
</asp:Content>


<asp:Content
    id="backpage_about"
    ContentPlaceHolderID="fullWorkSpace"
    runat="server"
    >
    <div class="backpage">
        <div class="heading">
            <h1 class="heading1">WE Are Leading One</h1>
           <!-- <br />-->
            <p class="heading2">Fastest Response Ever have recorded !</p>
            
            <h1 class="barline"></h1>
        </div>
        <div class="outerBox">
        <div class="intro">
            <div class="writtenIntro" style="width:53%" >
                <h1 ><firstletter>W</firstletter>hat We Do</h1>
                <h4>We provide a rich content of education to you.<br /> Our tutors are international so you get full knowledge of your subjects/</h4>
                <h4>You can access offline courses whenever you want, whereever you want. We are everytime with you. </h4>
                <h4>Here in discussion portal you can discuss your doubts with your tutor and also with your friends too !</h4>
                <h4>Besides it, we are providing extra classes for your overall development in premium accout. </h4>
                <br />
                <br />
                <h3 style="color:darkblue;"> S0... Pack your bags and get ready for an exciting trip to world of knowledge.</h3>
            </div>
          
                <img style="width:40%" class="img" src="../images/intro.jpg" alt="intro pic" />
            
        </div>
       </div>
        <br /><br /><br />
        <div class="allquestions" style="transition:all linear 1s;">
         <% int i = 0; %>
            <% for (i = 0; i < questionsFAQ.Count; i++)
                { %>
        <div class="question" id="question<%=i %>" style="overflow:hidden; ">
            <img class="quesImg" src="../images/question.png" alt="img" />
            <h2 class="ques" style="text-transform:capitalize"><%=questionsFAQ[i] %></h2>
            <div onclick="expandQuestion(<%=i %>)" style="cursor:pointer">
            <a style="font-weight: bolder;background: blue;color: wheat;width: 30px;text-align: center; border-radius: 25px;" class="down link">
            >
                 </a></div>

            <br />
             <p  style="margin-top:15px; padding:4px; text-transform:capitalize"><%=answersFAQ[i] %></p>
        </div>
            <br />
            <br />
            <%} %>
        
           
        </div>

        <div class="services">
            <div class="text">
                <div style="text-align:center;">
                <h1  class="service-text">ABOUT SERVICES</h1>
                <h3 class="service-text grey">Easy and effective way to get your !</h3>
                    <br />
                <h1 class="barline"></h1>
                </div>
                <br />
                <div class="services-tabs left">
                    <img class="servives-tabs-img" src="../images/si2.png" alt="img" />
                    <h3>You Are In Safe Hand.</h3>
                    <p>Your Personal Information Is Fully <br />Secured Under Our Extreme Security.</p>
                    
                </div>
                <div class="services-tabs right" >
                    <img class="servives-tabs-img" src="../images/si3.png" alt="img" />
                    <h3>Get Every Solution.</h3>
                    <p>Well Educated Staff For Your Help.<br />We Are 24/7 With You.</p>
                </div>
                <br />
                <br />
                <div class="services-tabs left">
                    <img class="servives-tabs-img" src="../images/si4.png" alt="img" />
                    <h3>Secure Transections.</h3>
                    <p>Transections Are End To End Secure <br /> We Are Here For Every Mishappening.</p>
                    
                </div>
                <div  class="services-tabs right">
                    <img class="servives-tabs-img" src="../images/si6.png" alt="img" />
                    <h3>ISO 1st Ranked</h3>
                    <p>We Have Certified With ISO 2020 .</p>
                    <p>Your Mentors Are All P.H.D Scholars.</p>
                </div>
            </div>
            <div class="img" ><img class="img-services" src="../images/discuss with teacher.jpg" /></div>
        </div>
        <br />
        <br />
        <h2 class="service-text"> Experienced Teachers</h2>
        <h4 class="service-text grey">Our experts have been featured in press numerous times.</h4>
        <h1 class="barline"></h1>
        <div class="flex_container teachers" style="display:flex;">
            <div class="flex-teache "  style="display:inline-block;float:left;margin-right:41px;">
                <img class="flex-teacher-img" src="../images/team-member-1.jpg" />
                <div class="teacher-info">
                    <h3 class="service-text">Er.Bhupinder</h3>
                    <h5 class="service-text grey">Phd in Ai in Austin</h5>
                </div>
            </div>
            <div class="flex-teacher" style="display:inline-block; float:left;margin-right:41px;">
                <img class="flex-teacher-img" src="../images/team-member-2.jpg" />
                <div class="teacher-info">
                    <h3 class="service-text">Er.Bhupinder</h3>
                    <h5 class="service-text grey">Phd in Ai in Austin</h5>
                </div>
            </div>
            <div class="flex-teacher" style="display:inline-block;float:left;margin-right:41px;">
                <img class="flex-teacher-img" src="../images/team-member-3.jpg" />
                <div class="teacher-info">
                    <h3 class="service-text">Er.Bhupinder</h3>
                    <h5 class="service-text grey">Phd in Ai in Austin</h5>
                </div>
            </div>
        </div>
        <br /><br />
        <div class="contact">
            <h1 class="contact-heading" >REQUEST FREE QUOTA.</h1>
            <br />
            <p class="service-text-contact">Get answers and advice from people you want it from.</p>
            <div class="contact-btn">Contact Us</div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="scripts" runat="server">
    <script  src="../questions.js" type="text/javascript" ></script>
</asp:Content>