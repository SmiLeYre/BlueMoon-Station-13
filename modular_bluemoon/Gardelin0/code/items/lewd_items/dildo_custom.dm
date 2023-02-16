/obj/item/dildo
	lefthand_file = 'modular_bluemoon/Gardelin0/icons/items/onmob/lefthand.dmi'
	righthand_file = 'modular_bluemoon/Gardelin0/icons/items/onmob/righthand.dmi'
	item_state = "dildo"
	var/inside = FALSE

/obj/item/dildo/insert_item_organ(mob/living/carbon/user, mob/living/carbon/target, obj/item/organ/genital/target_organ)
	if(!(target.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return

	if(!(istype(target_organ, /obj/item/organ/genital/vagina)) && !(istype(target_organ, /obj/item/organ/genital/anus))) //dildos dont fit on anything but vaginas and anus
		to_chat(user, "<span class='warning'> How do you even imagine that?!</span>")
		return

	if(locate(src.type) in target_organ.contents)
		to_chat(user, span_notice("\The <b>[target]</b>'s [target_organ] already has a dildo inside!"))
		return

	target.visible_message(span_warning("\The <b>[user]</b> is trying to insert a [src] inside \the <b>[target]</b>!"),\
					span_warning("\The <b>[user]</b> is trying to insert a [src] inside you!"))

	if(!do_mob(user, target, 5 SECONDS))
		return

	if(!user.transferItemToLoc(src, target_organ))
		return

	to_chat(target, span_userlove("Your [target_organ] feels stuffed and stretched!"))
	target.handle_post_sex(LOW_LUST, null, target)
	playsound(target, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = TRUE
	stuffed_movement()

obj/item/dildo/MouseDrop_T(mob/living/M, mob/living/user)
	var/message = ""
	var/lust_amt = 0
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina(REQUIRE_EXPOSED))
							message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]' попой.",  "скачет на '\the [src]' киской!") : pick("насаживает <b>[M]</b> киской на '\the [src]'", "надавливает на плечи <b>[M]</b>, заставляя скакать киской на '\the [src]!'")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(M.has_anus(REQUIRE_EXPOSED))
							message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]' киской.",  "скачет на '\the [src]' попой!") : pick("насаживает <b>[M]</b> попой на '\the [src]'", "надавливает на плечи <b>[M]</b>, заставляя скакать попой на '\the [src]!'")
							lust_amt = NORMAL_LUST
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свой ротик.", "запихивает '\the [src]' прямо в свой собственный ротик.", "втыкает '\the [src]' прямо в свой ротик.", "заглатывает '\the [src]' целиком!") : pick("насаживает <b>[M]</b> ротиком на '\the [src]'", "надавливает на затылок <b>[M]</b>, заставляя заглатывать '\the [src]!'")
	if(message)
		user.visible_message("<span class='lewd'><b>[user]</b> [message].</span>")
		M.handle_post_sex(lust_amt, null, user)
		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
