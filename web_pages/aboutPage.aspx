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
    <div class="container-fluid">
        <div class="container-fluid">
        <div class="heading" style="height:auto">
            <h1 class="heading1">WE Are Leading One</h1>
           <!-- <br />-->
            <p class="heading2">Fastest Response Ever have recorded !</p>
            
            <h1 class="barline"></h1>
        </div>
            </div>
        <div class="container-fluid" >
        <div class="outerBox">
        <div class="intro" style="width:100%;height:auto">
            <div class="row">
                <div class="col-md">
            <div class="writtenIntro"  >
                <h1 ><firstletter>W</firstletter>hat We Do</h1>
                <h4>We provide a rich content of education to you.<br /> Our tutors are international so you get full knowledge of your subjects/</h4>
                <h4>You can access offline courses whenever you want, whereever you want. We are everytime with you. </h4>
                <h4>Here in discussion portal you can discuss your doubts with your tutor and also with your friends too !</h4>
                <h4>Besides it, we are providing extra classes for your overall development in premium accout. </h4>
                <br />
                <br />
                <h3 style="color:darkblue;"> S0... Pack your bags and get ready for an exciting trip to world of knowledge.</h3>
            </div>
                </div>
          <div class="col-md">
                <img style="width:100%;height:97%" class="img" src="../images/intro.jpg" alt="intro pic" />
            </div>
                </div>
           
        </div>
    </div>
       </div>
        <br /><br /><br />
        <div class="allquestions" style="transition:all linear 1s; height:auto">
         <% int i = 0; %>
            <% for (i = 0; i < questionsFAQ.Count; i++)
                { %>
            
        <div class="question container-sm" id="question<%=i %>" style="overflow:hidden;height:auto ">
            <div class="row">
                <div style="margin:auto">
            <img class="quesImg" src="../images/question.png" alt="img" />
             <p style="width:auto">
  <a class="btn btn-primary" data-bs-toggle="collapse" style="    color: #007bff; background-color:white;border-color:white;font-weight:bolder;" href="#multiCollapseExample<%=i %>" role="button" aria-expanded="false" aria-controls="multiCollapseExample<%=i %>"><%=questionsFAQ[i] %></a>
  
                </p>
                    </div>

                </div>
           


            <div class="row">
                <div class="collapse multi-collapse" id="multiCollapseExample<%=i %>">
      <div class="card card-body">
        <%=answersFAQ[i] %>.
      </div>
    </div>

                
                     </div>
                </div>
            
                </div>
            <br />
            <br />
            <%} %>
        
           
        </div>


 
        <div class="container-fluid">
        <div class="services" style="height:auto">
            <div class="row">
                <div class="col">
            <div class="text" style="width:100%;padding:10px;">
                <div style="text-align:center;">
                <h1  class="service-text">ABOUT SERVICES</h1>
                <h3 class="service-text grey">Easy and effective way to get your !</h3>
                    <br />
                <h1 class="barline"></h1>
                </div>
                <br />
                <div class="row">
                    <div class="col">
                <div >
                    <img class="servives-tabs-img" src="../images/si2.png" alt="img" />
                    <h3 class="servicestext">You Are In Safe Hand.</h3>
                    <p class="servicesinfo">Your Personal Information Is Fully <br />Secured Under Our Extreme Security.</p>
                    
                </div>
                        </div>
                    <div class="col">
                <div  >
                    <img class="servives-tabs-img" src="../images/si3.png" alt="img" />
                    <h3 class="servicestext">Get Every Solution.</h3>
                    <p class="servicesinfo">Well Educated Staff For Your Help.<br />We Are 24/7 With You.</p>
                </div>
            </div>
                    </div>
                <div class="row">
                    <div class="col">
                <div >
                    <img class="servives-tabs-img" src="../images/si4.png" alt="img" />
                    <h3 class="servicestext">Secure Transections.</h3>
                    <p class="servicesinfo">Transections Are End To End Secure <br /> We Are Here For Every Mishappening.</p>
                    
                </div>
                        </div>
                    <div class="col">
                    <div  >
                    <img class="servives-tabs-img" src="../images/si6.png" alt="img" />
                    <h3 class="servicestext">ISO 1st Ranked</h3>
                    <p class="servicesinfo">We Have Certified With ISO 2020 .</p>
                    <p class="servicesinfo">Your Mentors Are All P.H.D Scholars.</p>
                </div>
                    </div>
                    </div>
            </div>
                    </div>
                <div class="col">
            <div class="img" style="margin:0px"><img class="img-services" src="../images/discuss with teacher.jpg" /></div>
        </div>
                </div>
            </div>
            </div>



        <br />
        <br />
        <h2 class=" heading"> Experienced Teachers</h2>
        <h4 class="service-text grey heading">Our experts have been featured in press numerous times.</h4>
        <h1 class="barline"></h1>

    <div class="container-md">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="row">
            <div class="col-sm">
      <img class="d-block w-100" style="display:inline-block; float:left" src="../images/team-member-1.jpg" alt="Second slide">
               </div>
             <div class="col" style="padding:50px;text-align:center">
                     <h1 class="teacher_discription">Bhupinder</h1>
                        <h2> Phd. in Artificial Intelligence</h2>
                        <h2> CEO Of Adda1By0</h2>
      
                </div>
            </div>

    </div>
    <div class="carousel-item">
        <div class="row">
            <div class="col-sm">
      <img class="d-block w-100" style="display:inline-block; float:left" src="../images/team-member-1.jpg" alt="Second slide">
               </div>
            <div class="col" style="padding:50px;text-align:center">
                     <h1 class="teacher_discription">Bhupinder</h1>
                        <h2> Phd. in Artificial Intelligence</h2>
                        <h2> CEO Of Adda1By0</h2>
      
                </div>
            </div>
        </div>
    <div class="carousel-item">
      <div class="row">
            <div class="col-sm">
      <img class="d-block w-100" style="display:inline-block; float:left" src="../images/team-member-1.jpg" alt="Second slide">
               </div>
             <div class="col" style="padding:50px;text-align:center">
                     <h1 class="teacher_discription">Bhupinder</h1>
                        <h2> Phd. in Artificial Intelligence</h2>
                        <h2> CEO Of Adda1By0</h2>
      
                </div>
            </div>
     </div>
  </div>
  <a class="carousel-control-prev" style="  width:6%;  " href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" style="    
    height: 30px;
    
    background-color: black;
    padding: 5px;
    border-radius: 50px;" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" style="  width:6%;  " href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" style="   
    height: 30px;
   
    background-color: black;
    padding: 5px;
    border-radius: 50px;" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        </div>

     
        <div class="contact container-sm">
            <h1 class="contact-heading" >REQUEST FREE QUOTA.</h1>
            <br />
            <p class="service-text-contact">Get answers and advice from people you want it from.</p>
          <a class="contact-btn" href="tel:7901926491">  <div class="">Contact Us</div></a>
        </div>
    
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="scripts" runat="server">
    <script  src="../questions.js" type="text/javascript" ></script>
</asp:Content>