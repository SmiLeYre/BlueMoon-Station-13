#define STATUS_EFFECT_STINK /datum/status_effect/stink // оверлей вони

#define FINE_CLEAN 50 // ресет предупреждений о необходимости сходить в душ
#define FIRST_WARNING 750 // предупреждение, что пора сходить в душ
#define DIRTY 900 // негативное настроение
#define VERY_DIRTY 1000 // негативное настроение, визуальный эффект, сообщение при экзейме окружающим

/datum/quirk/bluemoon_shower_need
	name = BLUEMOON_TRAIT_NAME_SHOWER_NEED
	desc = "Вам нужно периодически ходить в душ. Хотя бы на станции. Из-за особенностей здешних мест, делать это нужно хотя бы раз в час на пару минут."
	gain_text = span_warning("Чистота - залог хорошего настроения!")
	lose_text = span_notice("Мне достаточно мыться раз в неделю, ведь в среднем на 10-минутный душ расходуется 60 литров воды. Использование нагревателя повышает расход в три раза, а на ванну нужно как минимум 200 литров. Получается, что семья из четырех человек, которые каждый день принимают 10-минутный душ, расходует 25 куб. м воды каждый год (традиционно в Великобритании установлены отдельные краны с холодной и горячей водой без смесителя, и для теплого душа нужен проточный нагреватель — прим. ред.). Цена электричества повышает стоимость гигиены такой семьи с 400 £ до 1200 £ в год. И это еще не все: любители душа оказываются ответственными за выброс в атмосферу 3,5 тонн углекислого газа. Чтобы остановить глобальное потепление, мы можем позволить себе только 1 тонну СО2 на человека, с учетом всей его жизнедеятельности от еды до транспорта.")
	value = -2
	mob_trait = TRAIT_BLUEMOON_SHOWER_NEED
	processing_quirk = TRUE
	mood_quirk = TRUE

	var/cleanse_level = 0 // уровень загрязнения персонажа
	var/doing_shower = FALSE // оповещение, что персонаж вошёл в душ и игроку нужно подождать, пока он не станет чистым
	var/hide_visual_effect = FALSE // если игрок хочет, он может отключить визуальное отображение, но при этом будет сильное падение настроения
	var/cleaned_times = 0 // счётчик, сколько тиков игрок постоял под душем
	var/warning_level = 0 // предупреждения для игрока в чат. Обнуляются при достижении чистоты

/datum/quirk/bluemoon_shower_need/on_spawn()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_COMPONENT_CLEAN_ACT, .proc/cleaning) // реакция, когда персонаж встаёт под душ
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/examine) // реакция, когда персонажа осматривают
	var/mob/living/carbon/human/H = quirk_holder
	if(!H)
		return
	var/datum/action/cooldown/change_stink_overlay/C = new // выдача способности для изменения оверлея вони
	C.Grant(H)

/datum/quirk/bluemoon_shower_need/remove()
	UnregisterSignal(quirk_holder, COMSIG_COMPONENT_CLEAN_ACT)
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
	if(quirk_holder)
		var/mob/living/carbon/human/H = quirk_holder
		var/datum/action/cooldown/change_stink_overlay/C = locate() in H.actions
		C.Remove(H) // забираем способность изменения оверлея вони
	. = ..()

/datum/quirk/bluemoon_shower_need/process()
	. = ..()
	cleanse_level = clamp(cleanse_level + 0.28, 0, 1001) // около 1 игрового часа нужно (без учёта лагов), чтобы требование к мытью поднялось до 1001
	switch(cleanse_level)
		if(-INFINITY to FINE_CLEAN)
			quirk_holder.remove_status_effect(/datum/status_effect/stink)
			if(warning_level > 0)
				to_chat(quirk_holder, span_notice("Моё тело чистое, можно выходить."))
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
				to_chat(quirk_holder, span_phobia("Мне нужно сходить в душ."))
				warning_level = 2
		if(VERY_DIRTY to INFINITY)
			if(hide_visual_effect)
				SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "need_shower", /datum/mood_event/need_shower/very_dirty_catastrophic)
			else
				SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "need_shower", /datum/mood_event/need_shower/very_dirty)
				quirk_holder.apply_status_effect(STATUS_EFFECT_STINK)
			if(warning_level < 3)
				to_chat(quirk_holder, span_phobia("Мне ОЧЕНЬ нужно сходить в душ!"))
				warning_level = 3

/datum/quirk/bluemoon_shower_need/proc/examine(atom/examine_target, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	if(hide_visual_effect) // игрок скрывает статус персонажа
		return

	var/cannot_smell = FALSE // некоторые персонажи могут не замечать вон, но всё ещё будут понимать, что следует принять душ


	if(HAS_TRAIT(examiner, /datum/quirk/no_smell))  // персонажи с аносмией не замечают вонь
		cannot_smell = TRUE

	if(iscarbon(examiner))
		var/mob/living/carbon/C = examiner
		if(C.internal) // персонажи со включенными баллоном не замечают вонь
			cannot_smell = TRUE

	if(cleanse_level >= DIRTY) // если персонаж достаточно грязный, об этом пишется в экзейм
		if(cannot_smell)
			examine_list += span_notice("[quirk_holder.p_they_ru(TRUE)] давно не мы[quirk_holder.ru_sya()].") // т.к. облачко в таком исходе всё ещё существует, на глаз можно определить, что персонаж давно не мылся
		else
			examine_list += span_warning("[quirk_holder.p_they_ru(TRUE)] плохо пахнет.")

/datum/quirk/bluemoon_shower_need/proc/cleaning()
	SIGNAL_HANDLER
	var/cleaning_efficiency = 10 // 3.5~ минуты с 1000

	if(cleanse_level <= 10) // снижение нагрузки, чтобы стояние куклы под душем с этим квирком не генерило постоянно все проверки внизу
		return

	cleaned_times++
	if(!check_for_clothing())
		if(!(cleaned_times % 10)) // каждые 10 тиков сообщение, если одежда не подходит
			to_chat(quirk_holder, span_warning("Нужно снять одежду, не подходящую для душа! Бюстгалтер и трусы допустимы."))
		return

	var/area/A = get_area(quirk_holder)
	if(A.type in typesof(/area/security/prison, /area/commons/toilet, /area/command/heads_quarters/captain, /area/commons/dorms, /area/command/blueshielquarters, /area/service/chapel/main/monastery, /area/mine/laborcamp, /area/survivalpod, /area/mine/living_quarters))
		if(!doing_shower && warning_level != 0)
			to_chat(quirk_holder, span_notice("Теперь только подождать... Есть время разгрузить голову и расслабиться."))
			doing_shower = TRUE
		cleaning_efficiency = 20 // 1.7~ минут с 1000
	else // за поставленный в неподходящей зоне душ и мытьё там штраф
		if(!doing_shower && warning_level != 0)
			to_chat(quirk_holder, span_warning("Я смогу помыться, но это место плохо подходит для душевой и это будет в два раза дольше. Жилые зоны, в том числе дормиторий, уборные, личные каюты подходят куда лучше..."))
			doing_shower = TRUE

	if(!(cleaned_times % 10)) // каждые 10 тиков новый сон в чат
		if(iscarbon(quirk_holder))
			var/mob/living/carbon/holder = quirk_holder
			holder.dream(dreaming_in_shower = TRUE)
	cleanse_level = max(0, cleanse_level - cleaning_efficiency)

/datum/quirk/bluemoon_shower_need/proc/check_for_clothing()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/holder = quirk_holder

		if(holder.w_shirt) // мыться в футболках нельзя
			if(!(holder.w_shirt.type in typesof(/obj/item/clothing/underwear/shirt/bra, /obj/item/clothing/underwear/shirt/top))) // мыться в лифчике можно
				return

		if(holder.back) // мыться с рюкзаком нельзя
			return

		if(holder.gloves) // мыться в перчатках нельзя
			if(!(holder.gloves.type in typesof(/obj/item/clothing/accessory/ring))) // с кольцами можно
				return

		if(holder.w_uniform) // мыться в униформе нельзя
			if(holder.w_uniform.body_parts_covered & CHEST) // можно, если униформа закрывает грудь
				return

		if(holder.wear_suit) // мыться в костюме нельзя
			return

		if(!get_location_accessible(holder, BODY_ZONE_HEAD)) // мыться в шапочке нельзя
			return

		if(!get_location_accessible(holder, BODY_ZONE_PRECISE_L_FOOT)) // мыться в обуви нельзя
			return

	return TRUE // в наушниках, очках, галстуках, части нижнего белья можно мыться

/*
 * СПОСОБНОСТЬ
 */

/datum/action/cooldown/change_stink_overlay
	name = "Change Stink Overlay"
	desc = "Вы можете убрать отображение того, что персонаж плохо пахнет (облачко над ним и сообщение при осмотре), но это будет стоить катастрофического падения настроения."
	icon_icon = 'icons/obj/watercloset.dmi'
	button_icon_state = "shower"
	cooldown_time = 15 SECONDS // чтобы игрок не кликал изменение оверлея туда-сюда без понимания, почему он не исчезает
	transparent_when_unavailable = TRUE

/datum/action/cooldown/change_stink_overlay/Trigger()
	if(!..()) // Что-то мешает, например персонаж без сознания
		return FALSE

	if(!IsAvailable()) // КД не прошёл
		return FALSE

	if(ishuman(owner)) //roundstart_quirks только у хуманов
		var/mob/living/carbon/human/action_holder = owner
		for(var/datum/quirk/bluemoon_shower_need/quirk in action_holder.roundstart_quirks)
			quirk.hide_visual_effect = !quirk.hide_visual_effect // скрываем визуальный эффект
			to_chat(owner, span_notice("Теперь окружающие [quirk.hide_visual_effect ? "не будут" : "будут"] замечать плохой запах. [quirk.hide_visual_effect ? "Однако, настроение будет контролировать намного сложнее, если долго не ходить в душ..." : ""]"))
			StartCooldown() // начала отчёта для КД на способность

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
	description = span_boldwarning("Мне ОЧЕНЬ нужно сходить в душ!\n")
	mood_change = -4

/datum/mood_event/need_shower/very_dirty_catastrophic
	description = span_phobia("МНЕ КРИТИЧЕСКИ НУЖНО СХОДИТЬ В ДУШ!\n")
	mood_change = -16 // игрок скрывает визуальный негативный эффект, но от этого персонаж сильно страдает

/*
 * ОВЕРЛЕЙ
 */

/datum/status_effect/stink
	id = "stink"
	on_remove_on_mob_delete = TRUE
	status_type = STATUS_EFFECT_REFRESH // обновлять таймер
	alert_type = null
	var/image/overlay // оверлей вони
	duration = 10 SECONDS

/datum/status_effect/stink/on_apply()
	. = ..()
	add_overlay()

/datum/status_effect/stink/proc/add_overlay()
	var/matrix/M = matrix()
	M.Scale(0.6)
	overlay = image('modular_bluemoon/shower_trait/stink.dmi', "steam_double", pixel_y = 12, layer = -FIRE_LAYER)
	overlay.transform = M
	owner.add_overlay(overlay)

/datum/status_effect/stink/on_remove()
	owner.cut_overlay(overlay)
	overlay = null
	return ..()

#undef STATUS_EFFECT_STINK

#undef FINE_CLEAN
#undef FIRST_WARNING
#undef DIRTY
#undef VERY_DIRTY
