/datum/interaction/cuddle
	description = "Обнимашки!"
	simple_message = "USER обнимает TARGET."
	simple_style = "lewd"
	interaction_flags = INTERACTION_FLAG_ADJACENT
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

	p13user_emote = PLUG13_EMOTE_BASIC
	p13user_strength = PLUG13_STRENGTH_LOW_PLUS
	p13user_duration = PLUG13_DURATION_SHORT
	p13target_emote = PLUG13_EMOTE_BASIC
	p13target_strength = PLUG13_STRENGTH_LOW_PLUS
	p13target_duration = PLUG13_DURATION_SHORT

/datum/interaction/cuddle/display_interaction(mob/living/user, mob/living/target)
	var/static/list/possible_messages = list(
		"<b>USER</b> обнимает <b>TARGET</b>.",
		"<b>USER</b> страстно обнимает <b>TARGET</b>.",
		"<b>USER</b> нежно обнимает <b>TARGET</b>.",
		"<b>USER</b> бережно обнимает <b>TARGET</b>.",
		"<b>USER</b> тыкается носом в <b>TARGET</b>.",
		"<b>USER</b> нежно тыкается носиком в <b>TARGET</b>.",
		"<b>USER</b> бережно тыкается носиком в <b>TARGET</b>.",
		"<b>USER</b> тискает <b>TARGET</b>.",
		"<b>USER</b> хватает <b>TARGET</b> в свои нежные объятия.",
		"<b>USER</b> нежно тискается с <b>TARGET</b>.",
		"<b>USER</b> бережно тискается с <b>TARGET</b>.",
	)
	var/use_message = replacetext(pick(possible_messages), "USER", "\the [user]")
	use_message = replacetext(use_message, "TARGET", "\the [target]")
	user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")
	if(!HAS_TRAIT(user, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(user.loc)
	if(!HAS_TRAIT(target, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(target.loc)
