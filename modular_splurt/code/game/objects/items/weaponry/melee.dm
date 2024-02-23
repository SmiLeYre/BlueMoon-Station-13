/obj/item/melee/baseball_bat
	hole = CUM_TARGET_VAGINA

/obj/item/melee/baseball_bat/AltClick(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Я целюсь в... [hole].</span>")

/obj/item/melee/baseball_bat/attack(mob/living/target, mob/living/user)
	user.DelayNextAction(CLICK_CD_RANGE)
	if (user.zone_selected == BODY_ZONE_PRECISE_GROIN && user.a_intent == INTENT_HELP)
		var/message = ""
		var/lust_amt = 0
		if(ishuman(target) && (target?.client?.prefs?.toggles & VERB_CONSENT))
			if(user.zone_selected == BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(target.has_vagina() == HAS_EXPOSED_GENITAL)
							message = (user == target) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[target]</b> прямо в киску с помощью '\the [src]'", "засовывает '\the [src]' прямо в киску <b>[target]</b>.")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(target.has_anus() == HAS_EXPOSED_GENITAL)
							message = (user == target) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[target]</b> прямо в попку '\the [src]'", "активно суёт '\the [src]' прямо в попку <b>[target]</b>.")
							lust_amt = NORMAL_LUST
		if(message)
			user.visible_message("<span class='lewd'><b>[user]</b> [message].</span>")
			target.handle_post_sex(lust_amt, null, user)
			playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
								'modular_sand/sound/interactions/bang5.ogg',
								'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
			if(!HAS_TRAIT(target, TRAIT_LEWD_JOB))
				new /obj/effect/temp_visual/heart(target.loc)
	else //Standart code
		. = ..()
		if(HAS_TRAIT(user, TRAIT_PACIFISM))
			return
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		if(homerun_ready)
			user.visible_message("<span class='userdanger'>It's a home run!</span>")
			target.throw_at(throw_target, rand(8,10), 14, user)
			target.ex_act(EXPLODE_HEAVY)
			playsound(get_turf(src), 'sound/weapons/homerun.ogg', 100, TRUE)
			homerun_ready = 0
			return
		else if(!target.anchored)
			// BLUEMOON ADDITION AHEAD - нельзя отправлять в полёт тяжёлых, т.к. у них модификатор к урону и это можно абузить для предотвращения проблем с мобильностью
			if(HAS_TRAIT(target, TRAIT_BLUEMOON_HEAVY_SUPER) || HAS_TRAIT(target, TRAIT_BLUEMOON_HEAVY))
				return
			// BLUEMOON ADDITION END
			var/whack_speed = (prob(60) ? 1 : 4)
			target.throw_at(throw_target, rand(1, 2), whack_speed, user) // sorry friends, 7 speed batting caused wounds to absolutely delete whoever you knocked your target into (and said target)


// Prova, cause I can

/obj/item/melee/baton/prova
	name = "prova"
	desc = "An enhanced taser stick, a favorite of the legendary John Prodman."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "prova"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	item_state = "prova"
