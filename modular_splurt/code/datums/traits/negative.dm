//Main code edits
/datum/quirk/social_anxiety
	value = -3
	//mob_trait = TRAIT_ANXIOUS //Not in the code yet, neither are its implementations
	processing_quirk = FALSE //small fixes for big mistakes

/datum/quirk/social_anxiety/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/quirk/social_anxiety/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_MOB_SAY)

/datum/quirk/social_anxiety/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER

	if(HAS_TRAIT(quirk_holder, TRAIT_FEARLESS))
		return

	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	var/moodmod
	if(mood)
		moodmod = (1+0.02*(50-(max(50, mood.mood_level*(7-mood.sanity_level))))) //low sanity levels are better, they max at 6
	else
		moodmod = (1+0.02*(50-(max(50, 0.1*quirk_holder.nutrition))))
	var/nearby_people = 0
	for(var/mob/living/carbon/human/H in oview(3, quirk_holder))
		if(H.client)
			nearby_people++
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		var/list/message_split = splittext(message, " ")
		var/list/new_message = list()
		var/mob/living/carbon/human/quirker = quirk_holder
		for(var/word in message_split)
			if(prob(max(5,(nearby_people*12.5*moodmod))) && word != message_split[1]) //Minimum 1/20 chance of filler
				new_message += pick("а,","э,","мм,")
				if(prob(min(5,(0.05*(nearby_people*12.5)*moodmod)))) //Max 1 in 20 chance of cutoff after a succesful filler roll, for 50% odds in a 15 word sentence
					quirker.silent = max(3, quirker.silent)
					to_chat(quirker, span_danger("Вы чувствуете себя неловко и перестаёте говорить. Вам необходимо прийти в себя!"))
					break
			if(prob(max(5,(nearby_people*12.5*moodmod)))) //Minimum 1/20 chance of stutter
				// Add a short stutter, THEN treat our word
				quirker.stuttering = max(0.25, quirker.stuttering)
				new_message += quirker.treat_message(word)

			else
				new_message += word

		message = jointext(new_message, " ")
	var/mob/living/carbon/human/quirker = quirk_holder
	if(prob(min(50,(0.50*(nearby_people*12.5)*moodmod)))) //Max 50% chance of not talking
		if(dumb_thing)
			to_chat(quirker, span_userdanger("Вы думаете о глупости, сказанной давно, и сгораете от стыда."))
			dumb_thing = FALSE //only once per life
			if(prob(1))
				new/obj/item/reagent_containers/food/snacks/pastatomato(get_turf(quirker)) //now that's what I call spaghetti code
		else
			to_chat(quirk_holder, span_warning("Вы считаете, что не способны поддержать разговор, и потому отмалчиваетесь."))
			if(prob(min(25,(0.25*(nearby_people*12.75)*moodmod)))) //Max 25% chance of silence stacks after succesful not talking roll
				to_chat(quirker, span_danger("Вы замыкаетесь в себе. Вы <i>действительно</i> не в настроении для разговоров."))
				quirker.silent = max(5, quirker.silent)
		speech_args[SPEECH_MESSAGE] = pick("А.","Э.","Мм.")
	else
		speech_args[SPEECH_MESSAGE] = message

//Own stuff
/datum/quirk/no_guns
	name = "Толстые пальцы"
	desc = "Из-за формы пальцев, ширины или вообще отсутствия - вы не можете стрелять из оружия без особого улучшения."
	value = -2
	mob_trait = TRAIT_CHUNKYFINGERS
	gain_text = "<span class='notice'>Ваши пальцы ощущаются... толстыми.</span>"
	lose_text = "<span class='notice'>Вы чувствуете, что ваши пальцы вернулись к норме.</span>"

/datum/quirk/illiterate
	name = "Неграмотность"
	desc = "Всё просто - вы не умеете ни писать, ни читать."
	value = -1
	mob_trait = TRAIT_ILLITERATE
	gain_text = "<span class='notice'>Знание грамоты... ускользает от вас.</span>"
	lose_text = "<span class='notice'>Написанные слова снова обретают смысл."

/datum/quirk/flimsy
	name = "Хрупкость"
	desc = "Ваше тело слабее, чем у большинства, здоровье уменьшено на 20%."
	value = -2
	medical_record_text = "У пациента чрезвычайно низкая устойчивость к травмам."
	gain_text = span_notice("Вы чувствуете, что вас могли бы снести с одного удара.")
	lose_text = span_notice("Вы чувствуете себя крепче.")

/datum/quirk/flimsy/add()
	quirk_holder.maxHealth *= 0.8

/datum/quirk/flimsy/remove() //how do admins even remove traits?
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 1.25

/datum/quirk/hypersensitive
	name = "Гиперчувствительность"
	desc = "Всё вокруг влияет на ваше настроение больше, чем должно."
	value = -1
	gain_text = "<span class='danger'>Вы делаете из мухи слона.</span>"
	lose_text = "<span class='notice'>Вы больше не преувеличиваете значимость событий вокруг вас.</span>"
	mood_quirk = TRUE //yogs
	medical_record_text = "Пациент демонстрирует высокий уровень эмоциональной неустойчивости."

/datum/quirk/hypersensitive/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier += 0.5

/datum/quirk/hypersensitive/remove()
	if(!quirk_holder)
		return
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.5

// masked_mook moved to neutral

//well-trained moved to neutral

/datum/quirk/dumb4cum
	name = "Спермоприёмник"
	desc = "По той или иной причине, вы помешаны на сперме. Её тепло, запах... вкус... делают счастливее."
	value = 0
	mob_trait = TRAIT_DUMB_CUM
	gain_text = span_notice("Неожиданно вам захотелось ощутить семя внутри себя!")
	lose_text = span_notice("Всё равно сперма была не такой уж и вкусной...")
	medical_record_text = "У пациента навязчивая одержимость семенными жидкостями."
	mood_quirk = TRUE
	var/timer
	var/timer_trigger
	var/reminder_timer
	var/reminder_trigger
	var/list/trigger_phrases = list(
										"У тебя урчит в животе, а на ум приходит сперма.",\
										"Уф-ф, сейчас бы не помешало раздобыть спермы...",\
										"Было бы неплохо сейчас потребить спермы!",\
										"Ты начинаешь тосковать по сперме..."
									  )
	var/list/uncrave_phrases = list("Вы узнаете хорошо знакомый вам вкус свежей спермы~",\
									"Незабываемый вкус свежей спермы вы узнаете из тысячи~",\
									"Ммм~, мне так не хватало этой восхитительной спермы~"
									)

/datum/quirk/dumb4cum/add()
	// Set timer
	timer_trigger = rand(9000, 18000)
	timer = addtimer(CALLBACK(src, PROC_REF(crave)), timer_trigger, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/remove()
	// Remove status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)

	// Remove mood event
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, QMOOD_DUMB_CUM)

	// Remove timer
	deltimer(timer)
	deltimer(reminder_timer)

/datum/quirk/dumb4cum/proc/crave()
	// Check if conscious
	if(quirk_holder.stat == CONSCIOUS)
		// Alert user in chat
		to_chat(quirk_holder, span_love("[pick(trigger_phrases)]"))

	reminder_trigger = rand(3000, 9000)
	reminder_timer = addtimer(CALLBACK(src, PROC_REF(reminder)), reminder_trigger, TIMER_STOPPABLE)

	// Add active status trait
	ADD_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Add illiterate, dumb, and pacifist
	ADD_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)

	// Add negative mood effect
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_craving)

/datum/quirk/dumb4cum/proc/reminder()
	to_chat(quirk_holder, span_love("[pick(trigger_phrases)]"))
	deltimer(reminder_timer)
	reminder_timer = null
	reminder_trigger = rand(3000, 9000)
	reminder_timer = addtimer(CALLBACK(src, PROC_REF(reminder)), reminder_trigger, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/proc/uncrave(print_text = FALSE)
	// Remove active status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)

	// Add positive mood event
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_stuffed)

	// Remove timer
	deltimer(timer)
	deltimer(reminder_timer)
	timer = null
	reminder_timer = null
	timer_trigger = rand(9000, 18000)
	// Add new timer
	timer = addtimer(CALLBACK(src, PROC_REF(crave)), timer_trigger, TIMER_STOPPABLE)

	if(print_text)
		to_chat(quirk_holder, span_love("[pick(uncrave_phrases)]"))

// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Бездонный Желудок"
	desc = "В вас быстрее просыпаются голод и жажда. Необходимо есть и пить в два раза больше."
	value = -1
	gain_text = span_danger("Вы хотите есть и пить чаще.")
	lose_text = span_notice("Жор идёт на спад.")
	medical_record_text = "Пациенту требуется вдвое большее количество еды, по сравнению с типичным представителем их вида."

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		if(P)
			P.hunger_mod /= 2

/datum/quirk/thirsty
	name = "Жаждущий"
	desc = "Вам необычайно хочется пить. Приходится пить в два раза больше, чем обычно."
	value = -1
	gain_text = span_danger("Вы начинаете испытывать жажду гораздо быстрее.")
	lose_text = span_notice("Ваша повышенная тяга к воде начинает угасать.")
	medical_record_text = "Пациент сообщает, что пьет в два раза больше жидкости в день, чем обычно для его вида."

/datum/quirk/thirsty/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.thirst_mod *= 2

/datum/quirk/thirsty/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		if(P)
			P.thirst_mod /= 2

/datum/quirk/less_nightmare
	name = "Отпрыск Ночного Кошмара"
	desc = "Вы очень схожи с так называемыми Ночными Кошмарами. Каким бы образом это не получилось, теперь всякое свечение вам опасно."
	value = -4
	mob_trait = TRAIT_LESS_NIGHTMARE
	gain_text = span_notice("Ваше тело становится уязвимым к свету...")
	lose_text = span_notice("Ваше тело более устойчивым, чем раньше.")
	medical_record_text = "Тело пациента уязвимо к свету."

/datum/quirk/less_nightmare/add()
	var/mob/living/carbon/human/C = quirk_holder
	C.AddElement(/datum/element/photosynthesis, 1, 1, 0, 0, 0, 0, SHADOW_SPECIES_LIGHT_THRESHOLD, SHADOW_SPECIES_LIGHT_THRESHOLD)

/datum/quirk/less_nightmare/remove()
	var/mob/living/carbon/human/C = quirk_holder
	// BLUEMOON EDIT START - sanity check
	if(!C)
		return
	// BLUEMOON EDIT END
	C.RemoveElement(/datum/element/photosynthesis, 1, 1, 0, 0, 0, 0, SHADOW_SPECIES_LIGHT_THRESHOLD, SHADOW_SPECIES_LIGHT_THRESHOLD)

//well-trained moved to neutral to stop the awkward situation of a dom snapping and the 30 trait powergamers fall to the floor.
/datum/quirk/well_trained
	name = "Дрессированный"
	desc = "Вы обожаете, когда над вами доминируют. Мысли о том, что есть кто-то сильнее, достаточно, чтобы завести вас."
	value = -1
	gain_text = span_notice("Вы хотите подчиниться кому-нибудь...")
	lose_text = span_notice("Вы больше не хотите подчиняться...")
	processing_quirk = TRUE
	/// BLUEMOON ADDED - optimization
	var/check_delay = 0
	var/notice_delay = 0
	var/mob/living/carbon/human/last_dom

/datum/quirk/well_trained/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine_holder))

/datum/quirk/well_trained/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

/datum/quirk/well_trained/proc/on_examine_holder(atom/source, mob/living/user, list/examine_list)
	SIGNAL_HANDLER

	if(!istype(user))
		return
	if(!user.has_quirk(/datum/quirk/dominant_aura))
		return
	examine_list += span_lewd("Вы чувствуете сильную ауру подчинения от [quirk_holder.ru_nego()].")

/datum/quirk/well_trained/on_process()
	. = ..()
	if(!quirk_holder)
		return
	// BLUEMOON EDIT START - оптимизация
	if(check_delay > world.time)
		return

	check_delay = world.time + 5 SECONDS
	// BLUEMOON EDIT END

	var/good_x = "хорошим питомцем"
	switch(quirk_holder.gender)
		if(MALE)
			good_x = "хорошим мальчиком"
		if(FEMALE)
			good_x = "хорошей девочкой"

	//Check for possible doms with the dominant_aura quirk, and for the closest one if there is
	. = FALSE
	var/list/mob/living/carbon/human/doms = range(DOMINANT_DETECT_RANGE, quirk_holder)
	var/closest_distance
	for(var/mob/living/carbon/human/dom in doms)
		if(dom != quirk_holder && dom.has_quirk(/datum/quirk/dominant_aura))
			if(!closest_distance || get_dist(quirk_holder, dom) <= closest_distance)
				. = dom
				closest_distance = get_dist(quirk_holder, dom)

	//Return if no dom is found
	if(!.)
		last_dom = null
		return

	// BLUEMOON EDIT START - теперь негативный мудлет убирается при появлении позитивного
	//Handle the mood
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(!isnull(mood.mood_events[QMOOD_WELL_TRAINED]))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_WELL_TRAINED, /datum/mood_event/dominant/good_boy)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_BAD_TRAINED, /datum/mood_event/dominant/need)
	// BLUEMOON EDIT END

	//Don't do anything if a previous dom was found
	if(last_dom)
		notice_delay = world.time + 15 SECONDS
		return

	last_dom = .

	if(notice_delay > world.time)
		return

	//Let them know they're near
	var/list/notices = list(
		"Вы ощущаете, как чьё-то присутствие делает вас более покорным...",
		"Мысли о том, чтобы вами командовали, заполняют ваш разум похотью...",
		"Вы хотите, чтобы вас назвали [good_x]...",
		"Чьё-то присутствие сильно возбуждает вас...",
		"Вы начинаете потеть и возбуждаться..."
	)

	to_chat(quirk_holder, span_lewd(pick(notices)))
	notice_delay = world.time + 15 SECONDS
