//Lifeweb Haron

/datum/map_template/shuttle/ruin/lf_haron
	prefix = "_maps/shuttles/bluemoon/"
	suffix = "lifeweb_haron"
	name = "Haron Shuttle"

/obj/machinery/computer/shuttle/lf_haron
	name = "Haron Control"
	desc = "Used to control the Haron."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/lf_haron
	shuttleId = "lf_haron"
	possible_destinations = "whiteship_home;lf_haron_custom"

/obj/item/circuitboard/computer/lf_haron
	name = "Haron Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/lf_haron

/obj/machinery/computer/camera_advanced/shuttle_docker/lf_haron
	name = "Haron Navigation Computer"
	desc = "The Navigation console for the Haron."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "lf_haron"
	lock_override = NONE
	shuttlePortId = "lf_haron_custom"
	jumpto_ports = list("whiteship_away" = 1, "whiteship_home" = 1)
	view_range = 7
	x_offset = 0
	y_offset = 0
