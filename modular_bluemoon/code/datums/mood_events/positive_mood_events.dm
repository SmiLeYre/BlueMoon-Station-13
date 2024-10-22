/*
 * ИВЕНТЫ НАСТРОЕНИЯ, СВЯЗАННЫЕ С ВАМПИРАМИ-АНТАГОНИСТАМИ
 */

/datum/mood_event/gave_blood_to_bloodsucker
	description = span_nicegreen("Я ощущаю покалывание в шеи, но это было просто прекрасно! Что бы это ни было...\n")
	mood_change = 12
	timeout = 2 MINUTES // кратковременный, но очень мощный позитивный эффект за укус

/datum/mood_event/gave_blood_to_bloodsucker/vassal // вассалы получают сниженный баф, т.к. их уже не нужно убеждать вступить и это халявный муд, по делу
	description = span_nicegreen("Вампир укусил меня! Это было прекрасно... Но уже не так, как до служения.\n")
	mood_change = 6

/datum/mood_event/drankkilled/positive
	mood_change = 1
	timeout = 5 MINUTES

/datum/mood_event/drankkilled/positive/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = span_danger("Мною была отнята очередная жизнь, пока я пита[owner_mob.ru_sya()]... Это было вкусно.\n")
