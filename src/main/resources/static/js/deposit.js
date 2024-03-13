let openImageInput = () =>{
	document.getElementById("fileInput").click();
}

let closeFileInput = () =>{
	document.getElementById("uploadModel").style.display="none";
}

let closeForm = () =>{
	document.getElementById("formModel").style.display="none";
}

document.getElementById('fileInput').addEventListener('input', function () {
	closeFileInput();
	showLoading();
	
    var imageFile = this.files[0];
    if (!imageFile) return;

    var img = document.getElementById('uploadedImage');
    
    img.style.display = 'block';
    img.src = URL.createObjectURL(imageFile);
    img.style.maxWidth= "97%";
    
    document.getElementById("formModel").style.display="flex";
    
    closeLoading();
});

let showLoading = () =>{
	document.getElementsByClassName("loadingImage")[0].style.display="flex";
}

let closeLoading = () =>{
	document.getElementsByClassName("loadingImage")[0].style.display="none";
}

function showFileInput() {
	showLoading();
	
	var selectedUpiId = document.querySelector('input[name="upi"]:checked').value;
	document.getElementById('selectedUpiId').value = selectedUpiId;
	
	document.getElementById("uploadModel").style.display="flex";
	
	closeLoading();
}

let backAndShowFileInput = ()=>{
	closeForm();
	document.getElementById('fileInput').value="";
	showFileInput();
}