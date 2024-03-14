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