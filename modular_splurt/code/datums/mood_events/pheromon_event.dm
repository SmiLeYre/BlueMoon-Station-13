/datum/mood_event/pheromon/i_feel
	description = span_nicegreen("Я учуял феромоны партнера, как прекрасно!\n")
	mood_change = 2
	timeout = 3 MINUTES

/datum/mood_event/pheromon/i_need
	description = span_nicegreen("Я учуял феромоны партнера, как прекрасно!\n")
	mood_change = 2
	timeout = 3 MINUTES

/datum/mood_event/pheromon/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()
	var/good_x = "питомец"
	switch(actual_owner.gender)
		if(MALE)
			good_x = "мальчик"
		if(FEMALE)
			good_x = "девочка"
	description = replacetextEx(description, "THING", good_x)
