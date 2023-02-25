//Main code edits
/datum/quirk/photographer
	desc = "Вы берете с собой камеру и фотоальбом, куда бы вы ни пошли. Также, вы быстрее фотографируете."

/datum/quirk/photographer/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/storage/photo_album/photo_album = new(get_turf(H))
	H.put_in_hands(photo_album)
	H.equip_to_slot(photo_album, ITEM_SLOT_BACKPACK)
	photo_album.persistence_id = "personal_[H.mind.key]" // this is a persistent album, the ID is tied to the account's key to avoid tampering
	photo_album.persistence_load()
	photo_album.name = "Фотоальбом [H.real_name]"

//Own stuff
/datum/quirk/tough
	name = "Стойкость"
	desc = "Ваше аномально крепкое тело может вынести на 25% больше урона."
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
	name = "Rad Fiend"
	desc = "You've been blessed by Cherenkov's warming light, causing you to emit a subtle glow at all times. Only intense radiation is capable of penetrating your protective barrier."
	value = 2
	mob_trait = TRAIT_RAD_FIEND
	gain_text = span_notice("You feel empowered by Cherenkov's glow.")
	lose_text = span_notice("You realize that rads aren't so rad.")

	// Variable for the radiation immunity check
	var/can_gain = TRUE

/datum/quirk/rad_fiend/add()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Check for any radiation immunity
	if(HAS_TRAIT(quirk_mob, TRAIT_RADIMMUNE))
		// Set gain status
		can_gain = FALSE

		// Return without doing anything
		return

	// Add glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = new
	quirk_action.Grant(quirk_mob)

/datum/quirk/rad_fiend/post_add()
	// Check if quirk effect was gained
	if(can_gain)
		return

	// Alert quirk holder of gain status
	to_chat(quirk_holder, span_warning("As you are immune to radiation, you were unable to gain Cherenkov's blessing. Please discuss alternatives with a medical professional."))

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
		to_chat(quirk_holder, span_notice("\The [user] пытается посмотреть на вас, но тут же отворачивается с красным лицом..."))
		TIMER_COOLDOWN_START(user, COOLDOWN_DOMINANT_EXAMINE, 5 SECONDS)
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
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на колени и преклоняет свою голову в однозначном желании выполнить поручение <b>[quirk_holder]</b>."),
									span_lewd("Ты бросаешься на свои колени и преклоняешь голову перед <b>[quirk_holder]</b>, будто бы какое-то животное!"))
			if("snap3")
				sub.KnockToFloor()
				step(sub, get_dir(sub, quirk_holder))
				sub.emote(pick("blush", "pant"))
				sub.do_jitter_animation(30) //You're being moved anyways
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на четвереньки к \the <b>[quirk_holder]</b> и приближается на своих коленях в готовности выполнять любые команды."),
									span_lewd("Ты бросаешься на четвереньки и приближаешься на своих коленях к \the <b>[quirk_holder]</b> в готовности выполнять любые приказы! [good_x] в своём репертуаре."))
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
