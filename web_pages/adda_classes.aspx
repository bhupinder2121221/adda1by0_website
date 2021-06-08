<%@ Page Language="C#" MasterPageFile="~/web_pages/masterPage.Master" AutoEventWireup="true" CodeBehind="adda_classes.aspx.cs" Inherits="add1By0.web_pages.adda_classes" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>


<asp:Content ID="links" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/classes.css" />
    <link rel="stylesheet" href="../App_Themes/css/aboutPage.css" />
    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
</asp:Content>





<asp:Content ID="classesback" ContentPlaceHolderID="fullWorkSpace"  runat="server">
  <asp:HiddenField ID="lesson" runat="server" />
    <asp:HiddenField ID="topicnumber" runat="server" />
    <div class="background">
        
        <div class="container-md" style="margin-top:15px;">
       <div class="carousel carousell"  data-flickity>
  

           <% for (int i = 0; i < subjectsOfclass.Count; i++)
                { %>
            <%if (i % 2 == 0)
                { %>
           <div class="carousel-cell" id="<%=i %>" onclick="seclectingSubject(<%=i %>,'<%=classNo %>','<%=userEmail %>','<%=status %>')">
      <div class="container-sm">
          <h1 class="subject-slides"  ><%= subjectsOfclass[i] %></h1>
      </div>
        </div>
            
            <%} %>

            <% if (i % 2 != 0)
                { %>
               <div class="carousel-cell" id="<%=i %>" onclick="seclectingSubject(<%=i %>,'<%=classNo %>','<%=userEmail %>','<%=status %>')">
                  <div class="container-sm">
                         <h1 class="subject-slides" style="background:yellow" ><%= subjectsOfclass[i] %></h1>
                  </div>
               </div>

            
            <% } %>

            <% } %>
             
  </div>
    </div>


        <br />
        <br />

      

        <h1 class="heading-home" style="font-family: 'Stylish', sans-serif;text-align:center; font-size:2.9rem; color:purple;"> Class 1st </h1>
        <div class="barline-home" style="margin-top:-50px;"></div>
       <asp:Panel ID="addItem_panel" runat="server">
        <h1 class="add_items_classes" id="add_item_btn" style="text-align:center" onclick="add_item_portal()">Add Items</h1>

        <div class="add_item_portal" id="add_item_portal">
            <div class="add_item_inner_portal" id="inner_add_item_portal">
                <h1 class="heading-home" style="font-family: 'Stylish', sans-serif;text-align:center; font-size:2.9rem; color:darkblue;">Add Content In Course</h1>
                <h2 class="heading-home" style="margin-left:25%;margin-bottom:10px;height:50px;width:150px;display:inline-block;"> Subject </h2>
                    <asp:DropDownList ID="subjects"  CssClass="add_item_inner_portal_inputs"  runat="server">

                    </asp:DropDownList>
                 
              
                <asp:TextBox ID="custom" Width="228px" Visible="false" CssClass="add_item_inner_portal_inputs" runat="server"></asp:TextBox>
              
               <asp:Button ID="custombtn" CssClass="custombtn" Text="Custom Value" OnClick="custombtn_Click" runat="server" /> 

                <br />
                
                <h2 class="heading-home" style="margin-left:25%;margin-bottom:10px;height:50px;width:150px;display:inline-block;"> Lesson </h2>
                    <asp:DropDownList ID="lessons"  CssClass="add_item_inner_portal_inputs"  runat="server">
                        

                    </asp:DropDownList>
                 <asp:TextBox ID="custombtnm" Visible="false" CssClass="add_item_inner_portal_inputs" runat="server"></asp:TextBox>
              
               <asp:Button ID="custombtn2" Text="Custom Value" CssClass="custombtn" OnClick="custombtn2_Click" runat="server" />
                <br />

                <h2 class="heading-home" style="margin-left:25%;margin-bottom:10px;height:50px;width:150px;display:inline-block;"> Topic </h2>
                    <asp:TextBox ID="topic" CssClass="add_item_inner_portal_inputs" runat="server"></asp:TextBox>

                <br />

                <h2 class="heading-home" style="margin-left:25%;margin-bottom:10px;height:50px;width:150px;display:inline-block;"> Vedio Link </h2>
                    <asp:TextBox ID="vedioLink" CssClass="add_item_inner_portal_inputs" runat="server"></asp:TextBox>
                <br />

                <asp:Button ID="add_item_submit_btn" CssClass="add_items_classes submitbtn" OnClick="add_item_submit_btn_Click" Text="Add Item" runat="server" />
            </div>
        </div>
           </asp:Panel>

        <asp:Panel ID="classPanel" runat="server">
        <div class="classView" style="padding-bottom:47px">
            <h1 class="heading "><%=subjectName.ToUpper() %> : </h1>
            <div class="container-md" >
                <div class="row">
                      <div class="col-lg">
                <div class="container-md" style=" height:500px;   background: grey;    margin-bottom: 19px;">
                    <h1 style="z-index:0; position: absolute;font-size: 1.5rem;text-align: center; margin-top: 10%; color: white;">Select a topic from index.</h1>
                    <iframe style="z-index:2;" width="100%" height="100%" src="<%=videoUrl %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                </div>
                        </div>
                    <div class="col-sm">
                <div class="container-md" style=" overflow:scroll;max-height:500px; padding: 10px;background: white;border-radius: 12px;    box-shadow: 4px 4px;">
                   <h1>Index</h1>
                    <% int current_Topic = 0; %>
                    <% int current_vedioContent = 0; %>
                    <% for (int i = 0; i < subject_lessons.Count; i++)
                        { %>
                        <% int numberOfTopic = Convert.ToInt32(NumberOfTopicsOfLesson[i]); %>
                   
                    <div class="accordion" id="accordionExampleparent">
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOneparent<%=i %>">
                          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOneparrent<%=i %>" aria-expanded="true" aria-controls="collapseOneparrent<%=i %>">
                          <h2 style="cursor:pointer;font-size:1rem; text-align:left"><%=subject_lessons[i] %></h2>
                          </button>
                        </h2>
                        <div id="collapseOneparrent<%=i %>" class="accordion-collapse collapse show" aria-labelledby="headingOneparent<%=i %>" data-bs-parent="#accordionExampleparent">
                          <div class="accordion-body">
                               <%for (int o = 0; o < numberOfTopic; o++,current_Topic++)
                                    { %>
                              <div class="accordion" id="accordionExamplesubparent<%=o %><%=i %>">
                                  <div class="accordion-item">
                                    <h2 class="accordion-header" style="font-size:1rem;" id="headingOnesubparent<%=o %><%=i %>">
                                      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOnesubparent<%=o %><%=i %>" aria-expanded="true" aria-controls="collapseOnesubparent<%=o %><%=i %>">
                                        <h3 class="topics-style" style="height:25px; font-size:1rem; "><%=SubjectTopics[current_Topic] %></h3>
                                      </button>
                                    </h2>
                                    <div id="collapseOnesubparent<%=o %><%=i %>" class="accordion-collapse collapse show" aria-labelledby="headingOnesubparent<%=o %><%=i %>" data-bs-parent="#accordionExamplesubparent<%=o %><%=i %>">
                                      <div class="accordion-body">
                                           <% int NumberOfVediosContentInOneTopic = Convert.ToInt32(VedioLectures_NumberOf_topic[current_Topic]); %>
                                           <% for (int p = 0; p < NumberOfVediosContentInOneTopic; p++,current_vedioContent++)
                                        { %>
                                           <div style="height:35px"  onclick="playTheVedio('<%= vedioLinksOf_Subject[current_vedioContent] %>','<%= backView %>','<%=classNo %>','<%=userEmail %>','<%=status %>','<%=i %>','<%=o %>')">
                                        <h3 style="text-align:right;cursor:pointer; font-size:1rem;" >Vedio Part <%=p %></h3>
                                        </div>
                                           <%} %>

                                        </div>
                                    </div>
                                  </div>

                             </div>
                                <%} %>

                        </div>
                      </div>

                    </div>
                        
                        </div>
                     <%} %>







                    </div>
                   </div>
                  
                    
                     </div>

                </div>
            </div>
            </asp:Panel>
        <asp:Panel ID="welcome" runat="server">
            <br />
            <br />
            <div class="container-sm">
            <h1 class="welcome-text " style="    font-size: 4rem;letter-spacing:0.1rem;"> Welcome !</h1>
            <h1 class="select-text " style="    font-size: 4rem; "> Select A Subject</h1>
                </div>
        </asp:Panel>

    </div>
       <script type="text/javascript" src="../classes_js.js"></script>
    <script type="text/javascript">
        console.log("here is current link");
        console.log(document.getElementById('<%=lesson.ClientID %>').value);
    </script>
 </asp:Content>