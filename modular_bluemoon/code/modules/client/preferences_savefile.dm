/datum/preferences/proc/bluemoon_character_pref_load(savefile/S) //TODO: modularize our other savefile edits... maybe?
	S["pda_style"] >> pda_style
	S["pda_color"] >> pda_color
	S["pda_skin"] >> pda_skin
	S["pda_ringtone"] >> pda_ringtone

	S["blood_color"] >> blood_color

	S["silicon_lawset"] >> silicon_lawset

	pda_style = sanitize_inlist(pda_style, GLOB.pda_styles, initial(pda_style))
	pda_color = sanitize_hexcolor(pda_color, 6, 1, initial(pda_color))
	pda_skin = sanitize_inlist(pda_skin, GLOB.pda_reskins, PDA_SKIN_ALT)
	// pda_ringtone = ??? // none for now

	blood_color = sanitize_hexcolor(blood_color, 6, 1, initial(blood_color))

	silicon_lawset = sanitize_inlist(silicon_lawset, CONFIG_GET(keyed_list/choosable_laws), null)

/datum/preferences/proc/bluemoon_character_pref_save(savefile/S) //TODO: modularize our other savefile edits... maybe?
	WRITE_FILE(S["pda_style"], pda_style)
	WRITE_FILE(S["pda_color"], pda_color)
	WRITE_FILE(S["pda_skin"], pda_skin)
	WRITE_FILE(S["pda_ringtone"], pda_ringtone)

	WRITE_FILE(S["blood_color"], blood_color)

	WRITE_FILE(S["silicon_lawset"], silicon_lawset)
