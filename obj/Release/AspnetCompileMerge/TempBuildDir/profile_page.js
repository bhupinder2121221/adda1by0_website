function epit_pic_method() {
    console.log("edit pic clicked");
    document.getElementById("upload_pics").click();
}

window.addEventListener('load', function () {
    document.querySelector('input[type="file"]').addEventListener('change', function () {
        if (this.files && this.files[0]) {
            var img = document.getElementById('profilePic');  // $('img')[0]
            var sourceOfImage = URL.createObjectURL(this.files[0]); // set src to blob url
            if (validateFileType()) {
                img.src = sourceOfImage;
                img.onload = imageIsLoaded;


            }
            else {
                alert("Only jpg/jpeg and png files are allowed!");
            }
             
            
            
        }
    });
});

function imageIsLoaded() {
    alert("Image Loaded.");  
   
}



function validateFileType() {
    var fileName = document.getElementById("upload_pics").value;
    var idxDot = fileName.lastIndexOf(".") + 1;
    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
    if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
        return true;
    } else {
        
        return false;
    }
}
