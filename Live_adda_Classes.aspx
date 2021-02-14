<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Live_adda_Classes.aspx.cs" Inherits="add1By0.Live_adda_Classes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="App_Themes/css/livestreamingPortal.css" />
    <script type="text/javascript" src="AgoraRTCSDK-3.2.3.js"></script>
    <script defer type="text/javascript" src="agoraLiveStreaming2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="liveStreaming" class="live_straming">
            
            <div id="me" class="remote_container-me"></div>
            <div id="remote_container-id" class="remote_container"></div>
            <div id="canvas-container" style="height:0px;" class="remote_container"></div>
        </div>
    </form>
</body>
</html>
