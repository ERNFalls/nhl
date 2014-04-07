function ShowEditPIPMatterDIV(){
	if (edit_pipmatter_div.style.display=="none")
		show_pipmatter_div.style.display="none",
		edit_pipmatter_div.style.display="block";
	else
		show_pipmatter_div.style.display="block",
		edit_pipmatter_div.style.display="none";
}
function ShowDocketDIV(){
	if (show_docket_div.style.display=="none")
		show_docket_div.style.display="block",
		show_docket_row.style.display="none",
		hide_docket_row.style.display="block";
	else
		show_docket_div.style.display="none",
		show_docket_row.style.display="block",
		hide_docket_row.style.display="none";
}
function ShowPIPDemandDIV(){
	if (pipdemand_div.style.display=="none")
		pipdemand_div.style.display="block",
		add_pipdemand_div.style.display="none",
		pipcheck_div.style.display="none",
		add_pipcheck_div.style.display="none",
		note_div.style.display="none",
		add_note_div.style.display="none";
	else
		pipdemand_div.style.display="none";
}
function ShowAddPIPDemandDIV(){
	if (add_pipdemand_div.style.display=="none")
		pipdemand_div.style.display="none",
		add_pipdemand_div.style.display="block",
		pipcheck_div.style.display="none",
		add_pipcheck_div.style.display="none",
		note_div.style.display="none",
		add_note_div.style.display="none";
	else
		add_pipdemand_div.style.display="none";
}
function ShowPIPCheckDIV(){
	if (pipcheck_div.style.display=="none")
		pipdemand_div.style.display="none",
		add_pipdemand_div.style.display="none",
		pipcheck_div.style.display="block",
		add_pipcheck_div.style.display="none",
		note_div.style.display="none",
		add_note_div.style.display="none";
	else
		pipcheck_div.style.display="none";
}
function ShowAddPIPCheckDIV(){
	if (add_pipcheck_div.style.display=="none")
		pipdemand_div.style.display="none",
		add_pipdemand_div.style.display="none",
		pipcheck_div.style.display="none",
		add_pipcheck_div.style.display="block",
		note_div.style.display="none",
		add_note_div.style.display="none";
	else
		add_pipcheck_div.style.display="none";
}
function ShowNoteDIV(){
	if (note_div.style.display=="none")
		pipdemand_div.style.display="none",
		add_pipdemand_div.style.display="none",
		pipcheck_div.style.display="none",
		add_pipcheck_div.style.display="none",
		note_div.style.display="block",
		add_note_div.style.display="none";
	else
		note_div.style.display="none";
}
function ShowAddNoteDIV(){
	if (add_note_div.style.display=="none")
		pipdemand_div.style.display="none",
		add_pipdemand_div.style.display="none",
		pipcheck_div.style.display="none",
		add_pipcheck_div.style.display="none",
		note_div.style.display="none",
		add_note_div.style.display="block";
	else
		add_note_div.style.display="none";
}
