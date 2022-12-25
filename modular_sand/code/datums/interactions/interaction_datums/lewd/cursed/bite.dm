/datum/interaction/lewd/bite
	description = "Искусать."
	interaction_sound = null
	require_user_hands = TRUE
	max_distance = 1
	write_log_user = "bite"
	write_log_target = "had their body bited by"
	extreme = TRUE

/datum/interaction/lewd/bite/display_interaction(mob/living/user)
	var/message

	if(user.a_intent == INTENT_HARM(user.is_fucking(partner, CUM_TARGET_HAND)))
		message = "[pick("прижимается к <b>[target]</b>, раскрывает рот и начинает кусаться.",
					"резко разрывает контакт своей челюсти с <b>[target]</b>, тем самым образом отрывая кусок плоти.",
					"крепко прижимает <b>[target]</b> к своему телу и одновременно с этим прижимается зубами.",
					"с силой закрепляется в <b>[target]</b> коготками и наносит укус за укусом.",
					"максимально грубым образом закусывает плоть <b>[target]</b> до самой крови.")]"
	else
		message = "[pick("нежно прижимается к <b>[target]</b>, раскрывает пасть и начинает кусаться.",
					"медленно разрывает контакт своей челюсти с <b>[target]</b>, тем самым образом открывая свежую рану.",
					"нежно прижимает <b>[target]</b> к своему телу и одновременно с этим прижимается зубами.",
					"обхватывает <b>[target]</b> своими коготками и выставляет свою челюсть прямо на плечо.",
					"аккуратно закусывает плотью <b>[target]</b> и впоследствии оставляет кровоподтёк.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(15))
					C.bleed(2)
				if(partner.a_intent == INTENT_HARM)
					partner.adjustBruteLoss(rand(10,15))
				else
					partner.adjustBruteLoss(rand(3,6))

	if(prob(5 + user.get_lust()))
		user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("дрожит от боли.",
				"тихо вскрикивает.",
				"выдыхает болезненный стон.",
				"звучно вздыхает от боли.",
				"сильно вздрагивает.",
				"вздрагивает, закатывая свои глаза.")]</span>")

	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
