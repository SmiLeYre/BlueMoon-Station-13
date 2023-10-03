/datum/interaction/lewd/kiss
	description = "Рот. Поцеловать."
	require_user_mouth = TRUE
	require_target_mouth = TRUE
	write_log_user = "kissed"
	write_log_target = "was kissed by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/kiss/post_interaction(mob/living/user, mob/living/partner)
	. = ..()
	if(user.get_lust() < 100)
		user.add_lust(12)
	if(partner.get_lust() < 100)
		partner.add_lust(12)

/datum/interaction/lewd/kiss/display_interaction(mob/living/user, mob/living/partner)
	if(user.get_lust() >= 25)
		user.visible_message("<span class='lewd'>\The <b>[user]</b> дарит интенсивный и весьма агрессивный поцелуй для \the <b>[partner]</b>.</span>")
	else
		user.visible_message("<span class='lewd'>\The <b>[user]</b> прижимается к губкам \the <b>[partner]</b>.</span>")
