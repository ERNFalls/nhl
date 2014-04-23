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
		control.style.backgroundColor="coral",
		four.style.width="0px",
		three.style.height="auto",
		three.style.opacity="1",
		three.style.width="396px";
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
		control.style.backgroundColor="coral",
		three.style.width="0px",
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px";
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
		four.style.height="auto",
		four.style.opacity="1",
		four.style.width="396px";
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
		five.style.height="auto",
		five.style.opacity="1",
		five.style.width="396px";
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
		six.style.height="auto",
		six.style.opacity="1",
		six.style.width="396px";
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
		seven.style.height="auto",
		seven.style.opacity="1",
		seven.style.width="396px";
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
		nine.style.height="auto",
		nine.style.opacity="1",
		nine.style.width="396px";
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
		ten.style.height="auto",
		ten.style.opacity="1",
		ten.style.width="396px";
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
		eleven.style.height="auto",
		eleven.style.opacity="1",
		eleven.style.width="396px";
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
function SlideOutThirteen() {
	var thirteen = document.getElementById("plate-thirteen")
	var control = document.getElementById("control-ten")
	if (thirteen.style.width=="0px")
		thirteen.style.height="auto",
		thirteen.style.opacity="1",
		thirteen.style.width="396px",
		control.style.backgroundColor="coral";
	else
		thirteen.style.height="0px",
		thirteen.style.opacity="0",
		thirteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutTwelveOrSwitchForThirteen() {
	var twelve = document.getElementById("plate-twelve")
	var thirteen = document.getElementById("plate-thirteen")
	var control = document.getElementById("control-nine")
	if (twelve.style.width=="0px" && thirteen.style.width=="0px")
		twelve.style.height="auto",
		twelve.style.opacity="1",
		twelve.style.width="396px",
		control.style.backgroundColor="coral";
	else if (twelve.style.width=="0px" && thirteen.style.width!="0px")
		thirteen.style.height="0px",
		thirteen.style.opacity="0",
		thirteen.style.width="0px",
		control.style.backgroundColor="coral",
		twelve.style.height="auto",
		twelve.style.opacity="1",
		twelve.style.width="396px";
	else if (twelve.style.width!="0px" && thirteen.style.width=="0px")
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (twelve.style.width!="0px" && thirteen.style.width!="0px")
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px",
		thirteen.style.height="0px",
		thirteen.style.opacity="0",
		thirteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutThirteenOrSwitchForTwelve() {
	var thirteen = document.getElementById("plate-thirteen")
	var twelve = document.getElementById("plate-twelve")
	var control = document.getElementById("control-nine")
	if (thirteen.style.width=="0px" && twelve.style.width=="0px")
		thirteen.style.height="auto",
		thirteen.style.opacity="1",
		thirteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (thirteen.style.width=="0px" && twelve.style.width!="0px")
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px",
		control.style.backgroundColor="coral",
		thirteen.style.height="auto",
		thirteen.style.opacity="1",
		thirteen.style.width="396px";
	else if (thirteen.style.width!="0px" && twelve.style.width=="0px")
		thirteen.style.height="0px",
		thirteen.style.opacity="0",
		thirteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (thirteen.style.width!="0px" && twelve.style.width!="0px")
		thirteen.style.height="0px",
		thirteen.style.opacity="0",
		thirteen.style.width="0px",
		twelve.style.height="0px",
		twelve.style.opacity="0",
		twelve.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutFourteenOrSwitchForFifteen() {
	var fourteen = document.getElementById("plate-fourteen")
	var fifteen = document.getElementById("plate-fifteen")
	var control = document.getElementById("control-ten")
	if (fourteen.style.width=="0px" && fifteen.style.width=="0px")
		fourteen.style.height="auto",
		fourteen.style.opacity="1",
		fourteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (fourteen.style.width=="0px" && fifteen.style.width!="0px")
		fifteen.style.height="0px",
		fifteen.style.opacity="0",
		fifteen.style.width="0px",
		control.style.backgroundColor="coral",
		fourteen.style.height="auto",
		fourteen.style.opacity="1",
		fourteen.style.width="396px";
	else if (fourteen.style.width!="0px" && fifteen.style.width=="0px")
		fourteen.style.height="0px",
		fourteen.style.opacity="0",
		fourteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (fourteen.style.width!="0px" && fifteen.style.width!="0px")
		fourteen.style.height="0px",
		fourteen.style.opacity="0",
		fourteen.style.width="0px",
		fifteen.style.height="0px",
		fifteen.style.opacity="0",
		fifteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutFifteenOrSwitchForFourteen() {
	var fifteen = document.getElementById("plate-fifteen")
	var fourteen = document.getElementById("plate-fourteen")
	var control = document.getElementById("control-ten")
	if (fifteen.style.width=="0px" && fourteen.style.width=="0px")
		fifteen.style.height="auto",
		fifteen.style.opacity="1",
		fifteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (fifteen.style.width=="0px" && fourteen.style.width!="0px")
		fourteen.style.height="0px",
		fourteen.style.opacity="0",
		fourteen.style.width="0px",
		control.style.backgroundColor="coral",
		fifteen.style.height="auto",
		fifteen.style.opacity="1",
		fifteen.style.width="396px";
	else if (fifteen.style.width!="0px" && fourteen.style.width=="0px")
		fifteen.style.height="0px",
		fifteen.style.opacity="0",
		fifteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (fifteen.style.width!="0px" && fourteen.style.width!="0px")
		fifteen.style.height="0px",
		fifteen.style.opacity="0",
		fifteen.style.width="0px",
		fourteen.style.height="0px",
		fourteen.style.opacity="0",
		fourteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutSixteenOrSwitchForSeventeen() {
	var sixteen = document.getElementById("plate-sixteen")
	var seventeen = document.getElementById("plate-seventeen")
	var control = document.getElementById("control-eleven")
	if (sixteen.style.width=="0px" && seventeen.style.width=="0px")
		sixteen.style.height="auto",
		sixteen.style.opacity="1",
		sixteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (sixteen.style.width=="0px" && seventeen.style.width!="0px")
		seventeen.style.height="0px",
		seventeen.style.opacity="0",
		seventeen.style.width="0px",
		control.style.backgroundColor="coral",
		sixteen.style.height="auto",
		sixteen.style.opacity="1",
		sixteen.style.width="396px";
	else if (sixteen.style.width!="0px" && seventeen.style.width=="0px")
		sixteen.style.height="0px",
		sixteen.style.opacity="0",
		sixteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (sixteen.style.width!="0px" && seventeen.style.width!="0px")
		sixteen.style.height="0px",
		sixteen.style.opacity="0",
		sixteen.style.width="0px",
		seventeen.style.height="0px",
		seventeen.style.opacity="0",
		seventeen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutSeventeenOrSwitchForSixteen() {
	var seventeen = document.getElementById("plate-seventeen")
	var sixteen = document.getElementById("plate-sixteen")
	var control = document.getElementById("control-eleven")
	if (seventeen.style.width=="0px" && sixteen.style.width=="0px")
		seventeen.style.height="auto",
		seventeen.style.opacity="1",
		seventeen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (seventeen.style.width=="0px" && sixteen.style.width!="0px")
		sixteen.style.height="0px",
		sixteen.style.opacity="0",
		sixteen.style.width="0px",
		control.style.backgroundColor="coral",
		seventeen.style.height="auto",
		seventeen.style.opacity="1",
		seventeen.style.width="396px";
	else if (seventeen.style.width!="0px" && sixteen.style.width=="0px")
		seventeen.style.height="0px",
		seventeen.style.opacity="0",
		seventeen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (seventeen.style.width!="0px" && sixteen.style.width!="0px")
		seventeen.style.height="0px",
		seventeen.style.opacity="0",
		seventeen.style.width="0px",
		sixteen.style.height="0px",
		sixteen.style.opacity="0",
		sixteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutEighteenOrSwitchForNineteen() {
	var eighteen = document.getElementById("plate-eighteen")
	var nineteen = document.getElementById("plate-nineteen")
	var control = document.getElementById("control-twelve")
	if (eighteen.style.width=="0px" && nineteen.style.width=="0px")
		eighteen.style.height="auto",
		eighteen.style.opacity="1",
		eighteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (eighteen.style.width=="0px" && nineteen.style.width!="0px")
		nineteen.style.height="0px",
		nineteen.style.opacity="0",
		nineteen.style.width="0px",
		control.style.backgroundColor="coral",
		eighteen.style.height="auto",
		eighteen.style.opacity="1",
		eighteen.style.width="396px";
	else if (eighteen.style.width!="0px" && nineteen.style.width=="0px")
		eighteen.style.height="0px",
		eighteen.style.opacity="0",
		eighteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (eighteen.style.width!="0px" && nineteen.style.width!="0px")
		eighteen.style.height="0px",
		eighteen.style.opacity="0",
		eighteen.style.width="0px",
		nineteen.style.height="0px",
		nineteen.style.opacity="0",
		nineteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutNineteenOrSwitchForEighteen() {
	var nineteen = document.getElementById("plate-nineteen")
	var eighteen = document.getElementById("plate-eighteen")
	var control = document.getElementById("control-twelve")
	if (nineteen.style.width=="0px" && eighteen.style.width=="0px")
		nineteen.style.height="auto",
		nineteen.style.opacity="1",
		nineteen.style.width="396px",
		control.style.backgroundColor="coral";
	else if (nineteen.style.width=="0px" && eighteen.style.width!="0px")
		eighteen.style.height="0px",
		eighteen.style.opacity="0",
		eighteen.style.width="0px",
		control.style.backgroundColor="coral",
		nineteen.style.height="auto",
		nineteen.style.opacity="1",
		nineteen.style.width="396px";
	else if (nineteen.style.width!="0px" && eighteen.style.width=="0px")
		nineteen.style.height="0px",
		nineteen.style.opacity="0",
		nineteen.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (nineteen.style.width!="0px" && eighteen.style.width!="0px")
		nineteen.style.height="0px",
		nineteen.style.opacity="0",
		nineteen.style.width="0px",
		eighteen.style.height="0px",
		eighteen.style.opacity="0",
		eighteen.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutTwentyOrSwitchForTwentyOne() {
	var twenty = document.getElementById("plate-twenty")
	var twentyone = document.getElementById("plate-twenty-one")
	var control = document.getElementById("control-thirteen")
	if (twenty.style.width=="0px" && twentyone.style.width=="0px")
		twenty.style.height="auto",
		twenty.style.opacity="1",
		twenty.style.width="396px",
		control.style.backgroundColor="coral";
	else if (twenty.style.width=="0px" && twentyone.style.width!="0px")
		twentyone.style.height="0px",
		twentyone.style.opacity="0",
		twentyone.style.width="0px",
		control.style.backgroundColor="coral",
		twenty.style.height="auto",
		twenty.style.opacity="1",
		twenty.style.width="396px";
	else if (twenty.style.width!="0px" && twentyone.style.width=="0px")
		twenty.style.height="0px",
		twenty.style.opacity="0",
		twenty.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (twenty.style.width!="0px" && twentyone.style.width!="0px")
		twenty.style.height="0px",
		twenty.style.opacity="0",
		twenty.style.width="0px",
		twentyone.style.height="0px",
		twentyone.style.opacity="0",
		twentyone.style.width="0px",
		control.style.backgroundColor="transparent";
}
function SlideOutTwentyOneOrSwitchForTwenty() {
	var twentyone = document.getElementById("plate-twenty-one")
	var twenty = document.getElementById("plate-twenty")
	var control = document.getElementById("control-thirteen")
	if (twentyone.style.width=="0px" && twenty.style.width=="0px")
		twentyone.style.height="auto",
		twentyone.style.opacity="1",
		twentyone.style.width="396px",
		control.style.backgroundColor="coral";
	else if (twentyone.style.width=="0px" && twenty.style.width!="0px")
		twenty.style.height="0px",
		twenty.style.opacity="0",
		twenty.style.width="0px",
		control.style.backgroundColor="coral",
		twentyone.style.height="auto",
		twentyone.style.opacity="1",
		twentyone.style.width="396px";
	else if (twentyone.style.width!="0px" && twenty.style.width=="0px")
		twentyone.style.height="0px",
		twentyone.style.opacity="0",
		twentyone.style.width="0px",
		control.style.backgroundColor="transparent";
	else if (twentyone.style.width!="0px" && twenty.style.width!="0px")
		twentyone.style.height="0px",
		twentyone.style.opacity="0",
		twentyone.style.width="0px",
		twenty.style.height="0px",
		twenty.style.opacity="0",
		twenty.style.width="0px",
		control.style.backgroundColor="transparent";
}
;
