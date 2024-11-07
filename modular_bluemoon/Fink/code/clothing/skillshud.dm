/obj/item/clothing/glasses/hud/skills
	name = "Skills HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status."
	icon = 'modular_bluemoon/Fink/icons/clothing/glasses.dmi'
	mob_overlay_icon = 'modular_bluemoon/Fink/icons/mob/glasses.dmi'
	icon_state = "skillshud"
	item_state = "mobskills"
	hud_type = DATA_HUD_SECURITY_BASIC // только показ профы и ничего больше
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/datum/design/scills_hud // инфа для протолата
	name = "Skills Sunglasses"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status."
	id = "skills_hud"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/skills
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
