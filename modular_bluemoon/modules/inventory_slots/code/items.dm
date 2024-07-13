/obj/item/update_slot_icon()
	. = ..()

	if(!ismob(loc))
		return
	var/mob/owner = loc
	var/flags = slot_flags
	if(flags & ITEM_SLOT_SHOULDERS)
		owner.update_inv_shoulders()
