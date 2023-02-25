//Main code edits
/datum/quirk/social_anxiety
	value = -3
	//mob_trait = TRAIT_ANXIOUS //Not in the code yet, neither are its implementations
	processing_quirk = FALSE //small fixes for big mistakes

/datum/quirk/social_anxiety/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_MOB_SAY, .proc/handle_speech)

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
	gain_text = "<span class='notice'>Вы чувствуете, что вас могли бы снести с одного удара."
	lose_text = "<span class='notice'>Вы чувствуете себя крепче."

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
	var/timer_trigger = 15 MINUTES

/datum/quirk/dumb4cum/add()
	// Set timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/remove()
	// Remove status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Remove mood event
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, QMOOD_DUMB_CUM)

	// Remove timer
	deltimer(timer)

/datum/quirk/dumb4cum/proc/crave()
	// Check if conscious
	if(quirk_holder.stat == CONSCIOUS)
		// Display emote
		quirk_holder.emote("sigh")

		// Define list of phrases
		var/list/trigger_phrases = list(
										"У тебя урчит в животе, а на ум приходит сперма.",\
										"Уф-ф, сейчас бы не помешало раздобыть спермы...",\
										"Было бы неплохо сейчас потребить спермы!",\
										"Ты начинаешь тосковать по сперме..."
									  )
		// Alert user in chat
		to_chat(quirk_holder, span_love("[pick(trigger_phrases)]"))

	// Add active status trait
	ADD_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Add illiterate, dumb, and pacifist
	ADD_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add negative mood effect
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_craving)

/datum/quirk/dumb4cum/proc/uncrave()
	// Remove active status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add positive mood event
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_stuffed)

	// Remove timer
	deltimer(timer)
	timer = null

	// Add new timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Бездонный Желудок"
	desc = "В вас быстрее просыпаются голод и жажда. Необходимо есть и пить в два раза больше."
	value = -1
	gain_text = "<span class='danger'>Вы хотите есть и пить чаще.</span>"
	lose_text = "<span class='notice'>Жор идёт на спад.</span>"
	medical_record_text = "Пациенту требуется вдвое большее количество еды, по сравнению с типичным представителем их вида."

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2
	P.thirst_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		P.hunger_mod /= 2
		P.thirst_mod /= 2
