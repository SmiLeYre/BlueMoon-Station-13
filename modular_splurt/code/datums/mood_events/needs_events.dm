/datum/mood_event/fat/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/actual_owner = owner_mob()
	if(!HAS_TRAIT(actual_owner, TRAIT_VORACIOUS))
		return
	description = span_nicegreen("БОЛЬШЕ ЖРАЧКИ!!! БОЛЬШЕ ХАВЧИКА!!! ЖРАТЬ!!!\n")
	mood_change = 8

/datum/mood_event/cum_craving
	description = span_warning("МНЕ... НУЖНА... СПЕРМА...\n") // Я умер от испанского стыда, переводя ЕРП мудлеты. - прим. переводчика
	mood_change = -20

/datum/mood_event/cum_stuffed
	description = span_nicegreen("Вкусная была еда! Ням-ням!\n")
	mood_change = 8
	timeout = 5 MINUTES
