/obj/item/shuttle_smoothsail
	name = "shuttle smooth sailing upgrade"
	desc = "Used on a shuttle control console to make rides less jarring, which means you won't be getting thrown around the place.\n You won't even need to sit!"
	icon = 'icons/obj/module.dmi'
	icon_state = "holodisk"
	throw_speed = 1
	item_flags = NOBLUDGEON

/obj/item/shuttle_smoothsail/attack_obj(obj/O, mob/living/user)
	. = ..()
	if(!istype(O, /obj/machinery/computer))
		return
	if(!istype(O, /obj/machinery/computer/custom_shuttle))
		to_chat(user, "<span class='warning'>This upgrade only works on a custom shuttle flight console.</span>")
		return
	if(!user.transferItemToLoc(src, get_turf(O)))
		return
	var/obj/machinery/computer/custom_shuttle/link_comp = O
	if(link_comp.smooth_sailing)
		to_chat(usr, "<span class='notice'>The shuttle is already sailing smoothly!</span>")
		return
	link_comp.smooth_sailing = TRUE
	playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, 0)
	to_chat(usr, "<span class='notice'>You insert the disk into the flight computer, allowing you to not be thrown around like a ragdoll when launching.</span>")
