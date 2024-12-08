/obj/item/portallight/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Возможен более точный <b>контроль ситуации</b>. (Ctrl+Click для кастомного эмоута)</span>"

/obj/item/portallight/CtrlClick(mob/user)
	. = ..()
	if(GLOB.say_disabled)	//This is dumb but it's here because heehoo copypaste, who the FUCK uses this to identify lag?
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	user.emote("fleshlight")

/obj/item/clothing/underwear/briefs/panties/portalpanties/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Возможен более точный <b>контроль ситуации</b>. (Ctrl+Click для кастомного эмоута)</span>"

/obj/item/clothing/underwear/briefs/panties/portalpanties/CtrlClick(mob/user)
	. = ..()
	if(GLOB.say_disabled)	//This is dumb but it's here because heehoo copypaste, who the FUCK uses this to identify lag?
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	user.emote("fleshlight")

/datum/emote/sound/human/fleshlight
	key = "fleshlight"
	key_third_person = "fleshlight"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/sound/human/fleshlight/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/sound/human/fleshlight/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	var/mob/living/carbon/human/H_user = user

	var/list/select = list()
	for(var/obj/item/I in H_user.held_items)
		if(istype(I, /obj/item/portallight))
			select |= I
	if(H_user.wear_mask && istype(H_user.wear_mask, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		select |= H_user.wear_mask
	if(H_user.w_underwear && istype(H_user.w_underwear, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		select |= H_user.w_underwear

	var/choosen_flesh
	if(!select)
		return FALSE
	else if(select.len == 1)
		choosen_flesh = select[1]
	else
		choosen_flesh = tgui_input_list(user, "Choose what to use:", "Fleshlight preference", select)
		if(!choosen_flesh)
			return FALSE

	var/list/show_to = list()
	if(istype(choosen_flesh, /obj/item/portallight))
		var/obj/item/portallight/PF = choosen_flesh
		if(PF.portalunderwear && ishuman(PF.portalunderwear.loc))
			var/mob/living/carbon/human/H = PF.portalunderwear.loc
			if(H.w_underwear == PF.portalunderwear || H.wear_mask == PF.portalunderwear)
				show_to |= H

	else if(istype(choosen_flesh, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		var/obj/item/clothing/underwear/briefs/panties/portalpanties/PP = choosen_flesh
		for(var/obj/item/I in PP.portallight)
			if(ishuman(I.loc))
				var/mob/living/carbon/human/H = I.loc
				show_to |= H

	if(!show_to.len)
		to_chat(user, "There are no one on other side.")
		return FALSE

	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "[choosen_flesh]" , null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message("[message] (FLESHLIGH)", LOG_SUBTLER)
	message = "<span class='emote'><b>[user]</b> <i>[user.say_emphasis(message)]</i></span>"

	for(var/mob/living/L in range(user, 1))
		show_to |= L

	for(var/i in show_to)
		var/mob/M = i
		M.show_message(message)
