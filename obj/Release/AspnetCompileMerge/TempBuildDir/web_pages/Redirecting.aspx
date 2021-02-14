<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Redirecting.aspx.cs" Inherits="add1By0.web_pages.Redirecting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
                background-color: rgb(0,-2,56);
        }
        .loadingGif {
            
            height: 374px;
            width: 39%;
            display:block;
            margin:auto;
            background:red;
            margin-top:50px;
        }
        .text {
            color:white;
            font-weight:bolder;
        }
        .redirecting-text {
            width:50%;
            height:30vh;
            display:block;
            margin:auto;
            margin-top:20px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class="loadingGif">
            <img style="width:100%; height:100%" src="../images/redirectingLoading1.gif" />
        </div>
        <div class="redirecting-text">
       <h1 class="text">Redirecting.... </h1>
        <h3 class="text">Checking for User validation.</h3>
        <h3 class="text" style="display:inline-block;float:left; ">Now Checking for <h1 style="display:inline-block; float:left; color:purple;margin-left:10px;"> <%=useremail %> </h1></h3>
            </div>
    </form>
    <script type="text/javascript">
        console.log("Here is redirecting link");
        console.log("--> <%=redirectingLinkSTR %>");

        window.onload = setTimeout(function () {
            console.log("redirecting----");
            alert("<%=redirectingmsg %>");
            window.location = "<%=redirectingLinkSTR %>";
        }, 5000);
        
      
    </script>
</body>
</html>
