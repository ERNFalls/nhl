function SlideOutMainWithOne() {
	var main = document.getElementById("main-div")
	var slide = document.getElementById("main-slide-one")
	if (slide.style.height=="0px")
		slide.style.height="auto",
		slide.style.opacity="1",
		main.style.height="0px",
		main.style.opacity="0";
	else
		slide.style.height="0px",
		slide.style.opacity="0",
		main.style.height="auto",
		main.style.opacity="1";
}
function ShowSubFormOnePartOne() {
	var onee = document.getElementById("slide-out-one")
	var twoo = document.getElementById("slide-out-two")
	var formtwo = document.getElementById("form-div-two")
	if (onee.style.height=="0px")
		onee.style.height="auto",
		onee.style.opacity="1",
		twoo.style.height="0px",
		twoo.style.opacity="0",
		formtwo.style.width="auto";
	else
		onee.style.opacity="0",
		onee.style.height="0px",
		formtwo.style.width="0px";
}
function ShowSubFormOnePartTwo() {
	var onee = document.getElementById("slide-out-one")
	var twoo = document.getElementById("slide-out-two")
	var formtwo = document.getElementById("form-div-two")
	if (twoo.style.height=="0px")
		twoo.style.height="auto",
		twoo.style.opacity="1",
		onee.style.height="0px",
		onee.style.opacity="0",
		formtwo.style.width="auto";
	else
		twoo.style.height="0px",
		twoo.style.opacity="0",
		formtwo.style.width="0px";
}
;
