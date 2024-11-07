/obj/structure/bed/dildo_machine
	name = "Dildo machine"
	desc = "It provides pleasure."
	icon = 'modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi'
	icon_state = "dilmachine"
	anchored = 0
	var/mode = "normal"
	var/intencity = 12
	var/on = 0
	var/hole = CUM_TARGET_VAGINA
	var/fuck_hole
	buckle_lying = TRUE
	flags_1 = NODECONSTRUCT_1

/obj/structure/bed/dildo_machine/New()
	..()
	add_overlay(mutable_appearance('modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi', "dilmachine_over", MOB_LAYER + 1))

/obj/structure/bed/dildo_machine/verb/change_hole()
	set name = "Change hole"
	set category = "Object"
	set src in oview(1)
	var/input = input(usr,"Change intensity mode") as null|anything in list("vagina", "anus")
	switch(input)
		if("vagina")
			hole = CUM_TARGET_VAGINA
		if("anus")
			hole = CUM_TARGET_ANUS

/obj/structure/bed/dildo_machine/verb/change_mode()
	set name = "Change mode"
	set category = "Object"
	set src in oview(1)

	var/input = input(usr,"Change intensity mode") as null|anything in list("low", "normal", "high")
	if(input)
		mode = input
		if(mode == "low")
			intencity = 6
		if(mode == "normal")
			intencity = 12
		if(mode == "high")
			intencity = 18

/obj/structure/bed/dildo_machine/verb/toggle()
	set name = "Toggle dildo machine"
	set category = "Object"
	set src in oview(1)
	on = !on
	spawn()
		while(on)
			if(activate_after(src, 5))
				fuck()
	if(on)
		to_chat(usr, "[src] вкл.")
	else
		to_chat(usr, "[src] выкл.")

/obj/structure/bed/dildo_machine/proc/fuck()
	if(!on)
		return

	if(has_buckled_mobs())
		for(var/m in buckled_mobs)
			var/mob/living/carbon/human/M = m
			switch(hole)
				if(CUM_TARGET_VAGINA)
					if(M.has_vagina(REQUIRE_EXPOSED))
						fuck_hole = "pussy"
						M.handle_post_sex(intencity, null, src)
						M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, min(intencity * 5, 100), PLUG13_DURATION_NORMAL)
						playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang[rand(1, 6)].ogg", 30, 1)
						switch(mode)
							if("low")
								to_chat(M, span_love(pick("Я чувствую слабые фрикции в киске!", "Оно слабо стимулирует мне вагину!")))
							if("normal")
								to_chat(M, span_love(pick("Я чувствую фрикции в киске!", "Оно стимулирует мне вагину!")))
							if("high")
								to_chat(M, span_userdanger(pick("Сильные фрикции в киске сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции вагины!")))
								M.Jitter(3)
								M.Stun(3)
								if(prob(50))
									M.emote("moan")
				if(CUM_TARGET_ANUS)
					if(M.has_anus(REQUIRE_EXPOSED))
						M.handle_post_sex(intencity, null, src)
						M.client?.plug13.send_emote(PLUG13_EMOTE_ANUS, min(intencity * 5, 100), PLUG13_DURATION_NORMAL)
						playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang[rand(1, 6)].ogg.ogg", 30, 1)
						switch(mode)
							if("low")
								to_chat(M, span_love(pick("Я чувствую слабые фрикции в попе!", "Оно слабо стимулирует мне анус!")))
							if("normal")
								to_chat(M, span_love(pick("Я чувствую фрикции в попе!", "Оно стимулирует мне анус!")))
							if("high")
								to_chat(M, span_userdanger(pick("Сильные фрикции в попе сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции ануса!")))
								M.Jitter(3)
								M.Stun(3)
								if(prob(50))
									M.emote("moan")

/obj/structure/bed/dildo_machine/attackby(obj/item/used_item, mob/user, params)
	if(used_item.tool_behaviour == TOOL_WRENCH)
		to_chat(user, "<span class='notice'>You begin to [anchored ? "unwrench" : "wrench"] [src].</span>")
		if(used_item.use_tool(src, user, 20, volume=30))
			to_chat(user, "<span class='notice'>You successfully [anchored ? "unwrench" : "wrench"] [src].</span>")
			setAnchored(!anchored)
	else if(istype(used_item, /obj/item/screwdriver))
		to_chat(user, span_notice("You unscrew the frame and begin to deconstruct it..."))
		playsound(loc, "'sound/items/screwdriver.ogg'", 30, 1)
		if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
			to_chat(user, span_notice("You disassemble it."))
			new /obj/item/dildo_machine_kit (src.loc)
			qdel(src)
	else
		return ..()

/obj/item/dildo_machine_kit
	name = "dildo machine construction kit"
	desc = "Construction requires a screwdriver. Put it on the ground first!"
	icon = 'modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi'
	icon_state = "kit"
	throwforce = 0
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_HUGE

/obj/item/dildo_machine_kit/attackby(obj/item/used_item, mob/user, params) //constructing a bed here.
	add_fingerprint(user)
	if(istype(used_item, /obj/item/screwdriver))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			to_chat(user, span_notice("You screw the frame to the floor and begin to construct it..."))
			playsound(loc, "'sound/items/screwdriver.ogg'", 30, 1)
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				to_chat(user, span_notice("You assemble it."))
				new /obj/structure/bed/dildo_machine (src.loc)
				qdel(src)
			return
	else
		return ..()
