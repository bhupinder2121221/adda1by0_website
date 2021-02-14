
function discussionPane() {
    const addDiscussionPane = document.getElementById("add-discussion-pane-id");
    
    console.log("clicked add topic");
    if (addDiscussionPane.style.height == "500px") {
        addDiscussionPane.style.height = "1px";
    }
    else {
        addDiscussionPane.style.height = "500px";
    }
}