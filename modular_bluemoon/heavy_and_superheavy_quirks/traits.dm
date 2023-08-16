// КВИРКИ

/datum/quirk/bluemoon_heavy
	name = "Тяжёлый"
	desc = "Вы весите заметно больше в сравнении со среднестатистическим космонавтов. \
	Вас сложнее куда-то тащить, хотя сами вы и не испытываете с этим проблем больше, чем нужно (ослабление скорости прекращается с повышением размера до 150%). \
	Вас сложнее отправить в полёт, но и последствия будут серьезнее. Если вы наступите на кого-то меньше вас ростом, то это будет ещё болезненнее. \
	(Не берите вместе со сверх-тяжёлым, может привести к настакиванию замедления)."
	value = 0
	mob_trait = TRAIT_BLUEMOON_HEAVY
	gain_text = span_notice("Вы явно набрали в весе... Не то, чтобы это сильно мешало.")
	lose_text = span_danger("Сбросить 3-4 десятка киллограмм за одну смену - это достижение. И вы его открыли.")
	medical_record_text = "Вес пациента выше среднего для космонавтов."
	processing_quirk = TRUE

/datum/quirk/bluemoon_heavy/on_process()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = 0.5 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 150%
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
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
	desc = "Ваш вес можно сравнивать с крупным животным, автомобилем или малым промышленным шагоходом. \
	Вы перемещаетесь так, как будто максимального допустимого роста для работы на космической станции (ослабление скорости прекращается с повышением размера до 200%). \
	Вас могут тянуть только киборги, мехи с клешнями и такие же сверх-тяжёлые члены экипажа. \
	Если что-то и сможет отправить вас в полёт, то вес даст о себе знать во всех отношениях. \
	Вас также нельзя сбить с ног толканием, если это не такой же тяжёлый космонавт. Если вы наступите на кого-то меньше вас ростом, то скорее всего сломаете что-то. \
	Операции на теле всегда считаются, как если бы они проходили на обычном столе (даже если персонаж на хирургическом или на полу)"
	value = -2
	mob_trait = TRAIT_BLUEMOON_HEAVY_SUPER
	gain_text = span_warning("Плитка под вашими ногами может треснуть от неосторожного шага.")
	lose_text = span_notice("Вы явно стали весить намного меньше. Сверх-тяжёлый танк больше не кузен.")
	medical_record_text = "Вес пациента намного выше среднестастистической для космонавтов. Перемещение привычными средствами посторонними лицами невозможно."
	processing_quirk = TRUE

/datum/quirk/bluemoon_heavy_super/on_process()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = 1 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 200%
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		H.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy_super/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.throw_range = 1
	H.throw_speed = 0.5

// ПЕРЕМЕННЫЕ ДЛЯ МОДИФИКАТОРОВ СКОРОСТИ

/datum/movespeed_modifier/heavy_mob_drag
	variable = TRUE

/datum/movespeed_modifier/heavy_quirk_slowdown
	variable = TRUE
