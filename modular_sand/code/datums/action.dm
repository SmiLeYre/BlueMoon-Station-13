/datum/action/small_sprite/drake/akatosh
	small_icon = 'modular_sand/icons/mob/lavaland/drakeling_greyscale.dmi'
	small_icon_state = "ash_whelp"

/datum/action/item_action/toggle_light/Trigger()
	if(istype(target, /obj/item/modular_computer/pda))
		var/obj/item/modular_computer/pda/P = target
		P.toggle_light(owner)
		return
	..()
