<%@ Page Language="C#" MasterPageFile="~/web_pages/masterPage.Master"  AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="add1By0.web_pages.courses" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>

<asp:Content ID="fonts" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/courses.css" />
    <link rel="stylesheet" href="../App_Themes/css/aboutPage.css" />

</asp:Content>


<asp:Content ID="coursesback" ContentPlaceHolderID="fullWorkSpace"  runat="server">
   
        <h1 class="heading courses"> Get Your Courses </h1>
        <div class="barline courses"></div>
        <div class="priliminary-classes container-fluid" style="display:block; height:auto;">
            <div class="container-fluid" style="margin-bottom:61px;">
                <h1 class="heading courses classes">Preliminary Study</h1>
            </div>
            <div class="row">
            
            <% int b = 0; %>
           <% for (b = 0; b < priliminary_classes_property.Count ; b++)
               {%>
                <div class="col">
            <a href="Redirecting.aspx?class=<%=b %>" style="margin-bottom:50px;">
            <div class="classes-box" style="cursor:pointer; margin:20px; display:inline-block; ">
                <h3 class="class-box-heading"> class <%= priliminary_classes_property[b].ToString() %>   </h3>
            </div>
                </a>
                    </div>
            <% } %>
            <br />
            
                
                </div>
        </div>
       
        
        
        <div class="secondary-classes" style="height:auto;">
            <div class="container-fluid">
             <h1 class="heading courses classes">Senior Study</h1>
                </div>
            <div class="container">
            <div class="row">
                <div class="col">
            <div class="book" style="margin-left:0px;margin:20px;    margin-top: 126px;">
                  <div class="back" style="background-size:cover;"></div>
                  <div class="page6"><a style="color:darkblue; text-align:center;margin-top:25%;" href="Redirecting.aspx?class=<%=10 %>"><h1>Enter The class!</h1></a></div>
                  <div class="page5"> <h1 style="transform:rotateY(180deg)">Chapter 11</h1></div>
                  <div class="page4"></div>
                  <div class="page3"></div>
                  <div class="page2"></div>
                  <div class="page1"></div>
                  <div class="front" style="background-size:cover;"><asp:Label id="Label3" CssClass="class-box-heading frontheader" Text="Class 11" runat="server"></asp:Label></div>
            </div>
                    </div>
                <div class="col">

                
            <div class="book" style="margin-left:0px;margin:20px;    margin-top: 126px;">
                  <div class="back" style="background-size:cover;"></div>
                  <div class="page6"><a style="color:darkblue; text-align:center;margin-top:25%;" href="Redirecting.aspx?class=<%=11 %>"><h1>Enter The class!</h1></a></div>
                  <div class="page5"> <h1 style="transform:rotateY(180deg)">Chapter 12</h1></div>
                  <div class="page4"></div>
                  <div class="page3"></div>
                  <div class="page2"></div>
                  <div class="page1"></div>
                  <div class="front" style="background-size:cover;"><asp:Label id="Label4" CssClass="class-box-heading frontheader" Text="Class 12" runat="server"></asp:Label></div>
            </div>
            </div>
             </div>
                </div>
                
            
         
            

        </div>  
    

         <div class="priliminary-classes" style="height:auto;margin-top:20px">
             <div class="container-fluid">
            <h1 class="heading courses classes" style="display: flow-root;">Live Classes  +  Extra Classes</h1>
                 </div>
             <div class="container-fluid">
            <asp:Button ID="addExtraclases" CssClass="add_extra_class" OnClick="addExtraclases_Click" Text="Add Class" runat="server" />
            </div>
                 <br />
             <br />
             <br />
             <br />
             <div class="container-fluid">
                 <div class="row">
            <% int e = 0; %>
           <% for (e = 0; e < extra_classes.Count; e++)
               {%>
                <% if (e % 2 == 0){ %>
                     <div class="col-sm">
                 <div class="book" style="margin-left:10px;">
                  <div class="back" style="background-size:cover;" id="extraclasses1"></div>
                  <div class="page6"><a style="color:darkblue; text-align:center;margin-top:25%;" href="Redirecting.aspx?topicName=<%=extra_classes[e].ToString()%>"><h1>Enter The class!</h1></a></div>
                  <div class="page5"> <h1 style="transform:rotateY(180deg)">Class <%= extra_classes_property[e].ToString() %> </h1></div>
                  <div class="page4"></div>
                  <div class="page3"></div>
                  <div class="page2"></div>
                  <div class="page1"></div>
                  <div class="front" style="background-size:cover;" id="extraclasses2" ><h1 style="color:darkblue; transform:translateY(-35px);text-align:center;"><%= extra_classes_property[e].ToString() %></h1></div>
                   </div>
                         </div>
                 <%} %>
                 <% if (e % 2 != 0)
                     { %>
                     <div class="col-sm">
                 <div class="book" style="margin-left:10px;">
                  <div class="back" style="background-size:cover;" id="extraclasses3"></div>
                  <div class="page6"><a style="color:darkblue; text-align:center;margin-top:25%;" href="Redirecting.aspx?topicName=<%=extra_classes[e].ToString()%>"><h1>Enter The class!</h1></a></div>
                  <div class="page5"> <h1 style="transform:rotateY(180deg)">Class <%= extra_classes_property[e].ToString() %> </h1></div>
                  <div class="page4"></div>
                  <div class="page3"></div>
                  <div class="page2"></div>
                  <div class="page1"></div>
                  <div class="front" style="background-size:cover;" id="extraclasses4" ><h1 style="color:darkblue; transform:translateY(-35px);text-align:center;"><%= extra_classes_property[e].ToString() %></h1></div>
                   </div>
                         </div>
                 <%} %>
                

        
            <% } %>
                     </div>
            <br />
            </div>
        </div>
        
 
</asp:Content>