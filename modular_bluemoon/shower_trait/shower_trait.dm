#define STATUS_EFFECT_STINK /datum/status_effect/transient/stink // оверлей вони

#define CLEAN 0
#define FINE_CLEAN 50 // ресет предупреждений о необходимости сходить в душ
#define FIRST_WARNING 750 // предупреждение, что пора сходить в душ
#define DIRTY 900 // негативное настроение
#define VERY_DIRTY 1000 // негативное настроение, визуальный эффект, сообщение при экзейме окружающим

/datum/quirk/bluemoon_shower_need
	name = "Потребность в душе"
	desc = "Вам нужно периодически ходить в душ. Хотя бы на станции. Из-за особенностей здешних мест, делать это нужно хотя бы раз в час на пару минут."
	value = -2
	gain_text = span_warning("Чистота - залог хорошего настроения! ()")
	lose_text = span_notice("Мне достаточно мыться раз в неделю, ведь в среднем на 10-минутный душ расходуется 60 литров воды. Использование нагревателя повышает расход в три раза, а на ванну нужно как минимум 200 литров. Получается, что семья из четырех человек, которые каждый день принимают 10-минутный душ, расходует 25 куб. м воды каждый год (традиционно в Великобритании установлены отдельные краны с холодной и горячей водой без смесителя, и для теплого душа нужен проточный нагреватель — прим. ред.). Цена электричества повышает стоимость гигиены такой семьи с 400 £ до 1200 £ в год. И это еще не все: любители душа оказываются ответственными за выброс в атмосферу 3,5 тонн углекислого газа. Чтобы остановить глобальное потепление, мы можем позволить себе только 1 тонну СО2 на человека, с учетом всей его жизнедеятельности от еды до транспорта.")
	processing_quirk = TRUE
	mood_quirk = TRUE

	var/cleanse_level = CLEAN //уровень чистоты персонажа
	var/warning_level = 0 // предупреждения для игрока в чат. Обнуляются при достижении чистоты в 100 и меньше
	var/doing_shower = FALSE // оповещение, что персонаж вошёл в душ и игроку нужно подождать, пока он не станет чистым

/datum/quirk/bluemoon_shower_need/on_spawn()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_COMPONENT_CLEAN_ACT, .proc/cleaning) // реакция, когда персонаж встаёт под душ
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/examine) // реакция, когда персонажа осматривают

/datum/quirk/bluemoon_shower_need/process()
	. = ..()
	cleanse_level = min(cleanse_level + 0.28, 1001) // около 1 игрового часа нужно (без учёта лагов), чтобы требование к мытью поднялось до 1001
	switch(cleanse_level)
		if(CLEAN to FINE_CLEAN)
			if(warning_level > 0)
				to_chat(quirk_holder, span_notice("Моё тело чистое, можно выходить."))
				quirk_holder.remove_status_effect(/datum/status_effect/transient/stink)
				doing_shower = FALSE
				warning_level = 0
		if(FIRST_WARNING to DIRTY)
			SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "need_shower", /datum/mood_event/need_shower)
			if(warning_level < 1)
				to_chat(quirk_holder, span_notice("Мне не помешает сходить в душ..."))
				warning_level = 1
		if(DIRTY to VERY_DIRTY)
			SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "need_shower", /datum/mood_event/need_shower/dirty)
			if(warning_level < 2)
				to_chat(quirk_holder, span_warning("Мне нужно сходить в душ."))
				warning_level = 2
		if(VERY_DIRTY to INFINITY)
			SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "need_shower", /datum/mood_event/need_shower/very_dirty)
			if(warning_level < 3)
				to_chat(quirk_holder, span_phobia("Мне ОЧЕНЬ нужно сходить в душ!"))
				quirk_holder.apply_status_effect(STATUS_EFFECT_STINK, 100000)
				warning_level = 3

/datum/quirk/bluemoon_shower_need/proc/examine(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	SIGNAL_HANDLER
	if(cleanse_level >= DIRTY) // если персонаж достаточно грязный, об этом пишется в экзейм
		examine_list += span_warning("[quirk_holder.p_they_ru(TRUE)] плохо пахнет.")

/datum/quirk/bluemoon_shower_need/proc/cleaning()
	SIGNAL_HANDLER
	var/cleaning_efficiency = 10 // 3.5~ минуты с 1000

	if(!check_for_clothing())
		to_chat(quirk_holder, span_warning("Нужно снять одежду, не подходящую для душа! Бюстгалтер и трусы допустимы."))
		return

	var/area/A = get_area(quirk_holder)
	if(A in typesof(/area/security/prison, /area/commons/toilet, /area/command/heads_quarters/captain, /area/commons/dorms, /area/command/blueshielquarters, /area/service/chapel/main/monastery, /area/mine/laborcamp))
		if(!doing_shower && warning_level != 0)
			to_chat(quirk_holder, span_notice("Теперь постоять под душем и помыться..."))
			doing_shower = TRUE
		cleaning_efficiency = 20 // 1.7~ минут с 1000
	else
		if(!doing_shower && warning_level != 0)
			to_chat(quirk_holder, span_warning("Я смогу помыться, но это место плохо подходит для душевой и это будет в два раза дольше. Дормиторий, уборные, личные каюты подходят куда лучше..."))
			doing_shower = TRUE

	cleanse_level = max(0, cleanse_level - cleaning_efficiency)

/datum/quirk/bluemoon_shower_need/proc/check_for_clothing()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/holder = quirk_holder

		if(holder.w_shirt) // мыться в футболках нельзя
			if(!(holder.w_shirt.type in typesof(/obj/item/clothing/underwear/shirt/bra, /obj/item/clothing/underwear/shirt/top))) // мыться в лифчике можно
				return FALSE

		if(holder.back) // мыться с рюкзаком нельзя
			return FALSE

		if(holder.gloves) // мыться в перчатках нельзя
			if(!(holder.gloves.type in typesof(/obj/item/clothing/accessory/ring))) // с кольцами можно
				return FALSE

		if(holder.w_uniform) // мыться в униформе нельзя
			if(holder.w_uniform.body_parts_covered & CHEST) // можно, если униформа закрывает грудь
				return FALSE

		if(holder.wear_suit) // мыться в костюме нельзя
			return FALSE

		if(!get_location_accessible(holder, BODY_ZONE_HEAD)) // мыться в шапочке нельзя
			return FALSE
		if(!get_location_accessible(holder, BODY_ZONE_PRECISE_L_FOOT)) // мыться в обуви нельзя
			return FALSE

	return TRUE // в наушниках, очках, галстуках, части нижнего белья можно мыться

/*
 * ИВЕНТЫ НАСТРОЕНИЯ
 */

/datum/mood_event/need_shower
	description = "Мне не помешало бы сходить в душ...\n"
	mood_change = 0 // индикатор для игрока через муд
	timeout = 10 SECONDS // эффект постоянно обновляется

/datum/mood_event/need_shower/dirty
	description = span_danger("Мне нужно сходить в душ.\n")
	mood_change = -2

/datum/mood_event/need_shower/very_dirty
	description = span_phobia("Мне ОЧЕНЬ нужно сходить в душ!\n")
	mood_change = -4

/*
 * ОВЕРЛЕЙ
 */

/datum/status_effect/transient/stink //cope-paste from confusion
	id = "stink"
	var/image/overlay
	on_remove_on_mob_delete = TRUE

/datum/status_effect/transient/stink/tick()
	. = ..()
	if(!.)
		return
	if(!owner.stat) //add or remove the overlay if they are alive or unconscious/dead
		add_overlay()
	else if(overlay)
		owner.cut_overlay(overlay)
		overlay = null

/datum/status_effect/transient/stink/proc/add_overlay()
	if(overlay)
		return
	var/matrix/M = matrix()
	M.Scale(0.6)
	overlay = image('modular_bluemoon/shower_trait/steam.dmi', "steam_single", pixel_y = 12, layer = -FIRE_LAYER)
	overlay.transform = M
	owner.add_overlay(overlay)

/datum/status_effect/transient/stink/on_remove()
	owner.cut_overlay(overlay)
	overlay = null
	return ..()
