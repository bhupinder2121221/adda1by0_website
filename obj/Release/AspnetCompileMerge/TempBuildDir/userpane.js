


const userpane = document.getElementById("userName");
document.getElementById("username_pane").style.height = "30px";
userpane.addEventListener("click", function () {
    console.log("Username clicked");
    console.log("-----");
    if (userpane.textContent == "Visitor") {
        console.log("visitor pane selected");
    }
    else {
        console.log("userpane selected");
    }
    if (document.getElementById("username_pane").style.height == "30px") {
        if (userpane.textContent == "Visitor") {
            document.getElementById("username_pane").style.height = "150px";
        }
        else {
            document.getElementById("username_pane").style.height = "300px";
        }
        document.getElementById("logoImage").style.display = "none";
        document.getElementById("prev").style.display = "none";
        document.getElementById("sectionFlex_id").style.display = "grid";
    }
    else {
        document.getElementById("username_pane").style.height = "30px";
        document.getElementById("logoImage").style.display = "inline-block";
        document.getElementById("prev").style.display = "inline-block";
        document.getElementById("sectionFlex_id").style.display = "grid";

    }

});

function changepasswordPane() {
    
    console.log("changepassword pane called");
    console.log("change password pane display is ", document.getElementById("changepassword").style.height.toString());
    if (document.getElementById("changepassword").style.height == "0vh") {
        
        document.getElementById("changepassword").style.height = "100vh";
        document.getElementById("changepassword-pane").style.display = "inline-flex";
    }
    else {
        document.getElementById("changepassword").style.height = "0vh";
        document.getElementById("changepassword-pane").style.display = "none";
    }
}

