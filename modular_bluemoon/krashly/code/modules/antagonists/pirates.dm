//ДЕЛАЮ ШАТТЛ НА МЕГАПОХУЙ

/datum/map_template/shuttle/pirate/default/inteq
	suffix = "inteq"
	name = "Pirate ship (InteQ)"

/area/shuttle/pirate/inteq
	name = "InteQ Shuttle"

/obj/machinery/computer/shuttle/pirate/inteq
	name = "InteQ shuttle console"
	shuttleId = "inteqship"
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_ORANGE
	req_access = list(ACCESS_SYNDICATE)
	possible_destinations = "pirateship_away;pirateship_home;inteqship_custom"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/pirate/inteq
	name = "InteQ Shuttle Navigation Computer"
	desc = "Used to designate a precise transit location for the InteQ Colossus."
	shuttleId = "inteqship"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "inteqship_custom"
	x_offset = 11
	y_offset = 1
	see_hidden = FALSE

/obj/docking_port/mobile/pirate/inteq
	name = "inteq shuttle"
	id = "inteqship"
	rechargeTime = 3 MINUTES
