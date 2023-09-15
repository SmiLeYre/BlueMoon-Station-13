/datum/mood_event/dominant/need
	description = span_warning("Хочу быть чьей-то игрушкой. ПОЛЕЗНОЙ ИГРУШКОЙ...\n")
	mood_change = -2
	timeout = 3 MINUTES

/datum/mood_event/dominant/good_boy
	description = span_nicegreen("Ощущаю себя ДОСТОЙНОЙ ИГРУШКОЙ!\n")
	mood_change = 2
	timeout = 3 MINUTES

/datum/mood_event/dominant/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()
	var/good_x = "питомец"
	switch(actual_owner.gender)
		if(MALE)
			good_x = "мальчик"
		if(FEMALE)
			good_x = "девочка"
	description = replacetextEx(description, "THING", good_x)
