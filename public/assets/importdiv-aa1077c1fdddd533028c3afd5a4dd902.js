function ShowImportDIV(){
	var formtwo = document.getElementById("form-div-two")
	if (formtwo.style.width=="0px")
		formtwo.style.opacity="1",
		formtwo.style.width="auto";
	else
		formtwo.style.opacity="0",
		formtwo.style.width="0px";
}
;
