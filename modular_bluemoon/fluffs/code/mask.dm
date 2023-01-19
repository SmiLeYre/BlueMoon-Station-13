/obj/item/clothing/mask/magickitsune/equipped(mob/user, slot)
	. = ..()
	for(var/mob/living/M in get_hearers_in_view(4, user))
		if(!pickupsound)
			return
		if(!ishuman(user))
			return
		if(slot == ITEM_SLOT_MASK)
			if(!firstpickup)
				SEND_SOUND(M, sound('sound/magic/Smoke.ogg', volume = 50))
			else
				firstpickup = FALSE
				SEND_SOUND(M, sound('sound/magic/Smoke.ogg', volume = 50))
	return
