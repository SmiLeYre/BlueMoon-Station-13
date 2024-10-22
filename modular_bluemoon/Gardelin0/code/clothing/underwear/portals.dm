/obj/item/clothing/underwear/briefs/panties/portalpanties
	var/seamless = FALSE //Locking them on. - Gardelin0
	var/free_use = FALSE

/obj/item/clothing/underwear/briefs/panties/portalpanties/verb/free_use()
	set name = "Switch Privacy"
	set category = "Object"
	set src in usr

	if(!isliving(usr))
		return FALSE

	if(iscarbon(usr) && (usr.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src))
		to_chat(usr, span_purple("You must take them off first!"))
		return FALSE

	free_use = !free_use
	if(free_use)
		to_chat(usr, "[src] are now public!")
		for(var/obj/item/portallight/P in world)
			audible_message("[icon2html(P, hearers(P))] *beep* *beep* *beep* - New public device is found!")
			playsound(P, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
			P.available_panties += src
	else
		to_chat(usr, "[src] are no longer public. All connected devices have been disconnected.")
		for(var/obj/item/portallight/P in world)
			P.available_panties -= src
			if(P.portalunderwear == src)
				P.portalunderwear = null
				P.updatesleeve()
				P.icon_state = "unpaired"

//So the new portal lights will check it.
/obj/item/portallight/New()
	..()
	for(var/obj/item/clothing/underwear/briefs/panties/portalpanties/P in world)
		if(P.free_use)
			src.available_panties += P
		else
			src.available_panties -= P

/obj/item/clothing/underwear/briefs/panties/portalpanties/attack_hand(mob/living/carbon/human/user)
	var/mob/living/carbon/human/C = user
	if(iscarbon(user) && seamless && (user.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src))
		to_chat(C, span_purple(pick("You pull your panties as you search for some sort of escape.",
									"You can't find any leverage to remove these panties!",
									"Your pointless clawing seems to only make things more skin tight")))
		return
	. = ..()

/obj/item/clothing/underwear/briefs/panties/portalpanties/MouseDrop(atom/over_object)

/obj/item/clothing/underwear/briefs/panties/portalpanties/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		if(seamless != FALSE)
			to_chat(user, span_warning("The panties suddenly loosen!"))
			seamless = FALSE
		else
			to_chat(user, span_warning("The panties suddenly tighten!"))
			seamless = TRUE
	return

/obj/item/clothing/underwear/briefs/panties/portalpanties/verb/rename()
	set name = "Rename"
	set category = "Object"
	set src in usr
	if(iscarbon(usr) && usr.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src)
		to_chat(span_purple("You must take them off first!"))
		return
	else
		var/input = (input("How do you wish to name it?") as text)
		if(input)
			src.name = input

/obj/item/clothing/underwear/briefs/panties/portalpanties/Initialize(mapload)
	. = ..()
	var/datum/action/item_action/chameleon/change/chameleon_action = new(src)
	chameleon_action.chameleon_type = /obj/item/clothing/underwear/briefs
	chameleon_action.chameleon_name = "Panties"
	chameleon_action.initialize_disguises()
