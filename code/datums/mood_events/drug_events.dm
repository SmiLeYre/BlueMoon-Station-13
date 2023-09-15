/datum/mood_event/high
	mood_change = 6
	description = "<span class='nicegreen'>Вооооооу чувааак...У меня шарики за ролики заехалииии...</span>\n"

/datum/mood_event/smoked
	mood_change = 2
	timeout = 3600

/datum/mood_event/smoked/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='nicegreen'>Я недавно покурил[owner_mob.ru_a()].</span>\n"

/datum/mood_event/overdose
	mood_change = -8
	timeout = 3000

/datum/mood_event/overdose/add_effects(drug_name, param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Кажется, я перебрал[owner_mob.ru_a()] с [drug_name]</span>\n"

/datum/mood_event/withdrawal_light
	mood_change = -2

/datum/mood_event/withdrawal_light/add_effects(drug_name)
	description = "<span class='warning'>Сейчас бы употребить немного [drug_name]</span>\n"

/datum/mood_event/withdrawal_medium
	mood_change = -5

/datum/mood_event/withdrawal_medium/add_effects(drug_name)
	description = "<span class='warning'>Мне нужен [drug_name]</span>\n"

/datum/mood_event/withdrawal_severe
	mood_change = -8

/datum/mood_event/withdrawal_severe/add_effects(drug_name)
	description = "<span class='boldwarning'>Господи, мне реально нужен [drug_name]</span>\n"

/datum/mood_event/withdrawal_critical
	mood_change = -10

/datum/mood_event/withdrawal_critical/add_effects(drug_name)
	description = "<span class='boldwarning'>ХОЧУ [drug_name]! ДАЙТЕ [drug_name]! СРОЧНО ДАЙТЕ МНЕ [drug_name]!</span>\n"

/datum/mood_event/happiness_drug
	description = "<span class='nicegreen'>Ничего не ощущаю. Не хочу, чтобы это заканчивалось!</span>\n"
	mood_change = 10

/datum/mood_event/happiness_drug_good_od
	description = "<span class='nicegreen'>ДА! ДА!! ДА!!!</span>\n"
	mood_change = 20
	timeout = 300
	//special_screen_obj = "mood_happiness_good" Originally in tg, but I personally think they look dumb

/datum/mood_event/happiness_drug_bad_od
	description = "<span class='boldwarning'>НЕТ! НЕТ!! НЕТ!!!</span>\n"
	mood_change = -20
	timeout = 300
	//special_screen_obj = "mood_happiness_bad" Originally in tg

/datum/mood_event/eigenstate
	mood_change = -3
	description = "<span class='warning'>Где я? Это что, альтернативная реальность?</span>\n"

/datum/mood_event/enthrall
	mood_change = 5

/datum/mood_event/enthrall/add_effects(message)
	description = "<span class='nicegreen'>[message]</span>\n"

/datum/mood_event/enthrallpraise
	mood_change = 10
	timeout = 1 MINUTES

/datum/mood_event/enthrallpraise/add_effects(message)
	description = "<span class='nicegreen'>[message]</span>\n"

/datum/mood_event/enthrallscold
	mood_change = -10
	timeout = 1 MINUTES

/datum/mood_event/enthrallscold/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"//aaa I'm not kinky enough for this

/datum/mood_event/enthrallmissing1
	mood_change = -5

/datum/mood_event/enthrallmissing1/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"

/datum/mood_event/enthrallmissing2
	mood_change = -10

/datum/mood_event/enthrallmissing2/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"

/datum/mood_event/enthrallmissing3
	mood_change = -15

/datum/mood_event/enthrallmissing3/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"

/datum/mood_event/enthrallmissing4
	mood_change = -25

/datum/mood_event/enthrallmissing4/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"

/datum/mood_event/InLove
	mood_change = 10

/datum/mood_event/InLove/add_effects(message)
	description = "<span class='nicegreen'>[message]</span>\n"

/datum/mood_event/MissingLove
	mood_change = -10

/datum/mood_event/MissingLove/add_effects(message)
	description = "<span class='warning'>[message]</span>\n"
