/datum/mood_event/drunk
	mood_change = 3
	description = "<span class='nicegreen'>После одной или двух стопок всё вокруг ощущается чуточку лучше.</span>\n"
	timeout = 3000

/datum/mood_event/quality_nice
	description = "<span class='nicegreen'>Этот напиток был довольно неплох.</span>\n"
	mood_change = 1
	timeout = 2 MINUTES

/datum/mood_event/quality_good
	description = "<span class='nicegreen'>Этот напиток был очень хорош.</span>\n"
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/quality_verygood
	description = "<span class='nicegreen'>Этот напиток был великолепен!</span>\n"
	mood_change = 3
	timeout = 2 MINUTES

/datum/mood_event/quality_fantastic
	mood_change = 4
	timeout = 2 MINUTES

/datum/mood_event/quality_fantastic/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='nicegreen'>Этот напиток просто фантастика! Ничего лучше не пил[owner_mob.ru_a()]!</span>\n"

/datum/mood_event/race_drink
	description = "<span class='nicegreen'>Этот напиток был создан для меня!</span>\n"
	mood_change = 6
	timeout = 5 MINUTES

/datum/mood_event/amazingtaste
	description = "<span class='nicegreen'>Волшебный вкус!</span>\n"
	mood_change = 50 //Is this not really high..?
	timeout = 10 MINUTES
