/datum/antagonist/nukeop/lone/proc/ExtaOrNeExta()
	if(nuke_team && istype(SSticker.mode, /datum/game_mode/extended))
		nukeop_outfit = /datum/outfit/syndicate/lone
	else
		nukeop_outfit = /datum/outfit/syndicate/lone/inteq
	return
