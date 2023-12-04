/datum/mood_event/failed_easy
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/failed_easy/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Я провалил[owner_mob.ru_a()] такую простую задачку!</span>\n"
