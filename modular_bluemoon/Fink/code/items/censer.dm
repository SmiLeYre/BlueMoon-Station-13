///////////////

/obj/item/reagent_containers/censer
	name = "Orthodox Censer"
	desc = "The golden holy smoking ball."
	icon = 'modular_bluemoon/Fink/icons/obj/holy.dmi'
	lefthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/lefthand.dmi'
	righthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/righthand.dmi'
	icon_state = "censer"
	item_state = "censer"
	w_class = WEIGHT_CLASS_TINY
	var/chem_volume = 100
	var/vapetime = FALSE //this so it won't puff out clouds every tick
	var/lit = FALSE
	reagent_flags = OPENCONTAINER

//obj/item/reagent_containers/censer/attackby(obj/item/O, mob/user, params)
//obj/item/clothing/glasses/AltClick(mob/user)

/obj/item/reagent_containers/censer/equipped(mob/user, slot, initial)
	. = ..()
	if (slot != ITEM_SLOT_HANDS)
		lit = FALSE
		icon_state = "censer"
		STOP_PROCESSING(SSobj, src)
		return

/obj/item/reagent_containers/censer/attack_self(mob/user)
	lit = !lit
	if (lit)
		icon_state = "censer_anim"
		START_PROCESSING(SSobj, src)

	else
		icon_state = "censer"
		STOP_PROCESSING(SSobj, src)

/obj/item/reagent_containers/censer/process()
	vapetime++
	if (item_flags & IN_STORAGE)
		lit = FALSE
		icon_state = "censer"
		STOP_PROCESSING(SSobj, src)
		return

	if(!reagents.total_volume)
		if(ismob(loc))
			to_chat(usr, "<span class='notice'>[src] is empty!</span>")
			STOP_PROCESSING(SSobj, src)
			//it's reusable so it won't unequip when empty
		return

	if( vapetime > 3)//Time to start puffing those fat vapes, yo.
		var/datum/effect_system/smoke_spread/chem/smoke_machine/s = new
		s.set_up(reagents, 1, 24, loc)
		s.start()
		vapetime = 0



///////////////

/obj/item/reagent_containers/censer/incense
	icon_state = "incense"
	item_state = "incense"

/obj/item/reagent_containers/censer/incense/attack_self(mob/user)
	lit = !lit
	if (lit)
		icon_state = "incense_anim"
		START_PROCESSING(SSobj, src)

	else
		icon_state = "incense"
		STOP_PROCESSING(SSobj, src)
