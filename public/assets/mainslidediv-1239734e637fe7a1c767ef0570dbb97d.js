function SlideOutMainWithOne() {
	var main = document.getElementById("main-div")
	var slide = document.getElementById("main-slide-one")
	if (slide.style.width=="0px")
		slide.style.visibility="visible",
		slide.style.width="380px",
		main.style.visibility="hidden",
		main.style.width="0px";
	else
		slide.style.visibility="hidden",
		slide.style.width="0px",
		main.style.visibility="visible",
		main.style.width="380px";
}
function ShowInsuDIV() {
	var onee = document.getElementById("slide-out-one")
	var twoo = document.getElementById("slide-out-two")
	if (onee.style.width=="0px")
		onee.style.visibility="visible",
		onee.style.width="380px",
		twoo.style.visibility="hidden",
		twoo.style.width="0px";
	else
		twoo.style.visibility="hidden",
		onee.style.width="0px";
}
function ShowAddInsuDIV() {
	var onee = document.getElementById("slide-out-one")
	var twoo = document.getElementById("slide-out-two")
	if (twoo.style.width=="0px")
		twoo.style.visibility="visible",
		twoo.style.width="380px",
		onee.style.visibility="hidden",
		onee.style.width="0px";
	else
		twoo.style.visibility="hidden",
		twoo.style.width="0px";
}
;
