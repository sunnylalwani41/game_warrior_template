let showLoading = () =>{
	let loadingDiv = document.getElementById("loadingDiv");
	
	loadingDiv.style.display="flex";
}

let closeLoading = () =>{
	document.getElementById("loadingDiv").style.display="none";
}

let showData = (requestId, amount) =>{
	let actionDiv = document.getElementById("actionDiv");
	let div = document.createElement("div");
	
	div.setAttribute("class", "cart");
	
	let form = document.createElement("form");
	
	form.setAttribute("action", "approveWithdrawRequest");
	form.setAttribute("method", "POST");
	
	let p = document.createElement("p");
	
	p.innerHTML= `<b>Amount : </b>`+ amount;
	
	let input= document.createElement("input");
	
	input.setAttribute("type", "text");
	input.setAttribute("placeholder", "Please Enter the UTR Number");
	input.setAttribute("name", "utr");
	input.setAttribute("required", "");
	
	let id = document.createElement("input");
	
	id.setAttribute("type", "hidden");
	id.setAttribute("name", "id");
	id.setAttribute("value", requestId);
	
	let br = document.createElement("br");
	
	let submit = document.createElement("button");
	
	submit.setAttribute("class", "btn btn-success");
	submit.innerText="Approve";
	
	let hr = document.createElement("hr");
	let separatorContainer = document.createElement("div");
	
	hr.setAttribute("class", "separator");
	separatorContainer.setAttribute("class", "separator-container");
	
	let or = document.createElement("span");
	
	or.setAttribute("class", "or");
	
	or.innerText="OR";
	
	let rejectionForm = document.createElement("form");
	
	rejectionForm.setAttribute("action", "rejectWithdrawRequest");
	rejectionForm.setAttribute("method", "POST");
	
	let rejectionId = document.createElement("input");
	
	rejectionId.setAttribute("type", "hidden");
	rejectionId.setAttribute("name", "id");
	rejectionId.setAttribute("value", requestId);
	
	let rejectionSubmit = document.createElement("button");
	
	rejectionSubmit.setAttribute("class", "btn btn-success");
	rejectionSubmit.innerText="Reject";	
	
	separatorContainer.append(hr, or);
	rejectionForm.append(rejectionId, rejectionSubmit);
	form.append(p, input, id, br, submit);
	div.append(form, separatorContainer, rejectionForm);
	actionDiv.append(div);
	actionDiv.style.display="flex";
}

let withdrawRequestAction = (id, amount) =>{
	showLoading();
	
	showData(id, amount);
	
	closeLoading();
}