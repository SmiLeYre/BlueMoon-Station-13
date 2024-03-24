/mob/living
	var/lastclienttime = 0
	var/size_multiplier = RESIZE_NORMAL

/// Returns false on failure
/mob/living/proc/update_size(new_size, cur_size)
	if(!new_size)
		return FALSE
	if(!cur_size)
		cur_size = get_size(src)
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(new_size == cur_size)
			return FALSE
		H.dna.features["body_size"] = new_size
		H.dna.update_body_size(cur_size)
	else
		if(new_size == cur_size)
			return FALSE
		size_multiplier = new_size
		resize = new_size / cur_size
		update_transform()
	adjust_mobsize(new_size)

	// BLUEMOON ADDITION AHEAD - вызов проверки на размер у персонажа
	if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY_SUPER))
		for(var/datum/quirk/bluemoon_heavy_super/quirk in roundstart_quirks)
			quirk.update_size_movespeed()
			quirk.check_mob_size()

	else if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY))
		for(var/datum/quirk/bluemoon_heavy/quirk in roundstart_quirks)
			quirk.update_size_movespeed()

	if(HAS_TRAIT(src, TRAIT_BLUEMOON_GIANT_BODY))
		for(var/datum/quirk/bluemoon_giant_body/quirk in roundstart_quirks)
			quirk.update_size_modifiers(new_size, cur_size)
	// BLUEMOON ADDITION END

	SEND_SIGNAL(src, COMSIG_MOB_RESIZED, new_size, cur_size)
	return TRUE

/mob/living/proc/adjust_mobsize(size)
	switch(size)
		if(0 to 0.4)
			mob_size = MOB_SIZE_TINY
		if(0.41 to 0.8)
			mob_size = MOB_SIZE_SMALL
		if(0.81 to 1.2)
			mob_size = MOB_SIZE_HUMAN
		if(1.21 to INFINITY)
			mob_size = MOB_SIZE_LARGE
