<%@ Page MasterPageFile="~/web_pages/masterPage.Master"  Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="add1By0.web_pages.homepage" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>
<asp:Content ID="fonts" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/homePage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet" />
</asp:Content>
<asp:Content ID ="homeback" ContentPlaceHolderID="fullWorkSpace"  runat="server">
    
       
    <div class="container-fluid" style="padding:0px;">
        <br />
        <br />
        <div class="container-fluid" style="padding:0px;"><h1 style="font-family: 'Stylish', sans-serif;text-align:center; font-size:2.9rem; color:purple;">WELCOME  IN ADDA1BY0</h1></div>
        <div class="barline-home"></div>
        <br />

        <div class="container-fluid HomeIntro" style="padding:0px;height:auto;">
            <div class="row text-center" >

           <div class="col">
               
            <div class="HomeIntoText " style="width:auto;margin:0px;    width: 100%;
    height: 100%;
    margin: 0px;">
                <h1 style="font-weight:bold;">Online Coaching</h1>
                <h3>By Adda1By0</h3>
                <h3>A Free Platform To Upgrade Your Skills</h3>
                <br />
                <br />
               <a href="Redirecting.aspx?Name=<%=Master.get_emailId.ToString().ToLower() %>&booking=frmhmtrdrpg" style="width:100%;"> <h1 class="btn btn-dark fs-2">Book Now</h1></a>
            </div>
                </div>
                
                <div class="col-sm-6">
                    <img class="img-fluid" src="../images/pngegg.png" alt="intro-adda1by0" />
                </div>
                    
                </div>
            <br />
            <br />
        </div>
        <div class="container-fluid">
                <h1 class="choose-Home-Text">Why Adda1By0 Only ?</h1>
            <div class="row text-center">    
            <div class="col choose-home-style">
                    <div class="ans-home-pic">
                        <asp:Image ID="pic1" runat="server" CssClass="ans-home-pic-img" AlternateText="ans-img" ImageUrl="~/images/indea-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Large Study Resources </h3>
                </div>
                <div class="col choose-home-style">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image1" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/discuss-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Discuss Your Doubts </h3>
                </div>
                <div class="col choose-home-style">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image2" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/certificates-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> Get ISO Certificates </h3>
                </div>
                <div class="col choose-home-style">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image3" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/become-creative-home.png" />
                    </div>
                    <h3 class="choose-img-text-home">Share Your Thoughts</h3>
                </div>
             
                <div class="col choose-home-style">
                    <div class="ans-home-pic">
                        <asp:Image ID="Image4" runat="server" AlternateText="ans-img" CssClass="ans-home-pic-img" ImageUrl="~/images/all-world-home.png" />
                    </div>
                    <h3 class="choose-img-text-home"> International Techers </h3>
                </div>
            </div>
            </div>
        <br />
        <br />
        <br />
        <br />
        <div class="container-fluid" style="background:rgb(144, 224, 239);">
            <div class="row text-center justify-content-center" style="padding:12px">
                <div class="col-sm">
                    <ul class="c-list">
                        <div class="row">
                    <li class="home-intros">
                        <div class="row">
                        <div class="col-sm-6">
                            <img src="https://cdn1.byjus.com/byjusweb/img/classes/batches.svg" alt="Weekday and weekend batches" width="30" height="30" class="img-responsive icon" />
                        </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2"> Classes as per time-table </h4>
                       <p style="font-weight:100"> Weekday and weekend batches to choose from</p>
                        </div>
                            </div>

                            </li>
                    <li class="home-intros" >
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/doubt-resolution.svg" alt="Instant doubt resolution" width="30" height="30" class="img-responsive icon" />
                        </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2"> Instant doubt resolution </h4>
                        Get doubts solved immediately during <br> and after the class
                    </div>
                            </div>
                            </li>
                    <li class="home-intros" >
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/extra-classes.svg" alt="Personalised extra classes" width="30" height="30" class="img-responsive icon" />
                       </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title fs-2"> Personalised extra classes </h4>
                        Improve understanding of weak concepts <br> with additional support
                    </div>
                            </div>
                            </li>
                    <li class="home-intros">
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/monthly-tests.svg" alt="Monthly tests" width="30" height="28" class="img-responsive icon" />
                       </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2"> Monthly tests </h4>
                        Get assessed regularly to perform <br> better
                   </div>
                            </div>
                            </li>
                            </div>
                </ul>
                      <a href ="courses.aspx?Name=<%=Master.get_global_name.ToUpper() %>"> <h1 class="btn btn-danger" style="border-radius:20px;padding-left:5px;padding-right:5px;">  Go To Classes ! </h1></a>
               
                    </div>
                <div class="col-sm">
                    <img src="../images/home1.png" class="img-fluid" alt="adda1by0_discription1" />
                </div>

            </div>
        </div>

         <div class="container-fluid" style="background:rgb(202, 240, 248);">
            <div class="row text-center justify-content-center" style="padding:12px;">
                <div class="col-sm">
                    <ul class="c-list">
                        <div class="row">
                    <li class="home-intros">
                        <div class="row">
                        <div class="col-sm-6">
                         <img src="https://cdn1.byjus.com/byjusweb/img/classes/student-requirement.svg" alt="Monthly tests" width="30" height="30" class="img-responsive icon">
                          </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2">  Classes as per a student's requirement</h4>
                       <p style="font-weight:100">Choose and attend extra classes to make <br> up for any missed lessons</p>
                        </div>
                            </div>

                            </li>
                    <li class="home-intros" >
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/doubt-resolution.svg" alt="Instant doubt resolution" width="30" height="30" class="img-responsive icon" />
                        </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2"> Work on topics that need extra attention</h4>
                         Strengthen concepts with improvement classes
                    </div>
                            </div>
                            </li>
                    <li class="home-intros" >
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/extra-classes.svg" alt="Personalised extra classes" width="30" height="30" class="img-responsive icon" />
                       </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title fs-2">  Prepare for upcoming exams </h4>
                       Schedule an extra class to learn for an <br> upcoming exams
                    </div>
                            </div>
                            </li>
                    <li class="home-intros">
                        <div class="row">
                        <div class="col-sm-6">
                        <img src="https://cdn1.byjus.com/byjusweb/img/classes/monthly-tests.svg" alt="Monthly tests" width="30" height="28" class="img-responsive icon" />
                       </div>
                            <div class="col-sm-6">
                            <h4 class="pointer-block-list-title  fs-2"> Revisit a topic  </h4>
                       Use the extra class feature to revisit <br> and revise topics as per need
                   </div>
                            </div>
                            </li>
                            </div>
                </ul>
                     <a href ="courses.aspx?Name=<%=Master.get_global_name.ToUpper() %>"> <h1 class="btn btn-danger" style="border-radius:20px;padding-left:5px;padding-right:5px;">  Go To Classes ! </h1></a>
               
                </div>
                <div class="col-sm">
                    <img src="../images/home2.png" class="img-fluid" alt="adda1by0_discription1" />
                </div>

            </div>
        </div>
        <br />



        


        <br />
        <h1 style="font-family:'Stylish', sans-serif;font-weight:bolder;text-align:center;">Advantages Are</h1>
        <div class="barline-home"></div>
        <br />
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col">
            <div class="container-fluid advantage-frame">
                <h3 class="fs-1" style="color:red">Personalised extra classes</h3>
                <h4 class="fs-4" style="font-family: cursive;">Students can attend extra classes with BYJU’S teachers for additional support. This will help them to revise missed lessons, prepare for exams and improve weak topics.</h4>
            </div>
            </div>
                <div class="col">
            <div class="container-fluid advantage-frame">
                <h3 class="fs-1" style="color:red">Classes by India's top teachers</h3>
                <h4 class="fs-4" style="font-family: cursive;">Every class will be taught using visual aids to make learning simple and engaging. Students can also get their doubts solved immediately from assigned teachers during the class to strengthen conceptual understanding.</h4>
            </div>
                    </div>
                <div class="col">
            <div class="container-fluid advantage-frame">
                <h3 class="fs-1" style="color:red"> Individual attention from mentors</h3>
                <h4 class="fs-4" style="font-family: cursive;">BYJU’S mentors are aided by technology to guide and support students throughout. They will keep track of students' learning blueprint and suggest how to learn better, improve on their weak areas and score higher.</h4>
            </div>
                    </div>
          </div> 
        </div>
        <br />










        
      </div>
    
</asp:Content>




<asp:Content ID="googlemap" ContentPlaceHolderID="scripts" runat="server">
 
 
</asp:Content>