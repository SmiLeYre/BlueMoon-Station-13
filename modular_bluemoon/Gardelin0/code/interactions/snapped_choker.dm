/mob/living/proc/snap_choker(mob/living/M, slot)
	var/obj/item/clothing/neck/C = list(/obj/item/clothing/neck/petcollar/choker, /obj/item/clothing/neck/petcollar/locked/choker, /obj/item/clothing/neck/petcollar/donorchoker, /obj/item/clothing/neck/syntech/choker, /obj/item/clothing/neck/undertale)
	C = M.get_item_by_slot(slot)
	if(C)
		if(prob(15))
			M.dropItemToGround(C)
			playsound(src,  "modular_bluemoon/Gardelin0/sound/effect/snap.ogg", 30, 1, -1)
			visible_message(span_danger("[C] snaps!"))
			return TRUE
