/datum/interaction/lewd/bite
	description = "Искусать."
	interaction_sound = null
	require_user_mouth = TRUE
	require_target_hands = TRUE
	max_distance = 1
	write_log_user = "bite"
	write_log_target = "had their body bited by"
	extreme = TRUE

/datum/interaction/lewd/bite/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.a_intent == INTENT_HARM)
		user.is_fucking(partner, CUM_TARGET_HAND)
		partner.adjustBruteLoss(rand(8,16))
		message = "[pick("прижимается к <b>[partner]</b>, раскрывает рот и начинает кусаться.",
					"резко разрывает контакт своей челюсти с <b>[partner]</b>, тем самым образом отрывая кусок плоти.",
					"крепко прижимает <b>[partner]</b> к своему телу и одновременно с этим прижимается зубами.",
					"с силой закрепляется за <b>[partner]</b> своими ногтями и наносит укус за укусом.",
					"максимально грубым образом закусывает плоть <b>[partner]</b> до самой крови.")]"
	else
		partner.adjustBruteLoss(rand(3,6))
		message = "[pick("нежно прижимается к <b>[partner]</b>, раскрывает рот и начинает кусаться.",
					"медленно разрывает контакт своей челюсти с <b>[partner]</b>, тем самым образом открывая свежую рану.",
					"нежно прижимает <b>[partner]</b> к своему телу и одновременно с этим прижимается зубами.",
					"обхватывает <b>[partner]</b> своими коготками и выставляет свою челюсть прямо на плечо.",
					"аккуратно закусывает плотью <b>[partner]</b> и впоследствии оставляет кровоподтёк.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(75))
					C.bleed(50)
					C.add_splatter_floor(get_turf(BLOOD_COLOR_HUMAN), TRUE)

	if(prob(25 + partner.get_lust()))
		partner.visible_message("<span class='lewd'><b>\The [partner]</b> [pick("дрожит от боли.",
				"тихо вскрикивает.",
				"выдыхает болезненный стон.",
				"звучно вздыхает от боли.",
				"сильно вздрагивает.",
				"вздрагивает, закатывая свои глаза.")]</span>")

	user.visible_message(message = "<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	user.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, user)
