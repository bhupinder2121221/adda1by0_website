let handleErrors = function (err) {
    console.log("Error :", err + "-------------------------->");
};


let remoteContainer = document.getElementById("remote_container-id");
let canvasContainer = document.getElementById("canvas-container");

function addVideo(streamId) {
    console.log("adding video div container with streamid=", streamId, " ----------------------------->")
    let streamDiv = document.createElement("div");
    streamDiv.id = streamId;
    streamDiv.style.transform = "rotateY(180deg)";
    streamDiv.style.width = "300px";
    streamDiv.style.height = "250px";
    streamDiv.style.padding = "10px";
    streamDiv.style.display = "inline-block";
    remoteContainer.appendChild(streamDiv);
};

function removeVideoStream(evt) {
    let stream = evt.stream;
    stream.stop();
    let removeDiv = document.getElementById(stream.getId());
    removeDiv.parentNode.removeChild(removeDiv);
    console.log("stream is removed with id : --------------->" + stream.getId());
};

function addCanvas(streamId) {
    let video = document.getElementById(streamId);
    let canvas = document.createElement("canvas");
    canvasContainer.appendChild(canvas);
    let ctx = canvas.getContext("2d");

    video.addEventListener('loadedmetadata', function () {
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
    });

    video.addEventListener('play', function () {
        var $this = this;
        (function loop() {
            if (!$this.paused && !$this.ended) {
                if (!$this.width !== canvas.width) {
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;
                }
                ctx.drawImage($this, 0, 0);
                setTimeout(loop, 1000 / 30);   // for 30 fps
            }
        }
        )();
    },0);
};


let client = AgoraRTC.createClient({
    mode: 'live',
    codec: 'h264',

});

client.init("97139ab0cac24a92bf8d9394ef725778", () => console.log("client Initialised ----------------------->"));

client.join(null, "new lecture", null, (uid) => {
    let localStream = AgoraRTC.createStream({
        streamId: uid,
        audio: true,
        video: true,
        screen: false
    })

    //initialisisig the stream
    localStream.init(function () {
        localStream.play("me");
        client.publish(localStream, handleErrors);
        console.log("stream initialised ----------------------------------------->");
        // if others streams are added i.e. others clients
        client.on('stream-added', function (evt) {
            client.subscribe(evt.stream, handleErrors)
            console.log("stream added ----------------------------------------->");
        });
        client.on('stream-subscribed', function (evt) {
            let stream = evt.stream;
            addVideo(String(stream.getId()));
            stream.play(String(stream.getId()));
            addCanvas(String(stream.getId()));
            console.log("stream subscribed ---------------------------------------->");

        });

        client.on('stream-removed', removeVideoStream);

    }, handleErrors);
}, handleErrors);