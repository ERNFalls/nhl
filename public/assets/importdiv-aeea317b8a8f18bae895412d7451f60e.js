function ShowImportDIV(){
	if (document.getElementById("import-div").style.width=="0px")
		document.getElementById("import-div").style.visibility="visible",
		document.getElementById("import-div").style.width="380px";
	else
		document.getElementById("import-div").style.visibility="hidden",
		document.getElementById("import-div").style.width="0px";
}
;
