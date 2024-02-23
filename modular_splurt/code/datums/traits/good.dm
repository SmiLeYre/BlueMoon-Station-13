/datum/quirk/tough
	name = "Стойкость"
	desc = "Ваше аномально крепкое тело может вынести на 20% больше урона."
	value = 3
	medical_record_text = "Пациент продемонстрировал аномально высокую устойчивость к травмам."
	gain_text = "<span class='notice'>Вы чувствуете крепость в мышцах.</span>"
	lose_text = "<span class='notice'>Вы чувствуете себя менее крепким.</span>"

/datum/quirk/tough/add()
	quirk_holder.maxHealth *= 1.20

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 0.909 //close enough

/datum/quirk/ashresistance
	name = "Пепельная Устойчивость"
	desc = "Ваше тело адаптировалось к пылающим покровам пепла, которые застилают вулканические миры, но это не значит, что вы не будете уставать."
	value = 2 //Is not actually THAT good. Does not grant breathing and does stamina damage to the point you are unable to attack. Crippling on lavaland, but you'll survive. Is not a replacement for SEVA suits for this reason. Can be adjusted.
	mob_trait = TRAIT_ASHRESISTANCE
	medical_record_text = "У пациента аномально плотный эпидермис."
	gain_text = "<span class='notice'>Вы чувствуете себя устойчивее против горящей серы.</span>"
	lose_text = "<span class='notice'>Ваша плоть становится более легковоспламеняемой.</span>"

/* --FALLBACK SYSTEM INCASE THE TRAIT FAILS TO WORK. Do NOT enable this without editing ash_storm.dm to deal stamina damage with ash immunity.
/datum/quirk/ashresistance/add()
	quirk_holder.weather_immunities |= "ash"

/datum/quirk/ashresistance/remove()
	if(!quirk_holder)
		return
	quirk_holder.weather_immunities -= "ash"
*/

/datum/quirk/rad_fiend
	name = "Рад Фьенд"
	desc = "Вас благословил согревающий свет Атома, заставляющий вас постоянно излучать едва заметное свечение. Только особо интенсивное излучение способно проникнуть через ваш защитный барьер."
	value = 2
	mob_trait = TRAIT_RAD_FIEND
	gain_text = span_notice("Вы чувствуете в себе силы благодаря свечению Атома.")
	lose_text = span_notice("Вы понимаете, что радиация не такая уж безопасная.")

/datum/quirk/rad_fiend/add()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// Add glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = new
	quirk_action.Grant(quirk_mob)

/datum/quirk/rad_fiend/remove()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = locate() in quirk_mob.actions
	quirk_action.Remove(quirk_mob)

	// Remove glow effect
	quirk_mob.remove_filter("rad_fiend_glow")

/datum/quirk/dominant_aura
	name = "Аура Доминатора"
	desc = "Ваша аура силы и превосходства настолько выразительна, что пассивы ничего не могут поделать, кроме как броситься вам в ноги по щелчку пальцев."
	value = 1
	gain_text = "<span class='notice'>Вы хотите сделать кого-нибудь своим питомцем.</span>"
	lose_text = "<span class='notice'>Вы чувствуете себя менее напористо.</span>"

/datum/quirk/dominant_aura/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)
	RegisterSignal(quirk_holder, COMSIG_MOB_EMOTE, .proc/handle_snap)

/datum/quirk/dominant_aura/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
	UnregisterSignal(quirk_holder, COMSIG_MOB_EMOTE)

/datum/quirk/dominant_aura/proc/on_examine_holder(atom/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/sub = user
	if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
		return

	examine_list += span_lewd("\nВы испытываете сильный стыд от взгляда на [quirk_holder.ru_na()] и отводите свой взгляд!")
	if(!TIMER_COOLDOWN_CHECK(user, COOLDOWN_DOMINANT_EXAMINE))
		to_chat(quirk_holder, span_notice("[user] пытается посмотреть на вас, но тут же отворачивается с красным лицом..."))
		TIMER_COOLDOWN_START(user, COOLDOWN_DOMINANT_EXAMINE, 10 SECONDS)
		sub.dir = turn(get_dir(sub, quirk_holder), pick(-90, 90))
		sub.emote("blush")

/datum/quirk/dominant_aura/proc/handle_snap(datum/source, list/emote_args)
	SIGNAL_HANDLER

	. = FALSE
	var/datum/emote/E
	E = E.emote_list[lowertext(emote_args[EMOTE_ACT])]
	if(TIMER_COOLDOWN_CHECK(quirk_holder, COOLDOWN_DOMINANT_SNAP) || !findtext(E?.key, "snap"))
		return
	for(var/mob/living/carbon/human/sub in hearers(DOMINANT_DETECT_RANGE, quirk_holder))
		if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
			continue
		var/good_x = "питомец"
		switch(sub.gender)
			if(MALE)
				good_x = "мальчик"
			if(FEMALE)
				good_x = "девочка"
		switch(E?.key)
			if("snap")
				sub.dir = get_dir(sub, quirk_holder)
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_notice("\The <b>[sub]</b> застенчиво поворачивается и начинает покорное наблюдение за \the <b>[quirk_holder]</b>. Какая молодчинка!"),
									span_lewd("Ты покорно смотришь на \the [quirk_holder] и с трудом отводишь свой взгляд!"))
			if("snap2")
				sub.dir = get_dir(sub, quirk_holder)
				sub.KnockToFloor()
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на колени и преклоняет свою голову<b>[quirk_holder]</b>."),
									span_lewd("Ты бросаешься на свои колени и преклоняешь голову перед <b>[quirk_holder]</b>, будто бы какое-то животное!"))
			if("snap3")
				sub.KnockToFloor()
				step(sub, get_dir(sub, quirk_holder))
				sub.emote(pick("blush", "pant"))
				sub.do_jitter_animation(30) //You're being moved anyways
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на четвереньки и приближается на своих коленях к \the <b>[quirk_holder]</b>"),
									span_lewd("Ты бросаешься на четвереньки и приближаешься на своих коленях к \the <b>[quirk_holder]</b>! [good_x] в своём репертуаре."))
		. = TRUE

	if(.)
		TIMER_COOLDOWN_START(quirk_holder, COOLDOWN_DOMINANT_SNAP, DOMINANT_SNAP_COOLDOWN)

/datum/quirk/arachnid
	name = "Арахнид"
	desc = "Ваша анатомия позволяет плести паутину и коконы, будучи не арахнидом! (Учтите, что этот навык ничего не даёт расе арахнидов)"
	value = 1
	medical_record_text = "Пациент попытался покрыть комнату паутиной, заявляя, что \"делает гнездо\"."
	mob_trait = TRAIT_ARACHNID
	gain_text = "<span class='notice'>У вас появляется странное ощущение рядом с анусом...</span>"
	lose_text = "<span class='notice'>Вы чувствуете, что больше не можете вить паутину...</span>"
	processing_quirk = TRUE

/datum/quirk/arachnid/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		to_chat(H, "<span class='warning'>Этот навык ничего не даёт арахнидам, так как является встроенным для расы.</span>")
		return
	var/datum/action/innate/spin_web/SW = new
	var/datum/action/innate/spin_cocoon/SC = new
	SC.Grant(H)
	SW.Grant(H)

/datum/quirk/arachnid/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		return
	var/datum/action/innate/spin_web/SW = locate(/datum/action/innate/spin_web) in H.actions
	var/datum/action/innate/spin_cocoon/SC = locate(/datum/action/innate/spin_cocoon) in H.actions
	SC?.Remove(H)
	SW?.Remove(H)

/datum/quirk/flutter
	name = "Парение"
	desc = "Вы можете свободно двигаться в герметичной среде с низкой гравитацией при помощи крыльев, магии или другой физиологической чуши."
	value = 1
	mob_trait = TRAIT_FLUTTER

/datum/quirk/cloth_eater
	name = "Пожиратель Одежды"
	desc = "Вы можете съесть большинство одежды, чтобы получить прибавку к настроению и питательные вещества. (Насекомые владеют этим навыком.)"
	value = 1
	var/mood_category ="cloth_eaten"
	mob_trait = TRAIT_CLOTH_EATER

/datum/quirk/ropebunny
	name = "Rope Bunny"
	desc = "Вы обучены искусно вязать верёвки любой формы. Вы можете создавать веревку из ткани, а из этой веревки - болы!"
	value = 2

/datum/quirk/ropebunny/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return
	var/datum/action/ropebunny/conversion/C = new
	C.Grant(H)

/datum/quirk/ropebunny/remove()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/ropebunny/conversion/C = locate() in H.actions
	C.Remove(H)
	. = ..()

/datum/quirk/hallowed
	name = "Святой Дух"
	desc = "Вы были благословлены высшими силами или каким-то иным образом наделены святой энергией. Святая вода восстановит ваше здоровье!"
	value = 2
	mob_trait = TRAIT_HALLOWED
	gain_text = span_notice("Вы чувствуете, как святая энергия начинает течь по вашему телу.")
	lose_text = span_notice("Вы чувствуете, как угасает ваша святая энергия...")
	medical_record_text = "У пациента обнаружены неопознанные освященные материалы в крови. Проконсультируйтесь с капелланом."

/datum/quirk/hallowed/add()
	// Add examine text.
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)

/datum/quirk/hallowed/remove()
	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text.
/datum/quirk/hallowed/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.p_they(TRUE)] излучает священную силу..."

/datum/quirk/russian
	name = "Русский дух"
	desc = "Вы были благословлены высшими силами или каким-то иным образом наделены святой энергией. С вами Бог!"
	value = 2
	mob_trait = TRAIT_RUSSIAN
	gain_text = span_notice("Вы чувствуете, как Бог следит за вами!")
	lose_text = span_notice("Вы чувствуете, как угасает ваша вера в Бога...")
	medical_record_text = "У пациента обнаружен Ангел-Хранитель."

/datum/quirk/russian/add()
	// Add examine text.
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/quirk_examine_russian)

/datum/quirk/russian/remove()
	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text.
/datum/quirk/russian/proc/quirk_examine_russian(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.ru_who(TRUE)] излучает русский дух..."

///datum/quirk/bomber
//	name = "Подрывник-Самоубийца"
//	desc = "Благодаря своим связям с Красной Бригадой вы получили специальный имплант для самоуничтожения! Ну или почему-то вы решили ввести себе какую-то зелёную штуку из имплантера с мусорки и теперь вы научились делать что-то потрясное..."
//	value = 4
//
///datum/quirk/bomber/add()
//	. = ..()
//	var/mob/living/carbon/human/H = quirk_holder
//	if (!H)
//		return
//	var/obj/item/implant/explosive/E = new
//	E.implant(H)
//	H.update_icons()

/datum/quirk/breathing_tube
	name = "Трубка для Горлового Дыхания"
	desc = "Похоже, что вам не нравятся стандартные противогазы и прочие методы дыхания в безвоздушных условиях. Есть решение!"
	value = 1
	mood_quirk = FALSE
	processing_quirk = FALSE

/datum/quirk/breathing_tube/on_spawn()
	. = ..()

	// Create a new augment item
	var/obj/item/organ/cyberimp/mouth/breathing_tube/put_in = new

	// Apply the augment to the quirk holder
	put_in.Insert(quirk_holder, null, TRUE, TRUE)

// /datum/quirk/restorative_metabolism
// 	name = "Восстановительный Метаболизм"
// 	desc = "Ваше тело обладает дифференцированной способностью к восстановлению, что позволяет вам медленно восстанавливаться после травм. Однако обратите внимание, что критические травмы, ранения или генетические повреждения все равно потребуют медицинской помощи."
// 	value = 3
// 	mob_trait = TRAIT_RESTORATIVE_METABOLISM
// 	gain_text = span_notice("Вы чувствуете прилив жизненной силы, проходящей через ваше тело...")
// 	lose_text = span_notice("Вы чувствуете, как ваши улучшенные способности к восстановлению исчезают...")
// 	processing_quirk = TRUE

// /datum/quirk/restorative_metabolism/on_process()
// 	. = ..()
// 	var/mob/living/carbon/human/H = quirk_holder

// 	// The only_organic flag allows robotic biotypes to not be excluded.
// 	H.adjustBruteLoss(-0.5, only_organic = FALSE) //The healing factor will only regenerate fully if not burnt beyond a specific threshold.
// 	H.adjustFireLoss(-0.25,  only_organic = FALSE)
// 	if(H.getBruteLoss() > 0 && H.getFireLoss() <= 50 || H.getFireLoss() > 0 && H.getFireLoss() <= 50)
// 		H.adjustBruteLoss(-0.5, forced = TRUE, only_organic = FALSE)
// 		H.adjustFireLoss(-0.25, forced = TRUE, only_organic = FALSE)
// 	/* Doesn't heal robotic toxin damage (only_organic = FALSE not needed for tox),
// 	another adjustToxLoss check with toxins_type = TOX_SYSCORRUPT,
// 	(or just adding TOX_OMNI to the already existing one) could be added to heal robotic corruption,
// 	but would make robotic species unbalanced.
// 	*/
// 	else if (H.getToxLoss() <= 90)
// 		H.adjustToxLoss(-0.3, forced = TRUE)

/datum/quirk/bloodfledge
	name = "Отпрыск Кровопийцы"
	desc = "Вы новообращенный, принадлежащий к древнему роду Кровопийц. Благословению еще предстоит полностью изменить вас, но некоторые вещи уже поменялись. Только кровь утолит голод, а божественная сила обуглит вашу плоть. <b>Это НЕ роль антагониста!</b>"
	value = 2
	medical_record_text = "Пациент демонстрирует начальные симптомы кровяного проклятия."
	mob_trait = TRAIT_BLOODFLEDGE
	gain_text = span_notice("Вы чувствуете жажду крови.")
	lose_text = span_notice("Вы чувствуете, что жажда крови угасла.")
	processing_quirk = FALSE // Handled by crates.dm

/datum/quirk/bloodfledge/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk traits
	ADD_TRAIT(quirk_mob,TRAIT_NO_PROCESS_FOOD,ROUNDSTART_TRAIT)
	ADD_TRAIT(quirk_mob,TRAIT_NOTHIRST,ROUNDSTART_TRAIT)

	// Set skin tone, if possible
	// if(!quirk_mob.dna.skin_tone_override)
	// 	quirk_mob.skin_tone = "albino"

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

/datum/quirk/breathless
	name = "Недышащий"
	desc = "Благодаря генной инженерии, технологиям или магии блюспейса вам больше не нужен воздух для жизнедеятельности. Это также означает, что проведение таких жизненно важных манипуляций, как искусственное дыхание, станет невозможным."
	value = 3
	medical_record_text = "Биологические показатели пациента свидетельствуют об отсутствии необходимости в дыхании."
	gain_text = span_notice("Вам больше не нужно дышать.")
	lose_text = span_notice("Вам нужно снова дышать...")
	processing_quirk = TRUE

/datum/quirk/breathless/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NOBREATH,ROUNDSTART_TRAIT)

/datum/quirk/breathless/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NOBREATH, ROUNDSTART_TRAIT)

/datum/quirk/breathless/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjustOxyLoss(-3) /* Bandaid-fix for a defibrillator "bug",
	Which causes oxy damage to stack for mobs that don't breathe */
