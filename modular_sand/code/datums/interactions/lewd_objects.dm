//Dildo changes.
/obj/item/dildo
	var/hole = CUM_TARGET_VAGINA

/obj/item/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	//var/possessive_verb = user.p_their()
	var/message = ""
	var/lust_amt = 0
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina(REQUIRE_EXPOSED))
							message = (user == M) ? pick("закусывает свою губу и крепко хватается за собственную киску с '\the [src]'", "запихивает '\the [src]' в свою киску", "втыкает '\the [src]' в свою киску.") : pick("трахает [M] прямо в киску с помощью '\the [src]'", "засовывает '\the [src]' прямо в киску [M].")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(M.has_anus(REQUIRE_EXPOSED))
							message = (user == M) ? pick("закусывает свою губу и крепко хватается за свою попку с '\the [src]'","запихивает '\the [src]' прямо в свою собственную попку.", "втыкает '\the [src]' прямо в свою попку.") : pick("трахает [M] прямо в попку '\the [src]'", "активно суёт '\the [src]' прямо в попку [M].")
							lust_amt = NORMAL_LUST
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает его пихать прямо в свой ротик.", "запихивает '\the [src]' прямо в свой собственный ротик.", "втыкает '\the [src]' прямо в свой ротик.") : pick("трахает [M] прямо в ротик при помощи '\the [src]'", "активно суёт '\the [src]' прямо в ротик [M].")
	if(message)
		user.visible_message("<span class='lewd'>[user] [message].</span>")
		M.handle_post_sex(lust_amt, null, user)
		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/dildo/attack_self(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Now targetting \the [hole].</span>")

//begin redds code
/obj/item/dildo/cyborg
	name = "F.I.S.T.R. Machine"
	desc = "Fully Integrated Sexual Tension Relief Machine"
//end redds code

/obj/item/pneumatic_cannon/dildo
	color = "#FFC0CB"
	name = "pneumatic cannon"
	desc = "A pneumatic cannon with a picture of a bus printed on the side that resembles an A-shape."
	automatic = TRUE
	selfcharge = TRUE
	gasPerThrow = 0
	checktank = FALSE
	fire_mode = PCANNON_FIFO
	throw_amount = 1
	maxWeightClass = 60
	var/static/list/dildo_typecache = typecacheof(/obj/item/dildo)
	charge_type = /obj/item/dildo

/obj/item/pneumatic_cannon/dildo/Initialize(mapload)
	. = ..()
	allowed_typecache = dildo_typecache
