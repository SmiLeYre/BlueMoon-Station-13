/obj/item/nullrod/holydildo
	name = "Holy dildo"
	desc = "Golden dildo with holy features."
	icon_state = "nullrod"
	item_state = "nullrod"
	icon = 'modular_bluemoon/Fink/icons/obj/holy.dmi'
	lefthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/lefthand.dmi'
	righthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/righthand.dmi'
	attack_verb = list("banished", "struck", "smacked", "exorcised")
	force = 12
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY
	var/hole = CUM_TARGET_VAGINA

/obj/item/nullrod/holydildo/CtrlShiftClick(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, span_notice("Я целюсь в... [hole]."))

/obj/item/nullrod/holydildo/attack(mob/living/target, mob/living/user)
	user.DelayNextAction(CLICK_CD_MELEE)
	if (user.a_intent == INTENT_HELP)
		do_eblya(target, user)
	else
		if (user.a_intent == INTENT_HARM)
			. = ..()
		else
			return



/obj/item/nullrod/holydildo/proc/do_eblya(mob/living/target, mob/living/user)
	var/message = ""
	var/lust_amt = 0
	if(!user.canUseTopic(target, BE_CLOSE))
		return
	if(ishuman(target) && (target?.client?.prefs?.toggles & VERB_CONSENT))
		if(user.zone_selected == BODY_ZONE_PRECISE_GROIN)
			switch(hole)
				if(CUM_TARGET_VAGINA)
					if(target.has_vagina() == HAS_EXPOSED_GENITAL)
						message = (user == target) ? pick("Мысленно устремив взгляд в бесконечность, она крепко обхватывает '\the [src]' и начинает погружать это в свою глубину.", "С величественным постоянством она наполняет свою киску '\the [src]' во имя своей веры.", "Смиренно постанывая, она садится на '\the [src]' в акте предания и самоотдачи.") : pick("Свершая акт святой любви, она проникает внутрь <b>[target]</b> с использованием '\the [src]' в своем стремлении к блаженству.", "В торжественном ритуале она внедряет '\the [src]' прямо в киску <b>[target]</b>.")
						lust_amt = NORMAL_LUST
				if(CUM_TARGET_ANUS)
					if(target.has_anus() == HAS_EXPOSED_GENITAL)
						message = (user == target) ? pick("С верой в душе, она крепко обхватывает '\the [src]' и начинает внедрять это в свою попку.", "С величественным постоянством она наполняет свою попку '\the [src]' во имя своей веры.", "Смиренно постанывая, она садится на '\the [src]' в акте ритуала святой любви.") : pick("С величием души, она трахает <b>[target]</b> прямо в попку с помощью '\the [src]'.", "В сакральном обряде она активно суёт '\the [src]' прямо в попку <b>[target]</b>, совершая акт любви.")
						lust_amt = NORMAL_LUST
	if(message)
		user.visible_message(span_lewd("<b>[user]</b> [message]"))
		target.handle_post_sex(lust_amt, null, user)
		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
		////
		// пошло благословление
		new /obj/effect/temp_visual/yellowsparkles(target.loc)
		// чисто внутряк хилим
		target.adjustOrganLoss(ORGAN_SLOT_HEART, -1.5)
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1.5)
		target.adjustToxLoss(-1.5)
		target.adjustCloneLoss(-1.5)
		// вкусное печенько
		//if(target.get_lust() >= (target.get_lust_tolerance() * 3))  // проверка на кончание (пока сломано)
		if(prob(3))
			new /obj/item/reagent_containers/food/snacks/cookie(target.loc)
			to_chat(user, "<span class='adminnoticevin'>Your prayers have been answered!! You received the <b>best cookie</b>!</span>")
			SEND_SOUND(target, sound('sound/effects/pray_chaplain.ogg'))
