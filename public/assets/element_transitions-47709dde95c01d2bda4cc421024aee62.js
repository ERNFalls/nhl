function SwitchOneAndTwo() {
	var one = document.getElementById("plate-one")
	var two = document.getElementById("plate-two")
	var control = document.getElementById("control-two")
	if (two.style.width=="0px")
		one.style.marginLeft="396px",
		one.style.opacity="0",
		one.style.width="0px",
		two.style.marginLeft="396px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			one.style.height="0px",
			two.style.height="auto",
			two.style.marginLeft="0px",
			two.style.opacity="1",
			two.style.width="396px";
		}, 500);
	else
		two.style.marginLeft="396px",
		two.style.opacity="0",
		two.style.width="0px",
		one.style.marginLeft="396px",
		control.style.backgroundColor="transparent",
		setTimeout(function() {
			two.style.height="0px",
			one.style.height="auto",
			one.style.marginLeft="0px",
			one.style.opacity="1",
			one.style.width="396px";
		}, 500);
}
function SlideOutTwo() {
	var two = document.getElementById("plate-two")
	var control = document.getElementById("control-two")
	if (two.style.width=="0px")
		two.style.height="auto",
		two.style.opacity="1",
		two.style.width="396px",
		control.style.backgroundColor="coral";
	else
		two.style.height="0px",
		two.style.opacity="0",
		two.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutThree() {
	var three = document.getElementById("plate-three")
	var control = document.getElementById("control-four")
	if (three.style.width=="0px")
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px",
		control.style.backgroundColor="coral";
	else
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutThreeOrSwitchForFour() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	var control = document.getElementById("control-four")
	if (three.style.width=="0px" && four.style.width=="0px")
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px",
		control.style.backgroundColor="coral";
	else if (three.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			three.style.height="auto",
			three.style.opacity="1",
			three.style.width="396px";
		}, 500);
	else if (three.style.width!="0px" && four.style.width=="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (three.style.width!="0px" && four.style.width!="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutFourOrSwitchForThree() {
	var three = document.getElementById("plate-three")
	var four = document.getElementById("plate-four")
	var control = document.getElementById("control-four")
	if (three.style.width=="0px" && four.style.width=="0px")
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px",
		control.style.backgroundColor="coral";
	else if (three.style.width!="0px" && four.style.width=="0px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			four.style.height="auto",
			four.style.opacity="1",
			four.style.width="396px";
			}, 500);
	else if (three.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (three.style.width!="0px" && four.style.width!="396px")
		three.style.height="0px",
		three.style.opacity="0",
		three.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutFourOrSwitchForFive() {
	var four = document.getElementById("plate-four")
	var five = document.getElementById("plate-five")
	var control = document.getElementById("control-five")
	if (four.style.width=="0px" && five.style.width=="0px")
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px",
		control.style.backgroundColor="coral";
	else if (four.style.width=="0px" && five.style.width!="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			four.style.height="auto",
			four.style.opacity="1",
			four.style.width="396px";
		}, 500);
	else if (four.style.width!="0px" && five.style.width=="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (four.style.width!="0px" && five.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutFiveOrSwitchForFour() {
	var five = document.getElementById("plate-five")
	var four = document.getElementById("plate-four")
	var control = document.getElementById("control-five")
	if (five.style.width=="0px" && four.style.width=="0px")
		five.style.height="auto",
		five.style.opacity="1",
		five.style.width="396px",
		control.style.backgroundColor="coral";
	else if (five.style.width=="0px" && four.style.width!="0px")
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			five.style.height="auto",
			five.style.opacity="1",
			five.style.width="396px";
		}, 500);
	else if (five.style.width!="0px" && four.style.width=="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (five.style.width!="0px" && four.style.width!="0px")
		five.style.height="0px",
		five.style.opacity="0",
		five.style.width="0px",
		four.style.height="0px",
		four.style.opacity="0",
		four.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutSixOrSwitchForSeven() {
	var six = document.getElementById("plate-six")
	var seven = document.getElementById("plate-seven")
	var control = document.getElementById("control-six")
	if (six.style.width=="0px" && seven.style.width=="0px")
		six.style.height="auto",
		six.style.opacity="1",
		six.style.width="396px",
		control.style.backgroundColor="coral";
	else if (six.style.width=="0px" && seven.style.width!="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			six.style.height="auto",
			six.style.opacity="1",
			six.style.width="396px";
		}, 500);
	else if (six.style.width!="0px" && seven.style.width=="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (six.style.width!="0px" && seven.style.width!="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutSevenOrSwitchForSix() {
	var seven = document.getElementById("plate-seven")
	var six = document.getElementById("plate-six")
	var control = document.getElementById("control-six")
	if (seven.style.width=="0px" && six.style.width=="0px")
		seven.style.height="auto",
		seven.style.opacity="1",
		seven.style.width="396px",
		control.style.backgroundColor="coral";
	else if (seven.style.width=="0px" && six.style.width!="0px")
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			seven.style.height="auto",
			seven.style.opacity="1",
			seven.style.width="396px";
		}, 500);
	else if (seven.style.width!="0px" && six.style.width=="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (seven.style.width!="0px" && six.style.width!="0px")
		seven.style.height="0px",
		seven.style.opacity="0",
		seven.style.width="0px",
		six.style.height="0px",
		six.style.opacity="0",
		six.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutEightOrSwitchForNine() {
	var eight = document.getElementById("plate-eight")
	var nine = document.getElementById("plate-nine")
	var control = document.getElementById("control-seven")
	if (eight.style.width=="0px" && nine.style.width=="0px")
		eight.style.height="auto",
		eight.style.opacity="1",
		eight.style.width="396px",
		control.style.backgroundColor="coral";
	else if (eight.style.width=="0px" && nine.style.width!="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			eight.style.height="auto",
			eight.style.opacity="1",
			eight.style.width="396px";
		}, 500);
	else if (eight.style.width!="0px" && nine.style.width=="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (eight.style.width!="0px" && nine.style.width!="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutNineOrSwitchForEight() {
	var nine = document.getElementById("plate-nine")
	var eight = document.getElementById("plate-eight")
	var control = document.getElementById("control-seven")
	if (nine.style.width=="0px" && eight.style.width=="0px")
		nine.style.height="auto",
		nine.style.opacity="1",
		nine.style.width="396px",
		control.style.backgroundColor="coral";
	else if (nine.style.width=="0px" && eight.style.width!="0px")
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			nine.style.height="auto",
			nine.style.opacity="1",
			nine.style.width="396px";
		}, 500);
	else if (nine.style.width!="0px" && eight.style.width=="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (nine.style.width!="0px" && eight.style.width!="0px")
		nine.style.height="0px",
		nine.style.opacity="0",
		nine.style.width="0px",
		eight.style.height="0px",
		eight.style.opacity="0",
		eight.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutTenOrSwitchForEleven() {
	var ten = document.getElementById("plate-ten")
	var eleven = document.getElementById("plate-eleven")
	var control = document.getElementById("control-eight")
	if (ten.style.width=="0px" && eleven.style.width=="0px")
		ten.style.height="auto",
		ten.style.opacity="1",
		ten.style.width="396px",
		control.style.backgroundColor="coral";
	else if (ten.style.width=="0px" && eleven.style.width!="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			ten.style.height="auto",
			ten.style.opacity="1",
			ten.style.width="396px";
		}, 500);
	else if (ten.style.width!="0px" && eleven.style.width=="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (ten.style.width!="0px" && eleven.style.width!="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutElevenOrSwitchForTen() {
	var eleven = document.getElementById("plate-eleven")
	var ten = document.getElementById("plate-ten")
	var control = document.getElementById("control-eight")
	if (eleven.style.width=="0px" && ten.style.width=="0px")
		eleven.style.height="auto",
		eleven.style.opacity="1",
		eleven.style.width="396px",
		control.style.backgroundColor="coral";
	else if (eleven.style.width=="0px" && ten.style.width!="0px")
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		control.style.backgroundColor="coral",
		setTimeout(function() {
			eleven.style.height="auto",
			eleven.style.opacity="1",
			eleven.style.width="396px";
		}, 500);
	else if (eleven.style.width!="0px" && ten.style.width=="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (eleven.style.width!="0px" && ten.style.width!="0px")
		eleven.style.height="0px",
		eleven.style.opacity="0",
		eleven.style.width="0px",
		ten.style.height="0px",
		ten.style.opacity="0",
		ten.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutTwelve() {
	var twelve = document.getElementById("plate-twelve")
	var control = document.getElementById("control-nine")
	if (twelve.style.width=="0px")
		twelve.style.height="auto",
		twelve.style.opacity="1",
		twelve.style.width="396px",
		control.style.backgroundColor="coral";
	else
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px",
		control.style.backgroundColor="transparent";
}
;
