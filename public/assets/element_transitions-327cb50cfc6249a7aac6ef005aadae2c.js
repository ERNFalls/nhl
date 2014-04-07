function SwitchOneAndTwo() {
	var one = document.getElementById("plate-one")
	var two = document.getElementById("plate-two")
	if (two.style.width=="0px")
		one.style.marginLeft="380px",
		one.style.opacity="0",
		one.style.width="0px",
		two.style.marginLeft="380px",
		setTimeout(function() {
			one.style.height="0px",
			two.style.height="auto",
			two.style.marginLeft="0px",
			two.style.opacity="1",
			two.style.width="380px";
		}, 500);
	else
		two.style.marginLeft="380px",
		two.style.opacity="0",
		two.style.width="0px",
		one.style.marginLeft="380px",
		setTimeout(function() {
			two.style.height="0px",
			one.style.height="auto",
			one.style.marginLeft="0px",
			one.style.opacity="1",
			one.style.width="380px";
		}, 500);
}
function SlideOutTwo(){
	var two = document.getElementById("plate-two")
	if (two.style.width=="0px")
		two.style.height="auto",
		two.style.opacity="1",
		two.style.width="396px";
	else
		two.style.height="0px",
		two.style.opacity="0",
		two.style.width="0px";
}
function SlideOutThree(){
	var three = document.getElementById("plate-three")
	if (three.style.width=="0px")
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px";
	else
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px";
}
function SlideOutThreeOrSwitchForFour() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	if (three.style.width=="0px" && four.style.width=="0px")
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px";
	else if (three.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		setTimeout(function() {
			three.style.height="auto",
			three.style.opacity="1",
			three.style.width="396px";
		}, 500);
	else if (three.style.width!="0px" && four.style.width=="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px";
	else if (three.style.width!="0px" && four.style.width!="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
}
function SlideOutFourOrSwitchForThree() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	if (three.style.width=="0px" && four.style.width=="0px")
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px";
	else if (three.style.width!="0px" && four.style.width=="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		setTimeout(function() {
			four.style.height="auto",
			four.style.opacity="1",
			four.style.width="396px";
			}, 500);
	else if (three.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
	else if (three.style.width!="0px" && four.style.width!="396px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
}
function SlideOutFourOrSwitchForFive() {
	var four = document.getElementById("plate-four")
	var five = document.getElementById("plate-five")
	if (four.style.width=="0px" && five.style.width=="0px")
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px";
	else if (four.style.width=="0px" && five.style.width!="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		setTimeout(function() {
			four.style.height="auto",
			four.style.opacity="1",
			four.style.width="396px";
		}, 500);
	else if (four.style.width!="0px" && five.style.width=="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
	else if (four.style.width!="0px" && five.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px";
}
function SlideOutFiveOrSwitchForFour() {
	var five = document.getElementById("plate-five")
	var four = document.getElementById("plate-four")
	if (five.style.width=="0px" && four.style.width=="0px")
		five.style.height="auto",
		five.style.opacity="1",
		five.style.width="396px";
	else if (five.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		setTimeout(function() {
			five.style.height="auto",
			five.style.opacity="1",
			five.style.width="396px";
		}, 500);
	else if (five.style.width!="0px" && four.style.width=="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px";
	else if (five.style.width!="0px" && four.style.width!="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px";
}
function SlideOutSixOrSwitchForSeven() {
	var six = document.getElementById("plate-six")
	var seven = document.getElementById("plate-seven")
	if (six.style.width=="0px" && seven.style.width=="0px")
		six.style.height="auto",
		six.style.opacity="1",
		six.style.width="396px";
	else if (six.style.width=="0px" && seven.style.width!="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		setTimeout(function() {
			six.style.height="auto",
			six.style.opacity="1",
			six.style.width="396px";
		}, 500);
	else if (six.style.width!="0px" && seven.style.width=="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px";
	else if (six.style.width!="0px" && seven.style.width!="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px";
}
function SlideOutSevenOrSwitchForSix() {
	var seven = document.getElementById("plate-seven")
	var six = document.getElementById("plate-six")
	if (seven.style.width=="0px" && six.style.width=="0px")
		seven.style.height="auto",
		seven.style.opacity="1",
		seven.style.width="396px";
	else if (seven.style.width=="0px" && six.style.width!="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		setTimeout(function() {
			seven.style.height="auto",
			seven.style.opacity="1",
			seven.style.width="396px";
		}, 500);
	else if (seven.style.width!="0px" && six.style.width=="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px";
	else if (seven.style.width!="0px" && six.style.width!="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px";
}
function SlideOutEightOrSwitchForNine() {
	var eight = document.getElementById("plate-eight")
	var nine = document.getElementById("plate-nine")
	if (eight.style.width=="0px" && nine.style.width=="0px")
		eight.style.height="auto",
		eight.style.opacity="1",
		eight.style.width="396px";
	else if (eight.style.width=="0px" && nine.style.width!="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		setTimeout(function() {
			eight.style.height="auto",
			eight.style.opacity="1",
			eight.style.width="396px";
		}, 500);
	else if (eight.style.width!="0px" && nine.style.width=="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px";
	else if (eight.style.width!="0px" && nine.style.width!="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px";
}
function SlideOutNineOrSwitchForEight() {
	var nine = document.getElementById("plate-nine")
	var eight = document.getElementById("plate-eight")
	if (nine.style.width=="0px" && eight.style.width=="0px")
		nine.style.height="auto",
		nine.style.opacity="1",
		nine.style.width="396px";
	else if (nine.style.width=="0px" && eight.style.width!="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		setTimeout(function() {
			nine.style.height="auto",
			nine.style.opacity="1",
			nine.style.width="396px";
		}, 500);
	else if (nine.style.width!="0px" && eight.style.width=="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px";
	else if (nine.style.width!="0px" && eight.style.width!="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px";
}
function SlideOutTenOrSwitchForEleven() {
	var ten = document.getElementById("plate-ten")
	var eleven = document.getElementById("plate-eleven")
	if (ten.style.width=="0px" && eleven.style.width=="0px")
		ten.style.height="auto",
		ten.style.opacity="1",
		ten.style.width="396px";
	else if (ten.style.width=="0px" && eleven.style.width!="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		setTimeout(function() {
			ten.style.height="auto",
			ten.style.opacity="1",
			ten.style.width="396px";
		}, 500);
	else if (ten.style.width!="0px" && eleven.style.width=="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px";
	else if (ten.style.width!="0px" && eleven.style.width!="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px";
}
function SlideOutElevenOrSwitchForTen() {
	var eleven = document.getElementById("plate-eleven")
	var ten = document.getElementById("plate-ten")
	if (eleven.style.width=="0px" && ten.style.width=="0px")
		eleven.style.height="auto",
		eleven.style.opacity="1",
		eleven.style.width="396px";
	else if (eleven.style.width=="0px" && ten.style.width!="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		setTimeout(function() {
			eleven.style.height="auto",
			eleven.style.opacity="1",
			eleven.style.width="396px";
		}, 500);
	else if (eleven.style.width!="0px" && ten.style.width=="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px";
	else if (eleven.style.width!="0px" && ten.style.width!="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px";
}
function SlideOutTwelve(){
	var twelve = document.getElementById("plate-twelve")
	if (twelve.style.width=="0px")
		twelve.style.height="auto",
		twelve.style.opacity="1",
		twelve.style.width="396px";
	else
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px";
}
;
