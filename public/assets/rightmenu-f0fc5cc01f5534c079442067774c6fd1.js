function ShowAddContactShortForm(){
	if (document.getElementById("add-contact-right-menu-slide-out-section").style.width=="345px")
		document.getElementById("add-contact-right-menu-slide-out-section").setAttribute("style",
		"background: #F6F6F6; height: 96px; width: 24px;"),
		document.getElementById("add-contact-right-menu").style.height="98px",
		document.getElementById("general-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="none",
		document.getElementById("select-contact-type-field").value="Select Contact Type";
	else
		document.getElementById("add-contact-right-menu-slide-out-section").setAttribute("style",
		"background: #4061A3; height: 395px; width: 345px;"),
		document.getElementById("add-contact-right-menu").style.height="397px";
}
function ShowSearchContacts(){
	if (document.getElementById("search-contacts-right-menu-slide-out-section").style.width=="345px")
		document.getElementById("search-contacts-right-menu-slide-out-section").setAttribute("style",
		"background: #F6F6F6; height: 96px; width: 24px;"),
		document.getElementById("search-contacts-right-menu").style.height="98px";
	else
		document.getElementById("search-contacts-right-menu-slide-out-section").setAttribute("style",
		"background: #4061A3; height: 395px; margin-top: -98px; width: 345px;"),
		document.getElementById("search-contacts-right-menu").style.height="98px";
}
function ShowTypeForm(){
	var selopt = document.getElementById("select-contact-type-field").value;
	if (selopt=="Select Contact Type")
		document.getElementById("general-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="none";
	if (selopt!="Select Contact Type")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("submit-contact").style.display="block";
}
;
