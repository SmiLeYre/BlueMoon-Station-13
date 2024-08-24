/datum/emote
	var/key = "" //What calls the emote
	var/key_third_person = "" //This will also call the emote
	var/message = "" //Message displayed when emote is used
	var/message_mime = "" //Message displayed if the user is a mime
	var/message_alien = "" //Message displayed if the user is a grown alien
	var/message_larva = "" //Message displayed if the user is an alien larva
	var/message_robot = "" //Message displayed if the user is a robot
	var/message_AI = "" //Message displayed if the user is an AI
	var/message_monkey = "" //Message displayed if the user is a monkey
	var/message_simple = "" //Message to display if the user is a simple_animal
	var/message_param = "" //Message to display if a param was given
	var/emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	var/restraint_check = FALSE //Checks if the mob is restrained before performing the emote
	var/muzzle_ignore = FALSE //Will only work if the emote is EMOTE_AUDIBLE
	var/list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	var/list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	var/list/mob_type_ignore_stat_typecache
	var/stat_allowed = CONSCIOUS
	var/static/list/emote_list = list()
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")

	/**
	 * Delay for emotes: for all emotes default = 0, for audio ones = 1 SECONDS (is determined later).
	 * If ==0, the emote doesn't not create a delay and also ignores it.
	 * If >0, takes into account the delay and adds its own delay.
	 */
	var/emote_cooldown = 0.25 SECONDS

	var/chat_popup = TRUE //Skyrat edit
	var/image_popup

/datum/emote/New()
	if(key_third_person)
		emote_list[key_third_person] = src
	if (ispath(mob_type_allowed_typecache))
		switch (mob_type_allowed_typecache)
			if (/mob)
				mob_type_allowed_typecache = GLOB.typecache_mob
			if (/mob/living)
				mob_type_allowed_typecache = GLOB.typecache_living
			else
				mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	else
		mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	mob_type_blacklist_typecache = typecacheof(mob_type_blacklist_typecache)
	mob_type_ignore_stat_typecache = typecacheof(mob_type_ignore_stat_typecache)

/datum/emote/proc/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = TRUE
	if(!can_run_emote(user, TRUE, intentional) || (user.nextsoundemote >= world.time && emote_cooldown))
		return FALSE
	var/msg = select_message_type(user)
	if(params && message_param)
		msg = select_param(user, params)

	msg = replace_pronoun(user, msg)

	if(isliving(user))
		var/mob/living/L = user
		for(var/obj/item/implant/I in L.implants)
			I.trigger(key, L)

	if(!msg)
		return

	user.log_message(msg, LOG_EMOTE)
	//msg = "<b>[user]</b> " + msg //SKYRAT CHANGE
	var/dchatmsg = "<span class='emote'><b>[user]</b> [msg]</span>" //SKYRAT CHANGE

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(user)
		if(M.stat == DEAD && M.client && (M.client.prefs && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT)) && !(M in viewers(T, null)) && (user.client)) //SKYRAT CHANGE - only user controlled mobs show their emotes to all-seeing ghosts, to reduce chat spam
			M.show_message(dchatmsg) //SKYRAT CHANGE

	if(emote_type == EMOTE_AUDIBLE)
		user.audible_message(dchatmsg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_VISIBLE)
		user.visible_message(dchatmsg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_BOTH)
		user.visible_message(dchatmsg, blind_message = msg, runechat_popup = chat_popup, rune_msg = msg)
	else if(emote_type == EMOTE_OMNI)
		user.visible_message(dchatmsg, omni = TRUE, runechat_popup = chat_popup, rune_msg = msg)
	//Skyrat change
	if(image_popup)
		flick_emote_popup_on_mob(user, image_popup, 40)
	//End of skyrat changes
	if(emote_cooldown)
		user.nextsoundemote = world.time + emote_cooldown

/datum/emote/proc/replace_pronoun(mob/user, message)
	if(findtext(message, "their"))
		message = replacetext(message, "their", user.ru_ego())
	if(findtext(message, "them"))
		message = replacetext(message, "them", user.ru_na())
	if(findtext(message, "%s"))
		message = replacetext(message, "%s", user.p_s())
	return message

/datum/emote/proc/select_message_type(mob/user, params, type_override, intentional)
    . = message
    var/sound
    if(!muzzle_ignore && user.is_muzzled() && emote_type == EMOTE_AUDIBLE)
        if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
            sound = pick('modular_splurt/sound/voice/moan_f1.ogg', 'modular_splurt/sound/voice/moan_f2.ogg', 'modular_splurt/sound/voice/moan_f3.ogg', 'modular_splurt/sound/voice/moan_f4.ogg', 'modular_splurt/sound/voice/moan_f5.ogg', 'modular_splurt/sound/voice/moan_f6.ogg', 'modular_splurt/sound/voice/moan_f7.ogg')
        else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
            sound = pick('modular_splurt/sound/voice/moan_m1.ogg', 'modular_splurt/sound/voice/moan_m2.ogg', 'modular_splurt/sound/voice/moan_m3.ogg')
        playsound(user.loc, sound, 50, 1, 4, 1.2)
        return "makes a [pick("strong ", "weak ", "")]noise."
    if(user.mind && user.mind.miming && message_mime)
        . = message_mime
    if(isalienadult(user) && message_alien)
        . = message_alien
    else if(islarva(user) && message_larva)
        . = message_larva
    else if(iscyborg(user) && message_robot)
        . = message_robot
    else if(isAI(user) && message_AI)
        . = message_AI
    else if(ismonkey(user) && message_monkey)
        . = message_monkey
    else if(isanimal(user) && message_simple)
        . = message_simple

/datum/emote/proc/select_param(mob/user, params)
	return replacetext(message_param, "%t", params)

/datum/emote/proc/can_run_emote(mob/user, status_check = TRUE, intentional = FALSE)
	. = TRUE
	if(status_check && !is_type_in_typecache(user, mob_type_ignore_stat_typecache))
		if(user.stat > stat_allowed)
			if(!intentional)
				return FALSE
			switch(user.stat)
				if(SOFT_CRIT)
					to_chat(user, "<span class='notice'>Вы не можете использовать [key], когда находитесь в критическом состоянии.</span>")
					return FALSE
				if(UNCONSCIOUS)
					to_chat(user, "<span class='notice'>Вы не можете использовать [key], когда находитесь в бессознательном состоянии.</span>")
					return FALSE
				if(DEAD)
					to_chat(user, "<span class='notice'>Вы не можете использовать [key], будучи мёртвым.</span>")
					return FALSE
		var/mob/living/L = user
		if(restraint_check && (istype(L) && !CHECK_MOBILITY(L, MOBILITY_USE)))
			if(!intentional)
				return FALSE
			to_chat(user, "<span class='notice'>Вы не можете использовать [key], когда находитесь в состоянии оглушения.</span>")
			return FALSE
		if(restraint_check && user.restrained())
			if(!intentional)
				return FALSE
			to_chat(user, "<span class='notice'>Вы не можете использовать [key] в связанном состоянии.</span>")
			return FALSE

	if(mob_type_allowed_typecache) //empty list = anyone can use it unless specifically blacklisted
		if(!is_type_in_typecache(user, mob_type_allowed_typecache))
			return FALSE
	if(is_type_in_typecache(user, mob_type_blacklist_typecache))
		return FALSE

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_EMOTEMUTE))
			return FALSE

/datum/emote/sound
	var/sound //Sound to play when emote is called
	var/vary = FALSE	//used for the honk borg emote
	var/volume = 50
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/camera/aiEye)
	emote_cooldown = 1 SECONDS

/datum/emote/sound/run_emote(mob/user, params)
	. = ..()
	if(. && !(user?.is_muzzled() && !muzzle_ignore))
		playsound(user.loc, sound, volume, vary)

/**
* Allows the intrepid coder to send a basic emote
* Takes text as input, sends it out to those who need to know after some light parsing
* If you need something more complex, make it into a datum emote
* Arguments:
* * text - The text to send out
*
* Returns TRUE if it was able to run the emote, FALSE otherwise.
*/
/atom/proc/manual_emote(text)
	if(!text)
		CRASH("Someone passed nothing to manual_emote(), fix it")

	log_message(text, LOG_EMOTE)
	visible_message(text, visible_message_flags = EMOTE_MESSAGE)
	return TRUE

/mob/manual_emote(text)
	if (stat != CONSCIOUS)
		return FALSE
	. = ..()
	if (!.)
		return FALSE
	if (!client)
		return TRUE
	var/ghost_text = "<b>[src]</b> [text]"
	var/origin_turf = get_turf(src)
	for(var/mob/ghost as anything in GLOB.dead_mob_list)
		if(!ghost.client || isnewplayer(ghost))
			continue
		if(get_chat_toggles(ghost.client) & CHAT_GHOSTSIGHT && !(ghost in viewers(origin_turf, null)))
			ghost.show_message("[FOLLOW_LINK(ghost, src)] [ghost_text]")
	return TRUE
