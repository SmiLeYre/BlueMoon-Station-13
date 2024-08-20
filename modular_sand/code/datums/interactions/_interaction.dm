/**
	# Interactions code by HONKERTRON feat TestUnit
- Contains a lot ammount of ERP and MEHANOYEBLYA
- CREDIT TO ATMTA STATION FOR MOST OF THIS CODE, I ONLY MADE IT WORK IN /vg/ - Matt
- Rewritten 30/08/16 by Zuhayr, sry if I removed anything important.
- I removed ERP and replaced it with handholding. Nothing of worth was lost. - Vic
- Fuck you, Vic. ERP is back. - TT
- >using var/ on everything, also TRUE
- "TGUIzes" the panel because yes - SandPoot
- Makes all the code good because yes as well - SandPoot
**/

/mob/proc/list_interaction_attributes()
	return list()

/mob/living/list_interaction_attributes()
	. = ..()
	if(has_hands())
		. += "...обладает руками."
	if(has_mouth())
		. += "...обладает [mouth_is_free() ? "неприкрытым" : "прикрытым"] ртом."

/// The base of all interactions
/datum/interaction
	var/description
	var/simple_message
	var/simple_style = "notice"
	var/write_log_user
	var/write_log_target

	var/interaction_sound

	var/max_distance = 1

	var/interaction_flags = INTERACTION_FLAG_ADJACENT

	var/required_from_user = NONE
	var/required_from_user_exposed = NONE
	var/required_from_user_unexposed = NONE

	var/required_from_target = NONE
	var/required_from_target_exposed = NONE
	var/required_from_target_unexposed = NONE

	/// Refuses to accept more than one entry for some reason, fix sometime
	var/list/additional_details

/// Checks if user can do an interaction, action_check is for whether you're actually doing it or not (useful for the menu and not removing the buttons)
/datum/interaction/proc/evaluate_user(mob/living/user, silent = TRUE, action_check = TRUE)
	if(SSinteractions.is_blacklisted(user))
		return FALSE

	if(required_from_user & INTERACTION_REQUIRE_MOUTH)
		if(!user.has_mouth())
			if(!silent)
				to_chat(user, "<span class='warning'>У вас нет рта.</span>")
			return FALSE

		if(!user.mouth_is_free())
			if(!silent)
				to_chat(user, "<span class='warning'>Ваш рот прикрыт.</span>")
			return FALSE

	if(required_from_user & INTERACTION_REQUIRE_HANDS)
		if(!user.has_hands())
			if(!silent)
				to_chat(user, span_warning("У вас нет рук."))
			return FALSE

	if(COOLDOWN_FINISHED(user, last_interaction_time))
		return TRUE

	if(action_check)
		return FALSE
	else
		return TRUE

/// Same as evaluate_user, but for target
/datum/interaction/proc/evaluate_target(mob/living/user, mob/living/target, silent = TRUE)
	if(SSinteractions.is_blacklisted(target))
		return FALSE

	if(!(interaction_flags & INTERACTION_FLAG_USER_IS_TARGET))
		if(user == target)
			if(!silent)
				to_chat(user, span_warning("Ты не можешь так поступить с собой."))
			return FALSE

	if(required_from_target & INTERACTION_REQUIRE_MOUTH)
		if(!target.has_mouth())
			if(!silent)
				to_chat(user, span_warning("Цель не имеет рта."))
			return FALSE

		if(!target.mouth_is_free())
			if(!silent)
				to_chat(user, span_warning("Рот цели прикрыт."))
			return FALSE

	if(required_from_target & INTERACTION_REQUIRE_HANDS)
		if(!target.has_hands())
			if(!silent)
				to_chat(user, span_warning("Цель не имеет рук."))
			return FALSE

	return TRUE

/// Actually doing the action, has a few checks to see if it's valid, usually overwritten to be make things actually happen and what-not
/datum/interaction/proc/do_action(mob/living/user, mob/living/target)
	if(!(interaction_flags & INTERACTION_FLAG_USER_IS_TARGET))
		if(user == target) //tactical href fix
			to_chat(user, "<span class='warning'>Вы не можете нацелиться на себя.</span>")
			return
	if(get_dist(user, target) > max_distance)
		to_chat(user, "<span class='warning'>Слишком далеко.</span>")
		return
	if(interaction_flags & INTERACTION_FLAG_ADJACENT && !(user.Adjacent(target) && target.Adjacent(user)))
		to_chat(user, span_warning("Вы не можете добраться до своей цели."))
		return
	if(!evaluate_user(user, silent = FALSE))
		return
	if(!evaluate_target(user, target, silent = FALSE))
		return

	// BLUEMOON ADD START - специальные проверки от БМ
	if(!special_check(user, target))
		return
	// BLUEMOON ADD END

	if(write_log_user)
		user.log_message("[write_log_user] [target]", LOG_ATTACK)
	if(write_log_target)
		target.log_message("[write_log_target] [user]", LOG_VICTIM, log_globally = FALSE)

	display_interaction(user, target)
	post_interaction(user, target)

/// Display the message
/datum/interaction/proc/display_interaction(mob/living/user, mob/living/target)
	if(simple_message)
		var/use_message = replacetext(simple_message, "USER", "\the [user]")
		use_message = replacetext(use_message, "TARGET", "\the [target]")
		user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")

/// After the interaction, the base only plays the sound and only if it has one
/datum/interaction/proc/post_interaction(mob/living/user, mob/living/target)
	COOLDOWN_START(user, last_interaction_time, 0.55 SECONDS)
	if(interaction_sound)
		var/soundfile_to_play

		// pickweight so you can make a certain sound play
		// more times. This does NOT mean you are forced to
		// use the system. If you do not make the list
		// associative, all options will have the same chances!
		if(islist(interaction_sound))
			soundfile_to_play = pickweight(interaction_sound)
		else
			soundfile_to_play = interaction_sound
		playsound(get_turf(user), soundfile_to_play, 50, 1, -1)
	return
