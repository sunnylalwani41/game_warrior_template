let addGame_container= document.getElementsByClassName("addGame-container")[0];

let addGame =(event)=>{
	event.preventDefault();

	let input= document.createElement("input");
	input.setAttribute("name", "game");
	input.setAttribute("type", "text");
	input.setAttribute("placeholder", "Enter the Game");
	addGame_container.append(input);
}