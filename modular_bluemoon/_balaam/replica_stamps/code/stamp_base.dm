/obj/item/stamp_block
	name = "wooden block"
	desc = "A hatchet-hewn middle-sized wooden block. Too tough to carve anything out of."
	icon = './modular_bluemoon/_balaam/replica_stamps/icons/items.dmi'
	icon_state = "block"

/obj/item/stamp_block/attackby(obj/item/T, mob/user, params)
	if(T.sharpness && T.force > 0)
		if(!user.is_holding(src))
			to_chat(user, "<span class='warning'>You need to hold the [src] in your hands to properly process it!</span>")
			return
		to_chat(user, "<span class='notice'>You start working on the [src] with the [T]...</span>")
		if(do_after(user, 10 SECONDS, src))
			to_chat(user, "<span class='notice'>You chop off the corners of the [src] with the [T].</span>")
			var/obj/new_stamp_base = new /obj/item/stamp_base(loc)
			qdel(src)
			user.put_in_hands(new_stamp_base)
			return
		return

/obj/item/stamp_base
	name = "wooden stamp base"
	desc = "A blank stamp base, sloppily cut from a block of wood. It lacks any marking."
	icon = './modular_bluemoon/_balaam/replica_stamps/icons/items.dmi'
	icon_state = "stamp"
	custom_materials = list(/datum/material/wood=60)
	pressure_resistance = 2
	attack_verb = list("stamped")
	var/carving = FALSE
	var/current_step = 1
	var/list/remarks = list(
		"You cut the edges of the wooden stamp base.",
		"You shape the handle of the wooden stamp base.", 
		"You smooth the handle for a more comfortable grip.", 
		"You carefully carve out the stamp pattern on the wooden stamp base.", 
		"You cut off excess wood and blow away any leftover wood chips."
		)
	var/list/types = list(
		"quartermaster's stamp" = /obj/item/stamp/replica/qm, 
		"law office stamp" = /obj/item/stamp/replica/law, 
		"captain's stamp" = /obj/item/stamp/replica/captain, 
		"command's stamp" = /obj/item/stamp/replica/command, 
		"head of personnel's stamp" = /obj/item/stamp/replica/hop, 
		"head of security's stamp" = /obj/item/stamp/replica/hos, 
		"chief engineer's stamp" = /obj/item/stamp/replica/ce, 
		"research director's stamp" = /obj/item/stamp/replica/rd, 
		"chief medical officer's stamp" = /obj/item/stamp/replica/cmo, 
		"clown's stamp" = /obj/item/stamp/replica/clown, 
		"syndicate stamp" = /obj/item/stamp/replica/syndicate, 
		"NanoTrasen stamp" = /obj/item/stamp/replica/ntr, 
		"warden's stamp" = /obj/item/stamp/replica/warden, 
		"security stamp" = /obj/item/stamp/replica/security
		)
	

/obj/item/stamp_base/Initialize(mapload)
	. = ..()

/obj/item/stamp_base/proc/next_step(mob/user)
	playsound(user, pick('sound/effects/pageturn1.ogg','sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg'), 30, 1)
	if(do_after(user, 5 SECONDS, src))
		to_chat(user, "<span class='notice'>[remarks[current_step]]</span>")
		return TRUE
	return FALSE

/obj/item/stamp_base/proc/on_carving_start(mob/user)
	user.visible_message(
		"[user] begins carving something out of the [src]...", \
		"<span class='notice'>You begin shaping the [src].</span>"
		)

/obj/item/stamp_base/proc/on_carving_finished(mob/user, stamp_type)
	var/typefromlist = types[stamp_type]
	var/obj/stamp = new typefromlist
	qdel(src)
	user.put_in_hands(stamp)
	

/obj/item/stamp_base/attackby(obj/item/T, mob/user, params)
	if(T.get_sharpness())
		if(!user.is_holding(src))
			to_chat(user, "<span class='warning'>You need to hold the [src] in your hands to properly process it!</span>")
			return

		var/stamp_type = input(usr, "You want to make a...", "Choose the pattern", types[1]) as null | anything in types
		if(stamp_type == null)
			return

		on_carving_start(user)
		carving = TRUE
		for(current_step, current_step <= 5, current_step++)
			if(!next_step(user))
				carving = FALSE
				return
		if(do_after(user, 5 SECONDS, src))
			on_carving_finished(user, stamp_type)
		carving = FALSE
	. = ..()

