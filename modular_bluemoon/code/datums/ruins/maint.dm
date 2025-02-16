/datum/map_template/ruin/station/box/cargo_shuttle_shuttters
	prefix = "modular_bluemoon/_maps/RandomRuins/StationRuins/maint/box/cargo_shuttle_shuttters/"

/datum/map_template/ruin/station/box/cargo_shuttle_shuttters/good
	id = "Carg_shutters_good"
	suffix = "good.dmm"
	name = "Shutters good integrity"

/datum/map_template/ruin/station/box/cargo_shuttle_shuttters/bad
	id = "Carg_shutters_bad"
	suffix = "bad.dmm"
	name = "Shutters bad integrity"

/datum/map_template/ruin/station/box/cargo_shuttle_shuttters/lavaland
	id = "Carg_shutters_lavaland"
	suffix = "lavaland.dmm"
	name = "Shutters lavaland"

/datum/map_template/ruin/station/box/cargo_shuttle_shuttters/cracked
	id = "Carg_shutters_cracked"
	suffix = "cracked.dmm"
	name = "Shutters cracked"


/obj/effect/landmark/stationroom/box/cargo_shuttle_shuttters
	template_names = list("Shutters good integrity" = 5, "Shutters bad integrity" = 300, "Shutters lavaland" = 1, "Shutters cracked" = 1)
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x"
