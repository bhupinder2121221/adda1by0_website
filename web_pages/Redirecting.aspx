<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Redirecting.aspx.cs" Inherits="add1By0.web_pages.Redirecting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../App_Themes/css/homePage.css" />
    <link rel="stylesheet" href="../App_Themes/css/masterpage.css" />
    <link rel="stylesheet" href="../bootsrap/bootstrap-5.0.0-beta1-dist/css/bootstrap.min.css" />
    <script src="../bootsrap/bootstrap-5.0.0-beta1-dist/js/bootstrap.bundle.min.js"></script>

     <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
        <div class="navbar" style="background-color:white;">
            <div class="navbar-brand"> Adda1By0</div>
        </div>
        <div class=" container-md" style="margin-top:4%;max-width:583px;">
            <img style="width:100%; height:100%" src="../images/loadingsvg.svg" />
        </div>
        <div class=" container-md" style="margin-top:11%; ">
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
        }, 1000);
        
      
    </script>
</body>
</html>
