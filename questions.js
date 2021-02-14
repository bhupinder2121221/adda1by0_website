const allques = document.querySelector(".allquestions").children;
console.log("Questions logs ");
console.log(allques);


function expandQuestion(questionId) {

    console.log("question clicked for expand with id= " + questionId);
    if (document.getElementById("question" + questionId).style.height <= "30px") {
        console.log("expanding qusetion");
        document.getElementById("question" + questionId).style.height = "auto";
    }
    else {
        console.log("contracting question");
        document.getElementById("question" + questionId).style.height = "30px";
    }
}
