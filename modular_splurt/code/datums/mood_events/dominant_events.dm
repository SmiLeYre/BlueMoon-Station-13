// BLUEMOON EDITED - исправления

/datum/mood_event/dominant/need
	description = span_warning("Хочу быть чьей-то игрушкой. ПОЛЕЗНОЙ ИГРУШКОЙ...\n")
	mood_change = -3
	timeout = 4 MINUTES

/datum/mood_event/dominant/good_boy
	description = span_nicegreen("Чувствую себя THING!\n")
	mood_change = 3
	timeout = 4 MINUTES

/datum/mood_event/dominant/good_boy/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()

	// Удаляем плохой мудлет
	SEND_SIGNAL(actual_owner, COMSIG_CLEAR_MOOD_EVENT, QMOOD_BAD_TRAINED)
	var/good_x = "хорошей игрушкой"
	switch(actual_owner.gender)
		if(MALE)
			good_x = "хорошим мальчиком"
		if(FEMALE)
			good_x = "хорошей девочкой"
	description = replacetextEx(description, "THING", good_x)
