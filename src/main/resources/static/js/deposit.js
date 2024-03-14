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

let copyTheUpi= (index) =>{
	let upiID = document.getElementsByClassName('upiID')[index].textContent;
	let copyCompleteSymbol = document.getElementsByClassName("copyComplete")[index];
	let copyButton = document.getElementsByClassName("copyButton")[index];
	
	navigator.clipboard.writeText(upiID)
	    .then(() => {
	    // Success message (optional)
	    	console.log("UPI ID copied to clipboard!");
	    })
	    .catch(err => {
	    // Error handling (optional)
	    	console.error("Failed to copy UPI ID:", err);
	 });
	 
	 copyButton.style.display="none";
	 copyCompleteSymbol.style.display= "inline";
	 
	 setTimeout(()=>{
	 	copyCompleteSymbol.style.display= "none";
		 copyButton.style.display="inline";
	 }, 1000)
}