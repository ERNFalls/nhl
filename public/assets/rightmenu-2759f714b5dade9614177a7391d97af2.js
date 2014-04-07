function ShowAddContactShortForm(){
	if (document.getElementById("add-contact-right-menu-slide-out-section").style.width=="345px")
		document.getElementById("add-contact-right-menu-slide-out-section").setAttribute("style",
		"background: #F6F6F6; height: 96px; width: 24px;"),
		document.getElementById("add-contact-right-menu").style.height="98px",
		document.getElementById("general-form-section").style.display="none",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
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
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="none";
	if (selopt=="Claims Adjuster")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="block",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="Client")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="block",
		document.getElementById("client-checkbox").checked=true,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="General")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="Insurance Company")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="block",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="Judge")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="block",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="Medical Provider")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="block",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="Opposing Counsel")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="block",
		document.getElementById("pip-carrier-form-section").style.display="none",
		document.getElementById("submit-contact").style.display="block";
	if (selopt=="PIP Carrier")
		document.getElementById("general-form-section").style.display="block",
		document.getElementById("claims-adjuster-form-section").style.display="none",
		document.getElementById("client-form-section").style.display="none",
		document.getElementById("client-checkbox").checked=false,
		document.getElementById("insurance-company-form-section").style.display="none",
		document.getElementById("judge-form-section").style.display="none",
		document.getElementById("medical-provider-form-section").style.display="none",
		document.getElementById("opposing-counsel-form-section").style.display="none",
		document.getElementById("pip-carrier-form-section").style.display="block",
		document.getElementById("submit-contact").style.display="block";
}
;
