/datum/mood_event/fat/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()
	if(!HAS_TRAIT(actual_owner, TRAIT_VORACIOUS))
		return
	description = span_nicegreen("БОЛЬШЕ ЖРАЧКИ!!! БОЛЬШЕ ХАВЧИКА!!! ЖРАТЬ!!!\n")
	mood_change = 8
