/datum/interaction/lewd/titgrope_self
	description = "Грудь. Сжать свои соски."
	require_user_hands = TRUE
	require_user_breasts = REQUIRE_ANY
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "groped own breasts"
	write_log_target = null

	additional_details = list(
		list(
			"info" = "You can fill a container if you hold it in your hand or pull it",
			"icon" = "flask",
			"color" = "transparent"
			)
	)

/datum/interaction/lewd/titgrope_self/display_interaction(mob/living/user)
	var/message

	var/obj/item/reagent_containers/liquid_container

	var/obj/item/cached_item = user.get_active_held_item()
	if(istype(cached_item, /obj/item/reagent_containers))
		liquid_container = cached_item
	else
		cached_item = user.pulling
		if(istype(cached_item, /obj/item/reagent_containers))
			liquid_container = cached_item

	if(user.a_intent == INTENT_HARM)
		message = pick("с силой сжимает свои собственные сиськи",
					"резко хватается за свои сиськи",
					"крепко сжимает свою грудь",
					"шлёпает по своим сиськам",
					"максимально грубо сжимает свои титьки")
	else
		message = pick("нежно ощупывает свою грудь",
					"мягко хватается за свою грудь",
					"сжимает собственную грудь",
					"проводит несколькими пальцами вдоль своей груди",
					"деликатно сжимает свой сосок",
					"возбуждённо проводит пальцем вдоль своей груди")
	if(prob(5 + user.get_lust()))
		user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("дрожит от возбуждения",
				"тихо стонет",
				"выдыхает тихий довольный стон",
				"мурлыкает и звучно вздыхает",
				"тихонько вздрагивает",
				"вздрагивает, хватаясь за причинное место")]</span>")

	if(liquid_container)
		message += " прямо в [liquid_container]"

		var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
		var/milktype = milkers?.fluid_id
		if(milkers.climaxable(user, TRUE))

			if(milkers && milktype)
				var/modifier
				switch(milkers.size)
					if(3 to 5)
						modifier = 2
					if(6 to 8)
						modifier = 3
					else
						if(milkers.size_to_state() in GLOB.breast_values)
							modifier = clamp(GLOB.breast_values[milkers.size_to_state()] - 5, 0, INFINITY)
						else
							modifier = 1
				liquid_container.reagents.add_reagent(milktype, rand(1,3 * modifier))
				playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
		else
			message += ", но дойка не дает результатов..."

	user.visible_message(message = span_lewd("<b>\The [user]</b> [message]."), ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(LOW_LUST, null, user, ORGAN_SLOT_BREASTS) //SPLURT edit

/datum/interaction/lewd/self_nipsuck
	description = "Грудь. Пососать свои соски."
	require_user_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	user_is_target = TRUE
	interaction_sound = null
	max_distance = 0
	write_log_user = "sucked their own nips"
	write_log_target = null

/datum/interaction/lewd/self_nipsuck/display_interaction(mob/living/user, mob/living/target)
	var/message
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return

	if(milkers.climaxable(user, TRUE))
		var/datum/reagent/milk = find_reagent_object_from_type(milktype)

		var/milktext = milk.name

		lines = list(
			"подносит соски своих собственных ёмкостей для молока ко рту и глубоко всасывает их",
			"делает большой глоток свежего <b>'[lowertext(milktext)]'</b> и громко выдыхает после такого",
			"хватается губами за свой сосок и полностью заполняет свою ротовую полость <b>'[lowertext(milktext)]'</b>"
		)
		switch(milkers.size)
			if("c", "d", "e")
				modifier = 2
			if("f", "g", "h")
				modifier = 3
			else
				if(milkers.size in GLOB.breast_values)
					modifier = clamp(GLOB.breast_values[milkers.size] - 5, 0, INFINITY)
				else
					modifier = 1
		user.reagents.add_reagent(milktype, rand(1,3 * modifier) * user.get_fluid_mod(milkers)) //SPLURT edit
	else
		lines = list(
			"подносит соски своих собственных ёмкостей для молока ко рту и глубоко всасывает их",
			"подносит свои груди ко рту и громко обсасывает соски"
		)
	message = "<span class='lewd'>\The <b>[user]</b> [pick(lines)]</span>"
	user.visible_message(message, ignored_mobs = user.get_unconsenting())
	user.handle_post_sex(LOW_LUST, null, user, ORGAN_SLOT_BREASTS)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
