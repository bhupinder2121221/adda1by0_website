<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_page.aspx.cs" Inherits="add1By0.web_pages.Login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title></title>

    <style>
        * {
            background:url("C:\Users\bhupi\source\repos\add1By0\images\login.jpg");
        }
        body {
            background-image:url("");
            background-repeat:no-repeat;
            
        }
        .login_box {
            padding:10px;
            background-color:#9EC8E5;
           
        }
        .label_labels {
            font-weight:bolder;
            font-size:1.2rem;
        }
        .webcam_pane {
            border:blue solid 2px;
            float:right;
            margin:7px;
            transition:all linear 0.5s;
        }
        .loginbtn {
            background-color:none;
            color:green;
            border:2px solid green;
            transition:all linear 0.5s;
        }
        .loginbtn:hover {
            background-color:green;
            color:red;
           border:3px solid red;
        }
        .auto-style2 {
            height: 360px;
            width: 317px;
        }
        .flexlogin {
            display:flex;
            justify-content:center;
            align-items:center;
            height:80vh;
            width:100%;
        }
    </style>
    <script runat="server">
        string[] runningText = { "Hi i am bhupinder.", " I am from CSE branch and in 5th semester.", " I am owner of this website. Problem Just call me.", "I am waiting for your call." };


        void Page_Load(object sender, EventArgs e)
        {
            if(option1.Checked)
            {
                Panel1.Visible = false;
                secreteCode_box.Visible = true;
            }
            if(option.Checked)
            {
                Panel1.Visible = true;
                secreteCode_box.Visible = false;
            }
        }
        void radioSelected()
        {
            Panel1.Height=100;

        }
    </script>
</head>
    <script type="text/javascript">
        console.log("Java Script wroking");
        function radioSelected() {
            const radio_id = document.getElementById(this);
            console.log("id selsected");
        }
    </script>

  

<body  style="height: 709px; margin-right: 14px; background-image:url('~\images\login.jpg')">
    <asp:Panel runat="server" HorizontalAlign="Center" CssClass="flexlogin">
    <form id="form1" defaultbutton="loginbtn" runat="server">
        
        
        
            <fieldset id="login_box" class="auto-style2">
                <legend>Only For Authorized: </legend>
                <br />
                <asp:Label ID="userid" runat="server" AssociatedControlID="username_box" CssClass="label_labels" Text="USER ID : ">  </asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="username_box" runat="server" MaxLength="32" placeholder="abc@gmail.com" TextMode="Email" Width="120px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="password" runat="server" AssociatedControlID="password_box" CssClass="label_labels" Text="PASSWORD : "></asp:Label>
                <asp:TextBox ID="password_box" runat="server" placeholder="Your password" TextMode="Password" Width="120PX"></asp:TextBox>
                <br />
                <br />
                <br />
                &nbsp;
                <asp:RadioButton ID="option" runat="server" AutoPostBack="true" GroupName="option_web_secretecode" Text="Use Face Recognition " />
                <br />
                &nbsp;
                <asp:RadioButton ID="option1" runat="server" AutoPostBack="true" GroupName="option_web_secretecode" Text="Use Secrete Code " />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="secreteCode_box" runat="server" placeholder="Secrete Code" visible="false"></asp:TextBox>
                <asp:Panel ID="Panel1" runat="server" CssClass="webcam_pane" Height="100px" Visible="false" Width="178px">
                </asp:Panel>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                &nbsp;&nbsp; &nbsp;
                <asp:Button ID="loginbtn" runat="server" CssClass="loginbtn" Text="Button" Width="222px" />
            </fieldset>
        
   
    </form>
    </asp:Panel>
    <br />
    <br />
    <div style="width: 100%; background-color: #FFFF00;">
   <marquee direction="left"><strong> "Hi i am BHUPINDER .   I am from CSE branch and in 5th semester.   I am owner of this website. Any Problem ! Just call me.  I am waiting for your call."</strong></marquee>
    </div>
    
    
   
    <p>
        &nbsp;</p>
    
    
   
</body>
</html>
