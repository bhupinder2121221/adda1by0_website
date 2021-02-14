const slides = document.getElementById("flex_container").children;
console.log(slides);
const next = document.querySelector(".next");
const prev = document.querySelector(".prev");
console.log(next);
console.log("indicatorrs are : ");
const indicators = document.getElementsByClassName("point");
console.log(indicators);
let index = 0;

next.addEventListener("click", function () {
    nextslide();
})
prev.addEventListener("click", function () {
    prevslide();
})

function nextslide() {
    
    if (index == slides.length - 4) {
        index = 0;
    }
    else {
        index += 1;
    }
    console.log("index at " + index);
    changeslide();
}
function prevslide() {
    if (index == 0) {
        index = slides.length-4;
    }
    else {
        index -= 1;
    }
    console.log("prev index is " + index);
    changeslide();
}
function indicator_clicked(indexgot) {
    index = indexgot;
    changeslide(index);
}
function changeslide() {
    //removing active from all classes
    for (let i = 0; i <= slides.length - 4; i++) {
        slides[i].classList.remove("active");
        
    }
    for (let i = 0; i <indicators.length ; i++) {
        indicators[i].classList.remove("active");
    }
    // now adding the active class to next slide
    slides[index].classList.add("active");
    indicators[index].classList.add("active");
}


let timer = setInterval(autoplay, 4000);

function autoplay() {
    nextslide();
}
function stop() {
    clearInterval();
    
    autoplay();
}

