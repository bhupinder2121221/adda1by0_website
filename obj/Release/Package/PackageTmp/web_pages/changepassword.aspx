<%@ Page MasterPageFile="~/web_pages/masterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="add1By0.web_pages.changepassword" %>
<%@ MasterType VirtualPath="~/web_pages/masterPage.Master" %>

<asp:Content ID="backpage"  ContentPlaceHolderID="fullWorkSpace" runat="server">
    <div class="back" >
        <asp:Panel ID="changepasswordpanel" runat="server">
    <div class="container-md " style="text-align: center;    font-family: cursive;    padding: 66px;    background: white;    border-radius: 29px;    border-color: darkblue;    border-width: 3px;    border-style: dotted;    margin-top: 20%;">
    <div class="row g-3 align-items-center" >
        <h1>Change Password</h1>
    </div>
        <br />
    <div class="row g-3 align-items-center">
        Please click button to recieve unique code.
    
        <asp:Button ID="codesend" CssClass="btn-light ml-auto buttonnn" runat="server" OnClick="codesend_Click" ValidationGroup="sendcodebtn" Text="Send Code" />
    </div>
        <br />
    <div class="row g-3 align-items-center">
  <div class="col-sm">
    <label for="code" class="col-form-label">Unique Code</label>
  </div>
  <div class="col-sm">
      <asp:TextBox ID="code" TextMode="Password" CssClass="form-control" aria-describedby="passwordHelpInline2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="code" runat="server" Text="*" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

  </div>
  <div class="col-sm">
    <span id="passwordHelpInline2" class="form-text">
      See your indox or span in email.
    </span>
  </div>
</div>

        <br />
    <div class="row g-3 align-items-center">
  <div class="col-sm">
    <label for="inputPassword6" class="col-form-label">New Password</label>
  </div>
  <div class="col-sm">
      <asp:TextBox ID="inputPassword6" TextMode="Password" CssClass="form-control" aria-describedby="passwordHelpInline" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="inputpassword6" runat="server" Text="*" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

  </div>
  <div class="col-sm">
    <span id="passwordHelpInline" class="form-text">
      Must be 8-16 characters long.
    </span>
  </div>
</div>
        <br />
    <div class="row g-3 align-items-center">
  <div class="col-sm">
    <label for="inputPassword7" class="col-form-label">Rewrite Password</label>
  </div>
  <div class="col-sm">
      <asp:TextBox ID="password7" TextMode="Password" CssClass="form-control" aria-describedby="passwordHelpInline1" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="must3" ControlToValidate="password7" runat="server" Text="*" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
  </div>
  <div class="col-sm">
      <asp:Panel ID="mustbesamemsg1" runat="server">
    <span id="passwordHelpInline1" class="form-text">
      Must be same.
    </span>
          </asp:Panel>
      <asp:Panel ID="mustbesamemsg2" runat="server">
          <span id="passwordHelpInline1" class="form-text text-danger">
      Must be same.
    </span>
      </asp:Panel>
  </div>
</div>
        <br />
        <div class="row">
            <div class="col-sm"></div>
            <div class="col-sm">
                <asp:Button ID="changepasswordbtn" Text="Change Password" runat="server" OnClick="changepassword_Click" CssClass="btn-success" />
            </div>
            <div class="col-sm"></div>
        </div>
      </div>
            </asp:Panel>
        <asp:Panel ID="successchangepassword" Visible="true" runat="server">
            <div class="container-sm" style="text-align: center; text-align:center; max-width:450px;    font-family: cursive;    padding: 66px;    background: white;    border-radius: 29px;    border-color: darkblue;    border-width: 3px;    border-style: dotted;    margin-top: 20%;">
            <div class="row text-center" >
                <h1>Success !</h1>

            </div>
            <div class="row text-center">
                Your Password has been changed.
            </div>
            <div class="row text-center">
                Please login again with your new password.
            </div>
                <br />
            <div class="row text-center">
                <asp:Button ID="login" runat="server" CssClass="btn-secondary" OnClick="login_Click" Text="Login Again" />
            </div>
                </div>
        </asp:Panel>
         <asp:Panel ID="failedchangepassword" Visible="true" runat="server">
            <div class="container-sm" style="text-align: center; text-align:center; max-width:450px;    font-family: cursive;    padding: 66px;    background: white;    border-radius: 29px;    border-color: darkblue;    border-width: 3px;    border-style: dotted;    margin-top: 20%;">
            <div class="row text-center" >
                <h1>Unsuccessfull !</h1>

            </div>
            <div class="row text-center">
                An error came while changing password.
            </div>
            <div class="row text-center">
                Please try again later.
            </div>
                <br />
            <div class="row text-center">
                <asp:Button ID="Button1" runat="server" CssClass="btn-secondary" OnClick="Button1_Click" Text="Home" />
            </div>
                </div>
        </asp:Panel>
        </div>


    <script type="text/javascript">
        document.getElementById("flex_panel").style.display = "none";
        document.getElementById("googlemap").style.display = "none";
    </script>
        
</asp:Content>