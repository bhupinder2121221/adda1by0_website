const video = document.getElementById("video");
console.log(faceapi.nets);
Promise.all([
   
    faceapi.nets.faceLandmark68Net.loadFromUri('../App_Themes/models'),
    faceapi.nets.faceRecognitionNet.loadFromUri('../App_Themes/models'),
    faceapi.nets.faceExpressionNet.loadFromUri('../App_Themes/models')

]).then(startVideo)

function startVideo() {
    navigator.getUserMedia(
        { video: {} },
        stream => video.srcObject = stream,
        err => console.error(err)
    )
}

console.log("Face api");