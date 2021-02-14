var close = "notclosed";

function notclosed() {
    close = "closed";

}
window.onbeforeunload = function () {
    if (close == "notclosed") {
        return "not closed";
    }
    return "Do you really want to close?";
};