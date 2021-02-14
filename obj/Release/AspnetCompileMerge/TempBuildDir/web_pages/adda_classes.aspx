<%@ Page Language="C#" MasterPageFile="~/web_pages/masterPage.Master" AutoEventWireup="true" CodeBehind="adda_classes.aspx.cs" Inherits="add1By0.web_pages.adda_classes" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>


<asp:Content ID="links" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/classes.css" />
    <link rel="stylesheet" href="../App_Themes/css/aboutPage.css" />
    
</asp:Content>





<asp:Content ID="classesback" ContentPlaceHolderID="fullWorkSpace"  runat="server">
  
    <div class="background">
        <div class="arrows" id="arrowLeft-subjects" onclick="LeftArrow()" >
                <h1 class="arrow-text"  >></h1>
            </div>
            <div class="arrows right" onclick="RightArrow()" >
                <h1 class="arrow-text"><</h1>
            </div>
        
        <div class="subjects" id="subject-back"  >

            
            
            <% for (int i = 0; i < subjectsOfclass.Count; i++)
                { %>
            <%if (i % 2 == 0)
                { %>
            <div class="subjects-inlineblocks" id="<%=i %>" style="height: 100%;width: 300px;margin-right: 5px;display: inline-block; color: rgb(84, 8, 4); float: left;"  onclick="seclectingSubject(<%=i %>,'<%=classNo %>','<%=userEmail %>','<%=status %>')">
                <h1 class="subject-pane-text"><%= subjectsOfclass[i] %></h1>
            </div>
            <%} %>

            <% if (i % 2 != 0)
                { %>
             <div class="subjects-inlineblocks alternative" id="<%=i %>" style="height: 100%;width: 300px;margin-right: 5px;display: inline-block; color:rgb(49, 59, 114); float: left;" onclick="seclectingSubject(<%=i %>,'<%=classNo %>','<%=userEmail %>','<%=status %>')">
                <h1 class="subject-pane-text"><%= subjectsOfclass[i] %></h1>
            </div>
            <% } %>

            <% } %>
             
        
        </div>
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
        <div class="classView">
            <h1 class="heading "><%=subjectName.ToUpper() %> : </h1>
            <div class="vedio-pane">
                <div class="index-pane">
                    <% int current_Topic = 0; %>
                    <% int current_vedioContent = 0; %>
                    <% for (int i = 0; i < subject_lessons.Count; i++)
                        { %>
                        <% int numberOfTopic = Convert.ToInt32(NumberOfTopicsOfLesson[i]); %>
                            <div class="lessons" style="transition:all ease-in 1s;">
                               <div  onclick="expandLessons(<%=i %>)"> <h2 style="cursor:pointer; text-align:left"><%=subject_lessons[i] %></h2></div>
                                <div class="lesson-sub" id="lesson<%=i %>"  style="margin-top:10px; cursor:pointer; overflow:hidden;height:0px; transition:all ease-in 1s;">
                                <%for (int o = 0; o < numberOfTopic; o++,current_Topic++)
                                    { %>
                                   <div  onclick="expandContractVediosLink(<%=Convert.ToString(current_vedioContent) %>)">
                                       <h3 class="topics-style" style="height:25px; "><%=SubjectTopics[current_Topic] %></h3>

                                   </div>

                                    <% int NumberOfVediosContentInOneTopic = Convert.ToInt32(VedioLectures_NumberOf_topic[current_Topic]); %>
                                    <div id="vedioPart<%=current_vedioContent %>" class="videos-style" style="height:25px;cursor:pointer;height:0px; color:darkblue; margin-right:5px; overflow:hidden;">
                                    <% for (int p = 0; p < NumberOfVediosContentInOneTopic; p++,current_vedioContent++)
                                        { %>
                                        <div onclick="playTheVedio('<%= vedioLinksOf_Subject[current_vedioContent] %>','<%= backView %>','<%=classNo %>','<%=userEmail %>','<%=status %>')">
                                        <h3 style="text-align:right;" >Vedio Part <%=p %></h3>
                                        </div>
                                        <br />
                                    
                                    <%} %>
                                </div>
                                <br />
                                <%} %>
                                    </div>
                                
                            </div>
                            <br />
                    <%} %>
                </div>
                <div class="video-back">
                    <iframe width="100%" height="100%" src="<%=videoUrl %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                </div>
            </div>

        </div>
            </asp:Panel>
        <asp:Panel ID="welcome" runat="server">
            <br />
            <br />
            <h1 class="welcome-text"> Welcome !</h1>
            <h1 class="select-text"> Select A Subject</h1>
        </asp:Panel>

    </div>
       <script type="text/javascript" src="../classes_js.js"></script>
 </asp:Content>