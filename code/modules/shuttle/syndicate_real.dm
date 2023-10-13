/obj/item/circuitboard/computer/real_syndicate_shuttle
	name = "Syndicate Shuttle (Computer Board)"
	icon_state = "generic"
	build_path = /obj/machinery/computer/shuttle/real_syndicate
	var/challenge = FALSE
	var/moved = FALSE

/obj/item/circuitboard/computer/real_syndicate_shuttle/Initialize(mapload)
	. = ..()
	GLOB.real_syndicate_shuttle_boards += src

/obj/item/circuitboard/computer/real_syndicate_shuttle/Destroy()
	GLOB.real_syndicate_shuttle_boards -= src
	return ..()

/obj/machinery/computer/shuttle/real_syndicate
	name = "Syndicate Shuttle Terminal"
	desc = "The terminal used to control the Syndicate transport shuttle."
	circuit = /obj/item/circuitboard/computer/real_syndicate_shuttle
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_RED
	req_access = list(ACCESS_SYNDICATE)
	shuttleId = "real_syndicate"
	possible_destinations = "syndicate_away;syndicate_z5;syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s;real_syndicate_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/shuttle/real_syndicate/allowed(mob/M)
	if(issilicon(M) && !(ROLE_SYNDICATE in M.faction))
		return FALSE
	return ..()

/obj/machinery/computer/shuttle/real_syndicate/ui_act(action, params)
	if(!allowed(usr))
		to_chat(usr, "<span class='danger'>Доступ запрещён.</span>")
		return

	switch(action)
		if("move")
			var/obj/item/circuitboard/computer/real_syndicate_shuttle/board = circuit
			board.moved = TRUE

	return ..()

/obj/machinery/computer/shuttle/real_syndicate
	name = "Syndicate Shuttle Terminal"
	desc = "The terminal used to control the Syndicate transport shuttle."
	circuit = /obj/item/circuitboard/computer/real_syndicate_shuttle
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_RED
	req_access = list(ACCESS_SYNDICATE)
	shuttleId = "real_syndicate"
	possible_destinations = "syndicate_away;syndicate_z5;syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s;real_syndicate_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/shuttle/real_syndicate/recall
	name = "Syndicate shuttle recall terminal"
	desc = "Use this if your friends left you behind."
	possible_destinations = "syndicate_away"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/real_syndicate
	name = "Syndicate Shuttle Navigation Computer"
	desc = "Used to designate a precise transit location for the syndicate shuttle."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "real_syndicate"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "real_syndicate_custom"
	jumpto_ports = list("syndicate_ne" = 1, "syndicate_nw" = 1, "syndicate_n" = 1, "syndicate_se" = 1, "syndicate_sw" = 1, "syndicate_s" = 1)
	view_range = 5.5
	x_offset = -7
	y_offset = -1
	space_turfs_only = FALSE
	whitelist_turfs = list(/turf/open/space, /turf/open/floor/plating, /turf/open/lava, /turf/closed/mineral)
	see_hidden = TRUE
