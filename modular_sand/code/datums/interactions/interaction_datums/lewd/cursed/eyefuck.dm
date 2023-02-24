/datum/interaction/lewd/eyefuck
	description = "Убийственно. Изнасиловать в глаз."
	interaction_sound = null
	require_user_penis = REQUIRE_EXPOSED
	require_target_eyes = REQUIRE_EXPOSED
	max_distance = 1
	write_log_user = "eyefucked"
	write_log_target = "had their eye fucked by"
	extreme = TRUE

/datum/interaction/lewd/eyefuck/eyesocketfuck
	description = "Убийственно. Изнасиловать в глазницу."
	require_target_eyes = null
	require_target_eyesockets = REQUIRE_EXPOSED
	write_log_user = "eyesocketfucked"
	write_log_target = "had their eyesocket fucked by"

/datum/interaction/lewd/eyefuck/display_interaction(mob/living/user, mob/living/partner)
	var/message
	//var/u_His = user.ru_ego()
	//var/genital_name = user.get_penetrating_genital_name()

	if(user.is_fucking(partner, CUM_TARGET_EYES))
		message = "[pick(
			"крепко обхватывает голову \the <b>[partner]</b> и начинает долбиться в глаз.",
			"яростно долбится в череп \the <b>[partner]</b> и довольно стонет.",
			"раз за разом толкается в образованную дыру в глазу \the <b>[partner]</b>.",
			"заходит своим влажным органом по самые яйца в череп \the <b>[partner]</b> снова и снова.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(15))
					C.bleed(5)
					C.add_splatter_floor(get_turf(BLOOD_COLOR_HUMAN), TRUE)
					new/obj/effect/decal/cleanable/blood
				if(prob(25))
					C.adjustOrganLoss(ORGAN_SLOT_EYES, rand(10,20))
					C.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(7,15))
					partner.adjustBruteLoss(rand(6,12))
	else
		message = "с силой загоняет свой орган глубоко в глаз \the <b>[partner]</b> и громко вздыхает."
		user.set_is_fucking(partner, CUM_TARGET_EYES, user.getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/champ1.ogg',
												'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting(TRUE))
	if(user.can_penetrating_genital_cum())
		user.handle_post_sex(NORMAL_LUST, CUM_TARGET_EYES, partner)
	partner.handle_post_sex(LOW_LUST, null, user)
