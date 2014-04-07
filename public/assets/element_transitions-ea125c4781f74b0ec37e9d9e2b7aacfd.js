function SwitchOneAndTwo() {
	var one = document.getElementById("plate-one")
	var two = document.getElementById("plate-two")
	if (two.style.height=="0px")
		two.style.height="auto",
		two.style.opacity="1",
		one.style.height="0px",
		one.style.opacity="0";
	else
		two.style.height="0px",
		two.style.opacity="0",
		one.style.height="auto",
		one.style.opacity="1";
}
function SlideOutTwo(){
	var two = document.getElementById("plate-two")
	if (two.style.width=="0px")
		two.style.height="auto",
		two.style.width="396px";
	else
		two.style.height="0px",
		two.style.width="0px";
}
function SlideOutThreeOrSwitchForFour() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	if (three.style.width=="0px")
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
	else
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px";
}
function SlideOutFourOrSwitchForThree() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	if (four.style.width=="0px")
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px",
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px";
	else
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
}
;
