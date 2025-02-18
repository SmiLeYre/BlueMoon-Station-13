/obj/structure/fireaxecabinet/sledgehammercabinet
	name = "Sledgehammer cabinet"
	desc = "White pattern cabinet made with titanium, for storing some of Chief Engineer's \"heavy\" arguments."
	icon = 'modular_bluemoon/icons/obj/hammer_wallmounts.dmi'
	icon_state = "dhammer"
	max_integrity = 200
	var/obj/item/demolition_hammer/hammer


/obj/structure/fireaxecabinet/sledgehammercabinet/Initialize(mapload)
	. = ..()
	hammer = new
	update_icon()


/obj/structure/fireaxecabinet/sledgehammercabinet/Destroy()
	if(hammer)
		QDEL_NULL(hammer)
	return ..()


/obj/structure/fireaxecabinet/sledgehammercabinet/attackby(obj/item/I, mob/user, params)
	if(iscyborg(user) || I.tool_behaviour == TOOL_MULTITOOL)
		toggle_lock(user)

	else if(istype(I, /obj/item/stack/sheet/glass) && broken)
		var/obj/item/stack/sheet/glass/G = I
		if(G.get_amount() < 2)
			to_chat(user, "<span class='warning'>You need two glass sheets to fix [src]!</span>")
			return
		to_chat(user, "<span class='notice'>You start fixing [src]...</span>")
		if(do_after(user, 20, target = src) && G.use(2))
			broken = 0
			obj_integrity = max_integrity
			update_icon()

	else if(open || broken)
		if(istype(I, /obj/item/demolition_hammer) && !hammer)
			var/obj/item/demolition_hammer/dhammer = I
			if(dhammer.wielded)
				to_chat(user, "<span class='warning'>Unwield the [dhammer.name] first.</span>")
				return
			if(!user.transferItemToLoc(dhammer, src))
				return
			hammer = dhammer
			to_chat(user, "<span class='caution'>You place the [dhammer.name] back in the [name].</span>")
			update_icon()
			return
		else if(!broken)
			toggle_open()

	else
		return ..()


/obj/structure/fireaxecabinet/sledgehammercabinet/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	if(open)
		return
	. = ..()
	if(.)
		update_icon()


/obj/structure/fireaxecabinet/sledgehammercabinet/obj_break(damage_flag)
	if(!broken && !(flags_1 & NODECONSTRUCT_1))
		update_icon()
		broken = TRUE
		playsound(src, 'sound/effects/glassbr3.ogg', 100, 1)
		new /obj/item/shard(loc)
		new /obj/item/shard(loc)


/obj/structure/fireaxecabinet/sledgehammercabinet/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(open || broken)
		if(hammer)
			user.put_in_hands(hammer)
			hammer = null
			to_chat(user, "<span class='caution'>You take the hammer from the [name].</span>")
			src.add_fingerprint(user)
			update_icon()
			return
	if(locked)
		to_chat(user, "<span class='warning'>The [name] won't budge!</span>")
		return
	else
		open = !open
		update_icon()
		return


/obj/structure/fireaxecabinet/sledgehammercabinet/update_overlays()
	. = ..()
	if(hammer)
		. += "dhammer_i"

	if(!open)
		var/hp_percent = obj_integrity/max_integrity * 100
		if(broken)
			. += "glass4"
		else
			switch(hp_percent)
				if(-INFINITY to 40)
					. += "glass3"
				if(40 to 60)
					. += "glass2"
				if(60 to 80)
					. += "glass1"
				if(80 to INFINITY)
					. += "glass"
		if(locked)
			. += "locked"
		else
			. += "unlocked"
	else
		. += "glass_raised"
