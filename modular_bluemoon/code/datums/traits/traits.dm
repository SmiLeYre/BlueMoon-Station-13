/datum/quirk/bluemoon_heavy
	name = "Тяжёлый"
	desc = "Вы весите заметно больше среднего - будь то от жира или телосложения. Вас сложнее куда-то тащить, хотя сами вы и не испытываете с этим проблем больше, чем нужно. Вас сложнее отправить в полёт, но и последствия будут серьезнее. (Не берите вместе со сверх-тяжёлым, может привести к настакиванию замедления)."
	value = 0
	mob_trait = TRAIT_BLUEMOON_HEAVY
	gain_text = span_notice("Вы явно набрали в весе... Не то, чтобы это сильно мешало.")
	lose_text = span_danger("Сбросить 3-4 десятка киллограмм за одну смену - это достижение. И вы его открыли.")
	medical_record_text = "Вес пациента выше нормы."
	processing_quirk = TRUE

/datum/quirk/bluemoon_heavy/on_process()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = (abs(get_size(1.5) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	to_chat(quirk_holder, "se: [searched_slowdown], us: [user_slowdown]")
	if(searched_slowdown - user_slowdown > 0)
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		H.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.throw_range = 4
	H.throw_speed = 1

/datum/quirk/bluemoon_heavy_super
	name = "Сверх-тяжёлый"
	desc = "Ваш вес можно сравнивать с крупным животным, автомобилем или лёгким промышленным шагоходом. Вы перемещаетесь так, как будто максимального допустимого роста для работы на космической станции. Тянуть вас могут только киборги - ремонтировать/лечиться нужно либо прямо на месте, либо ожидать эвакуатор. Если что-то отправит вас в полёт, то вес даст о себе знать во всех отношениях."
	value = -2
	mob_trait = TRAIT_BLUEMOON_HEAVY_SUPER
	gain_text = span_warning("Плитка под вашими ногами может треснуть от неосторожного шага.")
	lose_text = span_notice("Вы явно стали весить намного меньше. Сверх-тяжёлый танк больше не кузен.")
	medical_record_text = "Вес пациента намного выше нормы. Перемещение привычными средствами посторонними лицами невозможно."
	processing_quirk = TRUE

/datum/quirk/bluemoon_heavy_super/on_process()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = (abs(get_size(2) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	to_chat(quirk_holder, "se: [searched_slowdown], us: [user_slowdown]")
	if(searched_slowdown - user_slowdown > 0)
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		H.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy_super/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.throw_range = 1
	H.throw_speed = 0.5
