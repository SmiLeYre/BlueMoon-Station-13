/obj/item/strapon_strap
	name = "strapon strap"
	desc = "A strap used to create strapons. Attach a dildo onto it to create a strapon."
	icon = 'modular_splurt/icons/obj/strapon.dmi'
	icon_state = "strapon_strap"
	item_state = "strapon_strap"

/obj/item/strapon_strap/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/genital_equipment/dildo))
		to_chat(user, span_userlove("You attach the dildo to the strap."))
		var/obj/item/genital_equipment/dildo/dildo = I
		var/obj/item/clothing/underwear/briefs/strapon/new_strapon = new /obj/item/clothing/underwear/briefs/strapon(user.loc)
		new_strapon.dildo_color = dildo.color
		new_strapon.dildo_shape = dildo.dildo_shape
		new_strapon.dildo_size = dildo.dildo_size
		new_strapon.dildo_alpha = dildo.alpha
		new_strapon.dildo_can_customize = dildo.can_customize
		new_strapon.update_icon_state()
		new_strapon.update_icon()
		if(loc == user && dildo.loc == user)
			qdel(src)
			qdel(dildo)
			user.put_in_hands(new_strapon)
		else
			qdel(src)
			qdel(dildo)
	else
		return ..()

/obj/item/clothing/underwear/briefs/strapon
	name = "strapon"
	desc = "A dildo on a strap, to be attached around one's waist."
	icon = 'modular_splurt/icons/obj/strapon.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/strapon.dmi'
	icon_state = "strapon_base"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	flags_inv = NONE
	var/dildo_color = "#ff54dd"
	var/dildo_shape = "human"
	var/dildo_size = 3
	var/dildo_alpha = 192
	var/dildo_can_customize = TRUE

/obj/item/clothing/underwear/briefs/strapon/update_overlays()
	. = ..()
	var/mutable_appearance/dildo_overlay = mutable_appearance('modular_splurt/icons/obj/strapon.dmi', "strapon_[dildo_shape]")
	dildo_overlay.color = dildo_color
	add_overlay(dildo_overlay)

/obj/item/clothing/underwear/briefs/strapon/examine(mob/user)
	. = ..()
	. += "There is a <span class='notice'>[GLOB.dildo_size_names[dildo_size]] [dildo_shape][dildo_can_customize ? " custom" : ""] dildo</span> attached to it."
	. += span_notice("Alt-Click \the [src.name] to separate the strap and dildo.")

/obj/item/clothing/underwear/briefs/strapon/AltClick(mob/living/user, obj/item/I)
	to_chat(user, span_userlove("You separate the dildo from the strap."))
	var/obj/item/strapon_strap/new_strapon_strap = new /obj/item/strapon_strap(user.loc)
	var/obj/item/genital_equipment/dildo/new_dildo
	if(dildo_can_customize)
		new_dildo = new /obj/item/genital_equipment/dildo/custom(user.loc)
	else
		switch(dildo_shape)
			if("human")
				new_dildo = new /obj/item/genital_equipment/dildo/human(user.loc)
			if("knotted")
				new_dildo = new /obj/item/genital_equipment/dildo/knotted(user.loc)
			if("plain")
				new_dildo = new /obj/item/genital_equipment/dildo/plain(user.loc)
			if("flared")
				if(dildo_size > 4)
					new_dildo = new /obj/item/genital_equipment/dildo/flared/gigantic(user.loc)
				else if(dildo_size > 3)
					new_dildo = new /obj/item/genital_equipment/dildo/flared/huge(user.loc)
				else
					new_dildo = new /obj/item/genital_equipment/dildo/flared(user.loc)
			else
				return

	new_dildo.random_color = FALSE
	new_dildo.color = dildo_color
	new_dildo.random_shape = FALSE
	new_dildo.dildo_shape = dildo_shape
	new_dildo.random_size = FALSE
	new_dildo.dildo_size = dildo_size
	new_dildo.alpha = dildo_alpha
	new_dildo.update_appearance()
	if(loc == user)
		qdel(src)
		user.put_in_hands(new_strapon_strap)
		user.put_in_hands(new_dildo)
	else
		qdel(src)

/obj/item/clothing/underwear/briefs/strapon/proc/is_exposed()
	if(!istype(loc, /mob/living/carbon))
		return FALSE

	var/mob/living/carbon/owner = loc
	var/L = owner.get_equipped_items()
	L -= src
	return owner.is_groin_exposed(L)

/obj/item/clothing/underwear/briefs/strapon/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_UNDERWEAR)
		return

	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/C = user
		to_chat(C, span_userlove("You're now ready to bone someone!"))

/obj/item/clothing/underwear/briefs/strapon/mob_can_equip(M, equipper, slot, disable_warning, bypass_equip_delay_self)
	if(!..())
		return FALSE

	if(istype(M, /mob/living))
		var/mob/living/living = M
		if(living.has_penis(REQUIRE_ANY))
			to_chat(living, span_notice("\The [living] doesn't seem to need a strapon!"))
			return FALSE

	return TRUE
