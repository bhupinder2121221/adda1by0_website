// rtc object
var rtc = {
    client: null,
    joined: false,
    published: false,
    localStream: null,
    remoteStreams: [],
    params: {}
};

// Options for joining a channel
var option = {
    appID: "ea140f02d32e4221adbd78fe632c4628",
    channel: "ADDA",
    uid: null,
    token: "006ea140f02d32e4221adbd78fe632c4628IAA17y8IKGpbJ79rxKRLDfm6a3eXa8cQLQEg7+qseFpb2F8+seAAAAAAEADnMOtSoJabXwEAAQCglptf"
};

// Create a client
rtc.client = AgoraRTC.createClient({ mode: "rtc", codec: "h264" });

// Initialize the client
rtc.client.init(option.appID, function () {
    console.log("init success");
}, (err) => {
    console.error(err);
});



// Join a channel
rtc.client.join(option.token, option.channel, option.uid, function (uid) {
    console.log("join channel: " + option.channel + " success, uid: " + uid);
    rtc.params.uid = uid;
}, function (err) {
    console.error("client join failed", err);
});


// Create a local stream
rtc.localStream = AgoraRTC.createStream({
    streamID: rtc.params.uid,
    audio: true,
    video: true,
    screen: false,
});

// Initialize the local stream
rtc.localStream.init(function () {
    console.log("init local stream success");
    // play stream with html element id "local_stream"
    rtc.localStream.play("liveStreaming");

    
}, function (err) {
    console.error("init local stream failed ", err);
});
function publish() {// Publish the local stream
    console.log("publishing local stream -----------------------------------------");
    rtc.client.publish(rtc.localStream, function (err) {
        console.log("publish failed  ::: rtc local stream status");
        console.error(err);
    });

}


rtc.client.on("stream-added", function (evt) {
    console.log("sream adding ---------------------------------------------");
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    if (id !== rtc.params.uid) {
        rtc.client.subscribe(remoteStream, function (err) {
            console.log("stream subscribe failed", err);
        });
    }
    console.log("stream-added remote-uid: ", id);
});

rtc.client.on("stream-subscribed", function (evt) {
    console.log("stream subscribing -------------------------------------------");
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    // Add a view for the remote stream.
    addView(id);
    // Play the remote stream.
    remoteStream.play("remote_video_" + id);
    console.log("stream-subscribed remote-uid: ", id);
});






function addView(id) {
    console.log("adding view --------------------------------------------------------");
    if (!$("#" + id)[0]) {
        $("<div/>", {
            id: "remote_video_panel_" + id,
            class: "video-view",
        }).appendTo("#liveStreamin");

        $("<div/>", {
            id: "remote_video_" + id,
            class: "video-placeholder",
        }).appendTo("#remote_video_panel_" + id);

        
        $("<div/>", {
            id: "video_autoplay_" + id,
            class: "autoplay-fallback hide",
        }).appendTo("#remote_video_panel_" + id);
    }

    console.log("added view --------------------------------------------------------------");
}
function removeView(id) {
    if ($("#remote_video_panel_" + id)[0]) {
        $("#remote_video_panel_" + id).remove();
    }
}

