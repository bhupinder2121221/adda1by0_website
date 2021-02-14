<%@ Page MasterPageFile="~/web_pages/masterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="premiumMembership.aspx.cs" Inherits="add1By0.web_pages.premiumMembership" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>
<asp:Content ID="links" ContentPlaceHolderID="linker" runat="server">
    <link rel="stylesheet" href="../App_Themes/css/premiumMembership.css" />
</asp:Content>

<asp:Content ID="backcover" ContentPlaceHolderID="fullWorkSpace" runat="server">
    <br />
        
    <div>
       
        <div class="backcover" >
             <h1 class="heading_premium"> Get Your Premium Membership</h1>
            <div class="portal" >
                <asp:Panel ID="NotSuccess" Width="100%" runat="server">
                    <h1 class="name">Hi! <%=nameOfUser.ToUpper() %></h1>
                    <br />
                    

                    <div class="table" style="background-color:white; padding-top:0px;width:96%;">
  <div class="table-cell"></div>
  <div class="table-cell plattform" style="background-color: darkblue; color: wheat;">
    <h3>Free Course</h3>
    <a href="" style="margin-left:76px" class="btn">Sign Up</a>
  </div>
  <div class="table-cell enterprise" style="background-color: darkblue;color: wheat;">
    <h3>Premium Membership</h3>
    <a href="checkoutPage.aspx?Name=<%=email %>&phoneNo=<%=phoneNo %>" class="btn" style="margin-left:61px">Get Premium!</a>
  </div>
  <div class="table-cell cell-feature">Preliminary Classes</div>
  <div class="table-cell">
    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Discussions</div>
  <div class="table-cell">
    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Unlimited Access</div>
  <div class="table-cell">
    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Ask Doubts to Teacher</div>
  <div class="table-cell">
    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Secondary Classes</div>
  <div class="table-cell"></div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Extra Classes</div>
  <div class="table-cell"></div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">Live Classes</div>
  <div class="table-cell"></div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
  <div class="table-cell cell-feature">24/7 support</div>
  <div class="table-cell"></div>
  <div class="table-cell">
    <svg class="enterprise-check" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
      <title>check_blue</title>
      <path d="M6.116 14.884c.488.488 1.28.488 1.768 0l10-10c.488-.488.488-1.28 0-1.768s-1.28-.488-1.768 0l-9.08 9.15-4.152-4.15c-.488-.488-1.28-.488-1.768 0s-.488 1.28 0 1.768l5 5z" fill="limegreen" fill-rule="evenodd"/>
    </svg>
  </div>
</div>
                        <br />
                    <h2 style="color:darkblue;text-align:center;">No Premium Membership!</h2>
                    <br />
                    <div class="detail_payment">
                        
                        <table class="tableback">
                            <tr>
                                <td style="border-bottom:none;"> <asp:Image ID="companylogo" CssClass="logo" ImageUrl="~/images/adda1by0.png" runat="server" /> </td>
                               
                            </tr>
                            
                            <tr>
                                <td style="padding-left:38px;"> <h3>Tuition Fees </h3> </td>
                                <td> <h3>250</h3> </td>
                            </tr>
                            
                            <tr>
                                <td style="padding-left:38px;"> <h3>Tax (All)</h3> </td>
                                <td> <h3>75</h3> </td>
                            </tr>
                            
                            <tr>
                                <td style="padding-left:38px;"> <h3>Total Ammount </h3> </td>
                                <td> <h3>325</h3> </td>
                            </tr>
                            
                            <tr>
                                <td style="padding-left:38px;"> <h3>Discount (Launch)</h3></td>
                                <td> <h3>-214</h3> </td>
                            </tr>
                            
                            <tr style="background-color:#039ee3; color:darkblue;">
                                <td style="padding-left:38px;"> <h3>Total Ammount to pay</h3> </td>
                                <td> <h3>111</h3> </td>
                            </tr>
                        </table>
                       
                    </div>
                    
                   <a  class="premium-btn" style="width: 100%;transition: all linear 0.2s;" href="checkoutPage.aspx?Name=<%=email %>&phoneNo=<%=phoneNo %>"> <h1 >Become Premium!</h1> </a>
                       </asp:Panel>
                
                <asp:Panel ID="success" CssClass="success" runat="server">
                    <asp:Image ID="paid_pic" CssClass="paid_pic" ImageUrl="~/images/paid.png" runat="server" />
                    <h1 class="cool">Cool! </h1>
                    <h3 class="heading2">You are our Premium Member.</h3>
                    <h3 class="thanks">Thanks for being our member.</h3>
                    <table class="tableback" style="padding:14px;font-size:1.4rem;font-weight:bold;">
                        <tr>
                            <td>Name</td>
                            <td><%=nameOfUser.ToUpper() %></td>
                        </tr>
                        <tr style="padding-left:38px;">
                            <td>Transection Id </td>
                            <td><%=transectionId %></td>
                        </tr>
                        <tr style="padding-left:38px;">
                            <td>Order Id</td>
                            <td><%=ordersId %></td>
                        </tr>
                        <tr style="padding-left:38px;">
                            <td>Date of Payment</td>
                            <td><<%=dateOfTransection %>/td>
                        </tr>
                        <tr style="padding-left:38px;">
                            <td>Time of payment</td>
                            <td><%=timeOftransection %></td>
                        </tr>
                        <tr style="background-color:#039ee3; color:darkblue;">
                            <td >Amount Paid</td>
                            <td>Rs <%=amountPaid %></td>
                        </tr>
                    </table>
                </asp:Panel>

            </div>

        </div>
    </div>
</asp:Content>

