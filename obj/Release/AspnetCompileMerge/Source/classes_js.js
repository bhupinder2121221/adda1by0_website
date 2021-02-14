
function add_item_portal() {
    
    
    let portal = document.getElementById("add_item_portal");
    console.log("add item clicked with height of ", portal.style.height);
    if (portal.style.height == "600px") {
        portal.style.height = "0px";
        
        document.getElementById("add_item_btn").innerHTML = "Add Items";
        document.getElementById("add_item_btn").style.width = "150px";
    }
    else {
        portal.style.height = "600px";
        document.getElementById("add_item_btn").innerHTML = "X";
        document.getElementById("add_item_btn").style.width = "60px";
        
    }
}

function customSubject() {
    console.log("customSubject caklled");
    if (document.getElementById("custombtn").innerHTML == "List") {
        document.getElementById("custombtn").innerHTML = "Custom Value";
        document.getElementById("subjects").style.width = "150px";
        document.getElementById("custombtn").style.width = "0px";
    }
    else {
        document.getElementById("custombtn").innerHTML = "List";
        document.getElementById("subjects").style.width = "0px";
        document.getElementById("custombtn").style.width = "150px";
    }
}
var flipped = 1;

const subject = document.getElementById("subject-back");
function LeftArrow() {
    
    if (flipped ==2) {

    }
    else {
        console.log("left arrow clicked");
        subject.style.transform = "translateX(-100%)";
        flipped = 2;
       
    }
    }
function RightArrow() {
   
    if (flipped ==1) {

    }
    else {
        console.log("Right arrow clicked");
        subject.style.transform = "translateX(0)";
        flipped = 1;
       
    }
 
}


function seclectingSubject(subject_id,classNo,name,status) {
    console.log("subject index selected" + subject_id);
    window.location = "adda_classes.aspx?Name=" + name + "&status=" + status + "&class=" + classNo + "&subject=" + subject_id;
}

function expandLessons(idOfLesson) {
    console.log("losson clicked with id=" + idOfLesson);
    if (document.getElementById("lesson" + idOfLesson).style.height == "0px") {
        console.log("expanding topic pane with id lesson", idOfLesson);
        document.getElementById("lesson" + String(idOfLesson)).style.height = "auto";
    }
    else {
        console.log("contracting topic pane with id lesson", idOfLesson);
        document.getElementById("lesson" + String(idOfLesson)).style.height = "0px";
    }
}

function expandContractVediosLink(vedioPartId) {
    console.log("topic clicked with vediopane id=", vedioPartId);
    if (document.getElementById("vedioPart" + vedioPartId).style.height == "0px") {
        console.log("expanding vedio pane with id lesson", vedioPartId);
        document.getElementById("vedioPart" + String(vedioPartId)).style.height = "auto";
    }
    else {
        console.log("contracting vedio pane with id lesson", vedioPartId);
        document.getElementById("vedioPart" + String(vedioPartId)).style.height = "0px";
    }
  
}

function playTheVedio(vediourl,subjectId,classNo,name,status) {
    console.log("Playing vedio url = ", vediourl);

    window.location = "adda_classes.aspx?Name="+name+"&status=" + status + "&class=" + classNo + "&subject=" + subjectId + "&v_url=" + vediourl;
    console.log("post back success");
}