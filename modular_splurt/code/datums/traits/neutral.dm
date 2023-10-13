// HYPERSTATION TRAITS

/datum/quirk/choke_slut
	name = "Асфиксиофилия"
	desc = "Вас возбуждает удушье."
	value = 0
	mob_trait = TRAIT_CHOKE_SLUT
	gain_text = span_notice("Вы хотите ощутить пальцы вокруг шеи, сжимающие её до тех пор, пока не отключитесь или кончите... а может, всё сразу?")
	lose_text = span_notice("Похоже, вас больше не возбуждает асфиксия.")

/datum/quirk/pharmacokinesis //Supposed to prevent unwanted organ additions. But i don't think it's really working rn
	name = "Острый Печеночный Фармакокинез" //copypasting dumbo
	desc = "У вас генетическое заболевание, которое заставляет печень усваивать семя инкуба и молоко суккуба при попадании их в организм."
	value = 0
	mob_trait = TRAIT_PHARMA
	lose_text = span_notice("Ваша печень ощущается... по-иному.")
	var/active = FALSE
	var/power = 0
	var/cachedmoveCalc = 1

/datum/quirk/steel_ass
	name = "Стальные Булки"
	desc = "Вы ни разу не пропускали день ягодиц. У вас полный иммунитет ко всем формам ударов по заднице, и любой, кто попытается наградить вас шлепком, как правило, получит перелом кисти."
	value = 0
	mob_trait = TRAIT_STEEL_ASS
	gain_text = span_notice("Ваш зад может составить конкуренцию големскому.")
	lose_text = span_notice("Ваш зад ощущается более мягким и уязвимым к шлепкам.")

/datum/quirk/cursed_blood
	name = "Проклятая Кровь"
	desc = "На вашем роду лежит проклятие бледной крови. Лучше держаться подальше от святой воды... а вот адской воды, напротив..."
	value = 0
	mob_trait = TRAIT_CURSED_BLOOD
	gain_text = span_notice("Проклятие с земель, где люди возвращаются зверьми, течёт в вашей крови.")
	lose_text = span_notice("Вы чувствуете, что тяжесть проклятия крови наконец пропала.")
	medical_record_text = "Организм пациента по неизвестной причине отторгает святые реагенты. Рекомендуется держать подальше от капеллана."

/datum/quirk/headpat_hater
	name = "Отстраненность"
	desc = "Вам нет дела до ласки со стороны других. Будь то вследствие сдержанности или самоконтроля, получаемые поглаживания не заставят вилять хвостом, если таковой есть, ласка может даже разгневать."
	mob_trait = TRAIT_DISTANT
	value = 0
	gain_text = span_notice("Чужие прикосновения раздражают вас...")
	lose_text = span_notice("Теперь поглаживания не кажутся настолько уж плохими...")
	medical_record_text = "Пациента мало заботят или раздражают чужие прикосновения."

/datum/quirk/headpat_slut
	name = "Тактилофилия"
	desc = "Вам нравится, когда другие прикасаются к вашей голове! Может, даже слишком... когда другие гладят вас по голове, это повышает ваше настроение и возбуждает вас."
	mob_trait = TRAIT_HEADPAT_SLUT
	value = 0
	gain_text = span_notice("Вы жаждете ласки!")
	lose_text = span_notice("Ваша зависимость от ласки исчезает.")
	medical_record_text = "Пациент очень любвеобильный."

/datum/quirk/headpat_slut/add()
	. = ..()
	quirk_holder.AddElement(/datum/element/wuv/headpat, null, null, /datum/mood_event/pet_animal)

/datum/quirk/headpat_slut/remove()
	. = ..()
	quirk_holder.RemoveElement(/datum/element/wuv/headpat)

/datum/quirk/Hypnotic_gaze
	name = "Гипнотический Взгляд"
	desc = "Вследствие мистических узоров, мерцающих цветов или какой-нибудь генетической странности, длительный визуальный контакт с вами поместит наблюдателя в легковнушаемый гипнотический транс."
	value = 0
	mob_trait = TRAIT_HYPNOTIC_GAZE
	gain_text = span_notice("Ваши глаза завораживающе мерцают...")
	lose_text = span_notice("Ваша глаза становятся обычными.")
	medical_record_text = "Длительное воздействие глаз пациента влечет усыпляющий эффект."

/datum/quirk/Hypnotic_gaze/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk ability action datum
	var/datum/action/cooldown/hypnotize/act_hypno = new
	act_hypno.Grant(quirk_mob)

	// Add examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/quirk_examine_Hypnotic_gaze)

/datum/quirk/Hypnotic_gaze/remove()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove quirk ability action datum
	var/datum/action/cooldown/hypnotize/act_hypno = locate() in quirk_mob.actions
	act_hypno.Remove(quirk_mob)

	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text
/datum/quirk/Hypnotic_gaze/proc/quirk_examine_Hypnotic_gaze(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.ru_ego(TRUE)] глаза необычайно сверкают..."

/datum/quirk/overweight
	name = "Лишний Вес"
	desc = "Вы обожаете еду и появляетесь на смене с лишним весом."
	value = 0
	gain_text = span_notice("Вы чувствуете себя толстым!")
	//no lose_text cause why would there be?

/datum/quirk/overweight/on_spawn()
	var/mob/living/M = quirk_holder
	M.nutrition = rand(NUTRITION_LEVEL_FAT + NUTRITION_LEVEL_START_MIN, NUTRITION_LEVEL_FAT + NUTRITION_LEVEL_START_MAX)
	M.overeatduration = 100
	ADD_TRAIT(M, TRAIT_FAT, OBESITY)

/datum/quirk/vegetarian
	name = "Вегетарианец"
	desc = "Мысли о поедании мяса для вас отвратительны."
	value = 0
	gain_text = span_notice("Вы чувствуете отвращение от мысли о поедании мяса.")
	lose_text = span_notice("Вы думаете, что поесть мяса не так уж и плохо.")
	medical_record_text = "Пациент соблюдает вегетарианскую диету."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(initial(species.disliked_food) & ~MEAT)
			species.disliked_food &= ~MEAT

//Zombies + Cumplus Fix\\ Ёбнулись? Нахуй идите.
//datum/quirk/undead
//    name = "Undeath"
//    desc = "Your body, be it anomalous, or just outright refusing to die - has indeed become undead. Due to this you may be more susceptible to burn-based weaponry."
//    value = 0
//    mob_trait = TRAIT_UNDEAD
//    processing_quirk = TRUE
//    var/list/zperks = list(TRAIT_RESISTCOLD,TRAIT_STABLEHEART,TRAIT_EASYDISMEMBER,TRAIT_NOBREATH,TRAIT_VIRUSIMMUNE,TRAIT_RADIMMUNE,TRAIT_FAKEDEATH,TRAIT_NOSOFTCRIT, TRAIT_NOPULSE)
//
///datum/quirk/undead/add()
//    . = ..()
//    var/mob/living/carbon/human/H = quirk_holder
//    if(H.mob_biotypes == MOB_ROBOTIC)
//        return FALSE //Lol, lmao, even
//    H.mob_biotypes += MOB_UNDEAD
//    for(var/A = 1, A <= zperks.len, A++)
//        ADD_TRAIT(H,zperks[A],ROUNDSTART_TRAIT)
//
///datum/quirk/undead/remove()
//    . = ..()
//    var/mob/living/carbon/human/H = quirk_holder
//    H.mob_biotypes -= MOB_UNDEAD
//    for(var/A = 1, A <= zperks.len, A++)
//        REMOVE_TRAIT(H,zperks[A], null)
//
///datum/quirk/undead/on_process()
//    . = ..()
//    var/mob/living/carbon/human/H = quirk_holder
//    H.adjust_nutrition(-0.05)//The Undead are Hungry.
//    H.set_screwyhud(SCREWYHUD_HEALTHY)
//    H.adjustOxyLoss(-3) //Stops a defibrilator bug. Note to future self: Fix defib bug.
//    H.adjustBruteLoss(-0.5) //The undead will only regenerate if not burnt beyond a specific threshold. A good value is 50 as that will strain them if they decide to spacewalk near fusion.
//    if(H.getBruteLoss() > 0 && H.getFireLoss() <= 50 || H.getFireLoss() > 0 && H.getFireLoss() <= 50)
//        H.adjustBruteLoss(-0.5, forced = TRUE)
//        H.adjustFireLoss(-0.15, forced = TRUE)
//    else if (H.getToxLoss() <= 90)
//        H.adjustToxLoss(-0.3, forced = TRUE)

/datum/quirk/cum_plus
	name = "Сверхпродуктивные Гениталии"
	desc = "Ваши гениталии производят и вмещают больше, чем обычно."
	value = 0
	gain_text = span_notice("Вы чувствуете давление в паху.")
	lose_text = span_notice("Вы чувствуете, как ваш пах стал легче.")
	medical_record_text = "Гениталии пациента демонстрируют высокую продуктивность."
	var/increasedcum

/datum/quirk/cum_plus/add()
	var/mob/living/carbon/M = quirk_holder
	if(M.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		T.fluid_mult += 0.5 //Base is 1
		T.fluid_max_volume *= 1.75 //Fixes this.

/datum/quirk/cum_plus/remove()
	var/mob/living/carbon/M = quirk_holder
	if(!M)
		return
	if(quirk_holder.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		T.fluid_mult -= 0.5 //Base is 1
		T.fluid_max_volume *= 0.25 //Base is 50

/datum/quirk/cum_plus/on_process()
	var/mob/living/carbon/M = quirk_holder //If you get balls later, then this will still proc
	if(M.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		if(!increasedcum)
			T.fluid_mult = 1.5 //Base is 0.133
			T.fluid_max_volume *= 1.75
			increasedcum = TRUE

/datum/quirk/milk_plus
	name = "Сверхпродуктивная Грудь"
	desc = "Ваша грудь производит и вмещает больше, чем обычно."
	value = 0
	gain_text = span_notice("Вы чувствуете давление в груди.")
	lose_text = span_notice("Вы чувствуете, что ваша грудь стала легче.")
	medical_record_text = "Грудь пациента демонстрируют высокую продуктивность."
	var/increasedcum

/datum/quirk/milk_plus/add()
	var/mob/living/carbon/M = quirk_holder
	if(M.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/genital/breasts/T = M.getorganslot(ORGAN_SLOT_BREASTS)
		T.fluid_mult += 0.5 //Base is 1
		T.fluid_max_volume *= 1.75 //Fixes this.

/datum/quirk/milk_plus/remove()
	var/mob/living/carbon/M = quirk_holder
	if(!M)
		return
	if(quirk_holder.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/genital/breasts/T = M.getorganslot(ORGAN_SLOT_BREASTS)
		T.fluid_mult -= 0.5 //Base is 1
		T.fluid_max_volume *= 0.25 //Base is 50

/datum/quirk/milk_plus/on_process()
	var/mob/living/carbon/M = quirk_holder //If you get balls later, then this will still proc
	if(M.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/genital/breasts/T = M.getorganslot(ORGAN_SLOT_BREASTS)
		if(!increasedcum)
			T.fluid_mult = 1.5 //Base is 0.133
			T.fluid_max_volume *= 1.75
			increasedcum = TRUE

//You are a CIA agent.
/datum/quirk/cosglow
	name = "Косметическая подсветка"
	desc = "Ваше тело слегка светится! Что бы это не значило - излучение от радиации или люминисцентных грибов вдоль кожного покрова.."
	value = 0
	mob_trait = TRAIT_COSGLOW
	gain_text = span_notice("Вы ощущаете приток света вокруг себя!")
	lose_text = span_notice("Вы осознаете, что косплеить космическое ЦРУ совсем не для вас!")

/datum/quirk/cosglow/add()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// Add glow control action
	var/datum/action/cosglow/update_glow/quirk_action = new
	quirk_action.Grant(quirk_mob)

/datum/quirk/cosglow/remove()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove glow control action
	var/datum/action/cosglow/update_glow/quirk_action = locate() in quirk_mob.actions
	quirk_action.Remove(quirk_mob)

	// Remove glow effect
	quirk_mob.remove_filter("rad_fiend_glow")

//well-trained moved to neutral to stop the awkward situation of a dom snapping and the 30 trait powergamers fall to the floor.
/datum/quirk/well_trained
	name = "Дрессированный"
	desc = "Вы обожаете, когда над вами доминируют. Мысли о том, что есть кто-то сильнее, достаточно, чтобы завести вас."
	value = 0
	gain_text = span_notice("Вы хотите подчиниться кому-нибудь...")
	lose_text = span_notice("Вы больше не хотите подчиняться...")
	processing_quirk = TRUE
	var/notice_delay = 0
	var/mob/living/carbon/human/last_dom

/datum/quirk/well_trained/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)

/datum/quirk/well_trained/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

/datum/quirk/well_trained/proc/on_examine_holder(atom/source, mob/living/user, list/examine_list)
	SIGNAL_HANDLER

	if(!istype(user))
		return
	if(!user.has_quirk(/datum/quirk/dominant_aura))
		return
	examine_list += span_lewd("Вы чувствуете сильную ауру подчинения от [quirk_holder.ru_na()].")

/datum/quirk/well_trained/on_process()
	. = ..()
	if(!quirk_holder)
		return

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

	//Handle the mood
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(istype(mood.mood_events[QMOOD_WELL_TRAINED], /datum/mood_event/dominant/good_boy))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_WELL_TRAINED, /datum/mood_event/dominant/good_boy)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_WELL_TRAINED, /datum/mood_event/dominant/need)

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


//hydra code below

/datum/quirk/hydra
	name = "Головы Гидры"
	desc = "Вы трёхглавое создание. Оформите имя, как (Ваня-Саня-Даня)."
	value = 0
	mob_trait = TRAIT_HYDRA_HEADS
	gain_text = span_notice("Вы слышите два других голоса внутри головы(ов).")
	lose_text = span_danger("Ваш разум становится единым.")
	medical_record_text = "Пациент имеет несколько голов и личностей, присоединенных к телу."

/datum/quirk/hydra/on_spawn()
	var/mob/living/carbon/human/hydra = quirk_holder
	var/datum/action/innate/hydra/spell = new
	var/datum/action/innate/hydrareset/resetspell = new
	spell.Grant(hydra)
	spell.owner = hydra
	resetspell.Grant(hydra)
	resetspell.owner = hydra
	hydra.name_archive = hydra.real_name

//Own traits
/datum/quirk/cum_sniff
	name = "Дегустатор Гениталий"
	desc = "Вы набрались столько опыта, обсасывая чужие гениталии, что с легкостью можете сказать, какая жидкость находится внутри них, исключая реагенты в крови."
	value = 0
	mob_trait = TRAIT_GFLUID_DETECT
	gain_text = span_notice("Вы начинаете ощущать специфические запахи, исходящие от чужих промежностей...")
	lose_text = span_notice("Чужие гениталии начинают пахнуть для вас одинаково...")
	medical_record_text = "Пациент добивался того, чтобы доктор провёл яйцами по его лицу."

/datum/quirk/fluid_infuser
	name = "Тядзин"
	desc = "Вы не упустили возможность приобрести новый жидкостный индуктор от NanoTrasen, как только он был выпущен, и теперь можете заскочить на станцию с изменяемым грудным молочком!"
	value = 0

/datum/quirk/fluid_infuser/on_spawn()
	. = ..()
	var/obj/item/implant/genital_fluid/put_in = new
	put_in.implant(quirk_holder, null, TRUE, TRUE)

/datum/quirk/storage_concealment
	name = "Имплант Для Дорсуалифоба"
	desc = "У вас вызывает отвращение сама идея быть увиденным с любой ёмкостью для переноски, закрепленной на спине! Новая технология скрывает объект за вашей спиной, таким образом защищая вас от безмерного стыда."

	// UNUSED: Enable by setting these values to TRUE
	// The shame is unbearable
	mood_quirk = FALSE
	processing_quirk = FALSE

/datum/quirk/storage_concealment/on_spawn()
	. = ..()

	// Create a new augment item
	var/obj/item/implant/hide_backpack/put_in = new

	// Apply the augment to the quirk holder
	put_in.implant(quirk_holder, null, TRUE, TRUE)

/datum/quirk/storage_concealment/on_process()
	// This trait should only be applied by the augment
	// Check the quirk holder for the trait
	if(HAS_TRAIT(quirk_holder, TRAIT_HIDE_BACKPACK))
		// When found: Mood bonus
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_HIDE_BAG, /datum/mood_event/dorsualiphobic_mood_positive)
	else
		// When not found: Mood penalty
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_HIDE_BAG, /datum/mood_event/dorsualiphobic_mood_negative)

//succubus and incubus below
/datum/quirk/incubus
	name = "Инкуб"
	desc = "Ваш голод может быть утолен только молоком. (И семенем, если вы также Суккуб.)"
	value = 0
	mob_trait = TRAIT_INCUBUS
	processing_quirk = TRUE

/datum/quirk/incubus/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/incubus/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/incubus/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjust_nutrition(-0.09)//increases their nutrition loss rate to encourage them to gain a partner they can essentially leech off of

/datum/quirk/succubus
	name = "Суккуб"
	desc = "Ваш голод может быть утолен только семенем. (И молоком, если вы также Инкуб.)"
	value = 0
	mob_trait = TRAIT_SUCCUBUS
	processing_quirk = TRUE

/datum/quirk/succubus/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/succubus/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	REMOVE_TRAIT(H,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

/datum/quirk/succubus/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjust_nutrition(-0.09)//increases their nutrition loss rate to encourage them to gain a partner they can essentially leech off of

/datum/quirk/bloodfledge
	name = "Отпрыск Кровопийцы"
	desc = "Вы новообращенный, принадлежащий к древнему роду Кровопийц. Благословению еще предстоит полностью изменить вас, но некоторые вещи уже поменялись. Только кровь утолит голод, а божественная сила обуглит вашу плоть. <b>Это НЕ роль антагониста!</b>"
	value = 2
	medical_record_text = "Пациент демонстрирует начальные симптомы кровяного проклятия."
	mob_trait = TRAIT_BLOODFLEDGE
	gain_text = span_notice("Вы чувствуете жажду крови.")
	lose_text = span_notice("Вы чувствуете, что жажда крови угасла.")
	processing_quirk = FALSE //Что-то Сплюртовское.

/datum/quirk/bloodfledge/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk traits
	ADD_TRAIT(quirk_mob,TRAIT_NOBREATH, ROUNDSTART_TRAIT)
	ADD_TRAIT(quirk_mob,TRAIT_NO_PROCESS_FOOD, ROUNDSTART_TRAIT)
	ADD_TRAIT(quirk_mob,TRAIT_NOTHIRST, ROUNDSTART_TRAIT)

	// Set skin tone, if possible
	//if(!quirk_mob.dna.skin_tone_override)
		//quirk_mob.skin_tone = "albino" // BlueMoon 27.08.2023 - убрано в угоду разнообразия отыгрыша

	// Add quirk language
	quirk_mob.grant_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

	// Register examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/quirk_examine_bloodfledge)

/datum/quirk/bloodfledge/post_add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Define and grant ability Bite
	var/datum/action/cooldown/bloodfledge/bite/act_bite = new
	act_bite.Grant(quirk_mob)

	// Check for synthetic
	// Robotic mobs have technical issues with adjusting damage
	if(quirk_mob.mob_biotypes & MOB_ROBOTIC)
		// Warn user
		to_chat(quirk_mob, span_warning("As a synthetic lifeform, your components are only able to grant limited sanguine abilities! Regeneration and revival are not possible."))

	// User is not synthetic
	else
		// Define and grant ability Revive
		var/datum/action/cooldown/bloodfledge/revive/act_revive = new
		act_revive.Grant(quirk_mob)

/datum/quirk/bloodfledge/on_process()
	// Processing is currently only used for coffin healing
	// This is started and stopped by a proc in crates.dm

	// Define potential coffin
	var/quirk_coffin = quirk_holder.loc

	// Check if the current area is a coffin
	if(istype(quirk_coffin, /obj/structure/closet/crate/coffin))
		// Define quirk mob
		var/mob/living/carbon/human/quirk_mob = quirk_holder

		// Quirk mob must be injured
		if(quirk_mob.health >= quirk_mob.maxHealth)
			// Warn user
			to_chat(quirk_mob, span_notice("[quirk_coffin] does nothing more to help you, as your body is fully mended."))

			// Stop processing and return
			STOP_PROCESSING(SSquirks, src)
			return

		// Nutrition (blood) level must be above STARVING
		if(quirk_mob.nutrition <= NUTRITION_LEVEL_STARVING)
			// Warn user
			to_chat(quirk_mob, span_warning("[quirk_coffin] requires blood to operate, which you are currently lacking. Your connection to the other-world fades once again."))

			// Stop processing and return
			STOP_PROCESSING(SSquirks, src)
			return

		// Define initial health
		var/health_start = quirk_mob.health

		// Heal brute and burn
		// Accounts for robotic limbs
		quirk_mob.heal_overall_damage(2,2)
		// Heal oxygen
		quirk_mob.adjustOxyLoss(-2)
		// Heal clone
		quirk_mob.adjustCloneLoss(-2)

		// Check for slime race
		// NOT a slime
		if(!isslimeperson(quirk_mob))
			// Heal toxin
			quirk_mob.adjustToxLoss(-2)
		// IS a slime
		else
			// Grant toxin (heals slimes)
			quirk_mob.adjustToxLoss(2)

		// Update health
		quirk_mob.updatehealth()

		// Determine healed amount
		var/health_restored = quirk_mob.health - health_start

		// Remove nutrition (blood) as compensation for healing
		// Amount is equal to 50% of healing done
		quirk_mob.adjust_nutrition(health_restored*-1)

	// User is not in a coffin
	// This should not occur without teleportation
	else
		// Warn user
		to_chat(quirk_holder, span_warning("Your connection to the other-world is broken upon leaving the [quirk_coffin]!"))

		// Stop processing
		STOP_PROCESSING(SSquirks, src)

/datum/quirk/bloodfledge/remove()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove quirk traits
	REMOVE_TRAIT(quirk_mob, TRAIT_NO_PROCESS_FOOD, ROUNDSTART_TRAIT)
	REMOVE_TRAIT(quirk_mob, TRAIT_NOTHIRST, ROUNDSTART_TRAIT)

	// Remove quirk ability action datums
	var/datum/action/cooldown/bloodfledge/bite/act_bite = locate() in quirk_mob.actions
	var/datum/action/cooldown/bloodfledge/revive/act_revive = locate() in quirk_mob.actions
	act_bite.Remove(quirk_mob)
	act_revive.Remove(quirk_mob)

	// Remove quirk language
	quirk_mob.remove_language(/datum/language/vampiric, TRUE, TRUE, LANGUAGE_BLOODSUCKER)

	// Unregister examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

/datum/quirk/bloodfledge/on_spawn()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Create vampire ID card
	var/obj/item/card/id/vampire/id_vampire = new /obj/item/card/id/vampire(get_turf(quirk_holder))

	// Update card information
	id_vampire.registered_name = quirk_mob.real_name
	id_vampire.update_label(addtext(id_vampire.registered_name, "'s Bloodfledge"))

	// Determine banking ID information
	for(var/bank_account in SSeconomy.bank_accounts)
		// Define current iteration's account
		var/datum/bank_account/account = bank_account

		// Check for match
		if(account.account_id == quirk_mob.account_id)
			// Add to cards list
			account.bank_cards += src

			// Assign account
			id_vampire.registered_account = account

			// Stop searching
			break

	// Try to add ID to backpack
	var/id_in_bag = quirk_mob.equip_to_slot_if_possible(id_vampire, ITEM_SLOT_BACKPACK) || FALSE

	// Text for where the item was sent
	var/id_location = (id_in_bag ? "in your backpack" : "at your feet" )

	// Alert user in chat
	// This should not post_add, because the ID is added by on_spawn
	to_chat(quirk_holder, span_boldnotice("There is a bloodfledge's ID card [id_location], linked to your station account. It functions as a spare ID, but lacks job access."))

/datum/quirk/bloodfledge/proc/quirk_examine_bloodfledge(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	SIGNAL_HANDLER

	// Check if human examiner exists
	if(!istype(examiner))
		return

	// Check if examiner is dumb
	if(HAS_TRAIT(examiner, TRAIT_DUMB))
		// Return with no effects
		return

	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Define hunger texts
	var/examine_hunger_public
	var/examine_hunger_secret

	// Check hunger levels
	switch(quirk_mob.nutrition)
		// Hungry
		if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
			examine_hunger_secret = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] blood starved!"
			examine_hunger_public = "[quirk_holder.p_they(TRUE)] seem[quirk_holder.p_s()] on edge from something."

		// Starving
		if(0 to NUTRITION_LEVEL_STARVING)
			examine_hunger_secret = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] in dire need of blood!"
			examine_hunger_public = "[quirk_holder.p_they(TRUE)] [quirk_holder.p_are()] radiating an aura of frenzied hunger!"

		// Invalid hunger
		else
			// Return with no message
			return

	// Check if examiner shares the quirk
	if(isbloodfledge(examiner))
		// Add detection text
		examine_list += span_info("[quirk_holder.p_their(TRUE)] hunger makes it easy to identify [quirk_holder.p_them()] as a fellow Bloodsucker Fledgling!")

		// Add hunger text
		examine_list += span_warning(examine_hunger_secret)

	// Check if public hunger text exists
	else
		// Add hunger text
		examine_list += span_warning(examine_hunger_public)

/datum/quirk/werewolf //adds the werewolf quirk
	name = "Оборотень"
	desc = "Ликантропия позволяет вам перевоплощаться в большого прямоходящего волка."
	value = 0
	mob_trait = TRAIT_WEREWOLF
	gain_text = span_notice("Полная луна зовёт.")
	lose_text = span_notice("Зов луны растворяется в тишине.")
	medical_record_text = "Сообщалось, что пациент выл на ночное небо."
	var/list/old_features

/datum/quirk/werewolf/add()
	// Define old features
	old_features = list("species" = SPECIES_HUMAN, "legs" = "Plantigrade", "size" = 1, "bark")

	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Record features
	old_features = quirk_mob.dna.features.Copy()
	old_features["species"] = quirk_mob.dna.species.type
	old_features["custom_species"] = quirk_mob.custom_species
	old_features["size"] = get_size(quirk_mob)
	old_features["bark"] = quirk_mob.vocal_bark_id
	old_features["taur"] = quirk_mob.dna.features["taur"]
	old_features["eye_type"] = quirk_mob.dna.species.eye_type

/datum/quirk/werewolf/post_add()
	// Define quirk action
	var/datum/action/cooldown/werewolf/transform/quirk_action = new

	// Grant quirk action
	quirk_action.Grant(quirk_holder)

/datum/quirk/werewolf/remove()
	// Define quirk action
	var/datum/action/cooldown/werewolf/transform/quirk_action = locate() in quirk_holder.actions

	// Revoke quirk action
	quirk_action.Remove(quirk_holder)

/datum/quirk/gargoyle //Mmmm yes stone time
	name = "Горгулья"
	desc = "Вы относитесь к какому-то виду горгульи! Вы можете выходить из каменной формы на определенное время, но вам придётся в неё вернуться, чтобы восстановить энергию. С другой стороны, вы лечитесь, будучи в камне!"
	value = 0
	processing_quirk = TRUE
	var/energy = 0
	var/transformed = 0
	var/cooldown = 0
	var/paused = 0
	var/turf/position
	var/obj/structure/statue/gargoyle/current = null

/datum/quirk/gargoyle/add()
	.=..()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return
	var/datum/action/gargoyle/transform/T = new
	var/datum/action/gargoyle/check/C = new
	var/datum/action/gargoyle/pause/P = new
	energy = 100
	cooldown = 30
	T.Grant(H)
	C.Grant(H)
	P.Grant(H)

/datum/quirk/gargoyle/on_process()
	.=..()
	var/mob/living/carbon/human/H = quirk_holder

	if (!H)
		return

	if(paused && H.loc != position)
		paused = 0
		energy -= 20

	if(cooldown > 0)
		cooldown--

	if(!transformed && !paused && energy > 0)
		energy -= 0.05

	if(transformed)
		energy = min(energy + 0.3, 100)
		if (H.getBruteLoss() > 0 || H.getFireLoss() > 0)
			H.adjustBruteLoss(-0.5, forced = TRUE)
			H.adjustFireLoss(-0.5, forced = TRUE)
		else if (H.getOxyLoss() > 0 || H.getToxLoss() > 0)
			H.adjustToxLoss(-0.3, forced = TRUE)
			H.adjustOxyLoss(-0.5, forced = TRUE) //oxyloss heals by itself, doesn't need a nerfed heal
		else if (H.getCloneLoss() > 0)
			H.adjustCloneLoss(-0.3, forced = TRUE)
		else if (current && current.obj_integrity < current.max_integrity) //health == maxHealth is true since we checked all damages above
			current.obj_integrity = min(current.obj_integrity + 0.1, current.max_integrity)

	if(!transformed && energy <= 0)
		var/datum/action/gargoyle/transform/T = locate() in H.actions
		if (!T)
			T = new
			T.Grant(H)
		cooldown = 0
		T?.Trigger()

/datum/quirk/gargoyle/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return ..()
	var/datum/action/gargoyle/transform/T = locate() in H.actions
	var/datum/action/gargoyle/check/C = locate() in H.actions
	var/datum/action/gargoyle/pause/P = locate() in H.actions
	T?.Remove(H)
	C?.Remove(H)
	P?.Remove(H)
	. = ..()

/datum/quirk/nudist
	// Mostly derived from masked_mook.
	// Spawning with a gear harness is preferable, but failed during testing.
	name = "Нудизм"
	desc = "Ношение большинства типов одежды нервирует вас. Несите портупею!"
	gain_text = span_notice("Вы чувствуете духовную связь со своим естеством.")
	lose_text = span_notice("Вы больше не чувствуете дискомфорта при ношении одежды.")
	medical_record_text = "Пациент выражает психологическую потребность оставаться без одежды."
	value = 0
	mood_quirk = TRUE
	var/is_nude

/datum/quirk/nudist/add()
	// Register signal handlers
	RegisterSignal(quirk_holder, COMSIG_MOB_UPDATE_GENITALS, .proc/check_outfit)
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/quirk_examine_nudist)

/datum/quirk/nudist/remove()
	// Remove mood event
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, QMOOD_NUDIST)

	// Unregister signals
	UnregisterSignal(quirk_holder, list(COMSIG_MOB_UPDATE_GENITALS, COMSIG_PARENT_EXAMINE))

/datum/quirk/nudist/post_add()
	// Evaluate outfit
	check_outfit()

/datum/quirk/nudist/on_spawn()
	// Spawn a Rapid Disrobe Implant
	var/obj/item/implant/disrobe/quirk_implant = new

	// Implant into quirk holder
	quirk_implant.implant(quirk_holder, null, TRUE, TRUE)

/datum/quirk/nudist/proc/check_outfit()
	SIGNAL_HANDLER

	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Check if torso is uncovered
	if(quirk_mob.is_chest_exposed() && quirk_mob.is_groin_exposed())
		// Send positive mood event
		SEND_SIGNAL(quirk_mob, COMSIG_ADD_MOOD_EVENT, QMOOD_NUDIST, /datum/mood_event/nudist_positive)

		// Check if already set
		if(is_nude)
			return

		// Alert user in chat
		to_chat(quirk_mob, span_nicegreen("Вам намного лучше без сковывающих вас обносков!"))

		// Set nude status
		is_nude = TRUE

	// Torso is covered
	else
		// Send negative mood event
		SEND_SIGNAL(quirk_mob, COMSIG_ADD_MOOD_EVENT, QMOOD_NUDIST, /datum/mood_event/nudist_negative)

		// Check if already set
		if(!is_nude)
			return

		// Alert user in chat
		to_chat(quirk_mob, span_warning("Одежда вашему телу не подходит..."))

		// Set nude status
		is_nude = FALSE

/datum/quirk/nudist/proc/quirk_examine_nudist(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	SIGNAL_HANDLER

	// Define default status term
	var/mood_term = "в радостном состоянии из-за отсутствия на себе"

	// Define default span class
	var/span_class

	// Check if dressed
	if(!is_nude)
		// Set negative term
		mood_term = "в раздражении из-за ношения на себе"

		// Set negative span class
		span_class = "warning"

	// Add examine text
	examine_list += "<span class='[span_class]'>[quirk_holder.p_they_ru(TRUE)] [mood_term] одежды.</span>"

/datum/quirk/masked_mook
	name = "Синдром Бейна"
	desc = "По какой-то причине вам... не по себе без противогаза на лице."
	gain_text = span_danger("Вы начинаете чувствовать себя нехорошо без противогаза.")
	lose_text = span_notice("У вас больше нет нужды в ношении противогаза.")
	value = -1
	mood_quirk = TRUE
	medical_record_text = "Пациент чувствует себя более безопасно при ношении противогаза."
	processing_quirk = TRUE

/datum/quirk/masked_mook/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/mask/gas/gasmask = H.get_item_by_slot(ITEM_SLOT_MASK)
	if(istype(gasmask))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_MASKED_MOOK, /datum/mood_event/masked_mook)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_MASKED_MOOK, /datum/mood_event/masked_mook_incomplete)

/datum/quirk/masked_mook/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/mask/gas/cosmetic/gasmask = new(get_turf(quirk_holder)) // Uses a custom gas mask
	H.equip_to_slot_if_possible(gasmask, ITEM_SLOT_MASK) // If character have a loadout mask, the custom one will not overwrite it but instead will be dropped on floor
	H.regenerate_icons()

/datum/quirk/kartavii
	name = "Картавый"
	desc = "Вы не знаете, как проговаривать букву \"Р\"."
	value = 0
	mob_trait = TRAIT_KARTAVII
	gain_text = span_notice("Забываю как проговаривать букву \"Р\".")
	lose_text = span_danger("Вспоминаю как проговаривать букву \"Р\".")
	medical_record_text = "Пациент не может проговаривать букву \"Р\"."

proc/kartavo(message)
	var/num = rand(1, 3)
	switch(prob(75) && num)
		if(1)
			message = replacetextEx(message, "р", "г'")
			message = replacetextEx(message, "Р", "Г'")
		if(2)
			message = replacetextEx(message, "р", "гх")
			message = replacetextEx(message, "Р", "Гх")
		if(3)
			message = replacetextEx(message, "р", "гъ")
			message = replacetextEx(message, "Р", "Гъ")

	return message

/datum/quirk/asiat
	name = "Азиат"
	desc = "Долгое время работы в рисовых полях и жара палящего сверху солнца даровала вам этот прекрасный акцент."
	value = 0
	mob_trait = TRAIT_ASIAT
	gain_text = span_notice("Чиньг-чоньг!.")
	lose_text = span_danger("Аниме говно.")
	medical_record_text = "Пациент - азиат."

proc/asiatish(message)
	if(prob(75))
		message = replacetext_char(message, "ра", "ля")
		message = replacetext_char(message, "ла", "ля")
		message = replacetext_char(message, "ло", "льо")
		message = replacetext_char(message, "да", "тя")
		message = replacetext_char(message, "бо", "по")
		message = replacetext_char(message, "за", "ся")
		message = replacetext_char(message, "чу", "сю")
		message = replacetext_char(message, "та", "тя")
		message = replacetext_char(message, "же", "се")
		message = replacetext_char(message, "хо", "ха")
		message = replacetext_char(message, "гд", "кт")
		message = replacetextEx(message, "д", "т")
		message = replacetextEx(message, "ч", "с")
		message = replacetextEx(message, "з", "с")
		message = replacetextEx(message, "р", "л")
		message = replacetextEx(message, "ы", "и")
		message = replacetextEx(message, "Д", "т")
		message = replacetextEx(message, "Ч", "с")
		message = replacetextEx(message, "З", "с")
		message = replacetextEx(message, "Р", "л")
		message = replacetextEx(message, "Ы", "и")
	return message

/datum/quirk/ukraine
	name = "Украиновый"
	desc = "Похоже, вы изучили новый язык и вы не замечаете в этом ничего необычного."
	value = 0
	mob_trait = TRAIT_UKRAINE
	gain_text = span_notice("А що такое?")
	lose_text = span_danger("А что такое?")
	medical_record_text = "Пациент испытывает любовь к синим и жёлтым цветам."

var/static/list/ukraine_replacements = list(
	"зажигалка" = "спалахуйка",
	"зеркало" = "пикогляд",
	"презерватив" = "нацюцюрник",
	"пизда" = "піхва",
	"хуй" = "прутень",
	"врач" = "лікар",
	"бармен" = "наливайко",
	"повар" = "кухар",
	"капитан" = "гетьман",
	"предатель" = "зрадник",
	"генокрад" = "москаль",
	"мостик" = "майдан",
	"ученый" = "вчений",
	"инженер" = "слюсар",
	"маг" = "чаклун",
	"лоза" = "бур'ян",
	"культ" = "нехристь",
	"КМ" = "комірник",
	"СМО" = "головний ліпило",
	"ГСБ" = "дільничий",
	"ХОС" = "дільничий",
	"водка" = "горілка",
	"что" = "шо",
	"добрый день" = "доброго дня",
	"привет" = "здоровенькі були",
	"блять" = "дідько",
	"или" = "чи",
	"кто" = "хто",
	"пофиг" = "байдуже",
	"мне" = "мені",
	"сигареты" = "цигарки",
	"сигарета" = "цигарка",
	"арбуз" = "кавун",
	"сука" = "курва",
	"бред" = "маячня",
	"лук" = "цибуля",
	"хорошо" = "гарно",
	"звезда" = "зірка",
	"хлеб" = "хліб",
	"фонарик" = "ліхтарик",
	"СБ" = "охорона",
	"победа" = "перемога",
	"это" = "це",
	"почему" = "чому",
	"зачем" = "навіщо",
	"добро пожаловать" = "ласкаво просимо",
	"РНД" = "наукове суспільство"
)

/proc/ukraine(message)

	if (prob(75))
		for (var/key in ukraine_replacements)
			var/regex/rg = regex("(\\A|\[\\s|.,\\-!/?~\])([key])(\\Z|\[\\s|.,\\-!/?~\])")
			message = rg.Replace_char(message, /proc/ukraine_replace)

		message = replacetextEx_char(message, "ы", "и")
		message = replacetextEx_char(message, "и", "і")
		message = replacetextEx_char(message, "ъ", "ї")

	return message

/proc/ukraine_replace(match, group1, key, group2)
		return "[group1][ukraine_replacements[key]][group2]"

/datum/quirk/body_morpher
	name = "Изменятель Тела"
	desc = "Каким-то образом вы развили способность, позволяющую вашему телу морфировать и изменять свои части тела, подобно тому, как это может делать слаймик."
	value = 0
	mob_trait = TRAIT_BODY_MORPHER
	gain_text = span_notice("Ваше тело становится более податливым...")
	lose_text = span_notice("Ваше тело более упругое, чем раньше.")
	medical_record_text = "Тело пациента кажется необычайно податливым."
	var/datum/action/innate/ability/humanoid_customization/alter_form_action

/datum/quirk/body_morpher/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk ability action datum
	alter_form_action = new
	alter_form_action.Grant(quirk_mob)

/datum/quirk/body_morpher/remove()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove quirk ability action datum
	alter_form_action.Remove(quirk_mob)
	QDEL_NULL(alter_form_action)

/datum/quirk/modular
	name = "Модульные Конечности"
	desc = "Ваши конечности можно легко присоединять и отсоединять... к сожалению, все окружающие тоже могут изменять ваши конечности! Щелкните правой кнопкой мыши на себе, чтобы использовать эту причуду."
	value = 0

/datum/quirk/modular/add()
	var/mob/living/carbon/human/C = quirk_holder
	add_verb(C,/mob/living/proc/alterlimbs)

/datum/quirk/modular/remove()
	var/mob/living/carbon/human/C = quirk_holder
	remove_verb(C,/mob/living/proc/alterlimbs)

/datum/quirk/messy
	name = "Грязнуля"
	desc = "Из-за биологических особенностей вашего тела или блюспейс аномалии вы всегда устраиваете бардак, когда кончаете. Даже в тех обстоятельствах, когда это казалось бы невозможно."
	value = 0
	mob_trait = TRAIT_MESSY
	gain_text = span_lewd("Вы хотите покрыть что-то с помощью своих органических жидкостей.")
	lose_text = span_notice("Вы более не ощущаете себя 'грязнулей'.")
	medical_record_text = "Врачу пришлось принять успокоительное после того, как пациент обкончал весь медбей."
