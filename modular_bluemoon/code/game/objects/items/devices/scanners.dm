/obj/item/t_scanner/dirt_scanner
	name = "\improper MuckGyver scanning device"
	desc = "A MuckGyver sniffing device and scanner used to detect any dirt even invisible to the naked eye."
	icon = 'icons/obj/device.dmi'
	icon_state = "d-ray0"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'

/obj/item/t_scanner/dirt_scanner/scan()
	dirt_scan(loc)

/proc/dirt_scan(mob/viewer, flick_time = 8, distance = 3)
	if(!ismob(viewer) || !viewer.client)
		return
	var/list/dirt_images = list()
	for(var/obj/effect/decal/cleanable/D in orange(distance, viewer))
		var/image/I = new(loc = get_turf(D))
		var/mutable_appearance/MA = new(D)
		MA.alpha = 255
		MA.dir = D.dir
		MA.color = COLOR_RED
		I.appearance = MA
		dirt_images += I
	if(dirt_images.len)
		flick_overlay(dirt_images, list(viewer.client), flick_time)
