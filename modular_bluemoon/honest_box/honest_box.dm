/datum/martial_art/modern_boxing
	name = "Modern Boxing"
	id = MARTIALART_HONEST_BOXING
	pacifism_check = FALSE
	pugilist = TRUE

/datum/martial_art/modern_boxing/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)

	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)

	/* - наверное интереснее разрешить для ситуаций с боем чем-то помимо перчаток, например мылом
	if(D.resting && !A.resting) // лежачий лежачего бить может, раз не дают делать сверху-вниз по логике
		A.visible_message(span_warning("[A] пытается ударить [D] сверху-вниз, но руку замедлило!"),
						span_danger("Электронные перчатки не дают сделать вам удар сверху-вниз, посылая ток в руку! Лежачих в современном боксе не бьют!"), null, COMBAT_MESSAGE_RANGE)
		playsound(D.loc, A.dna.species.miss_sound, 25, 1, -1)
		return TRUE
	*/

	var/obj/item/clothing/gloves/boxing/modern/attacker_gloves = A.gloves

	if(D.gloves && istype(D.gloves, /obj/item/clothing/gloves/boxing/modern))
		var/obj/item/clothing/gloves/boxing/modern/victim_gloves = D.gloves
		var/atk_verb = pick("джеб","кросс","хук", "апперкот", "аперкот", "свинг", "оверхенд")

		D.visible_message(span_warning("<b>[A]</b> [pick("проводит", "выдаёт", "выносит", "заряжает", "отправляет", "заносит")] [atk_verb] [D]!"), \
			span_danger("<b>[A]</b> [pick("проводит", "выдаёт", "выносит", "заряжает", "отправляет", "заносит")] [atk_verb] [D]!"), null, COMBAT_MESSAGE_RANGE)

		attacker_gloves.hits_done++

		A.balloon_alert_to_viewers("[atk_verb]!", ignored_mobs = list(A, D)) // сообщение над персонажем при ударе. Самим бойцам не выдаётся, чтобы не сбивать концентрацию

		playsound(D.loc, A.dna.species.attack_sound, 25, 1, -1)
		log_combat(A, D, "punched (modern boxing) ")

		if(attacker_gloves.hits_done >= attacker_gloves.hits_needed)
			attacker_gloves.hits_done = 0
			victim_gloves.hits_done = 0
			to_chat(D, span_danger("Вас ударяет током, когда [A] наносит последний удар!"))
			playsound(D.loc, 'sound/machines/defib_success.ogg', 75, 1, -1)
			A.audible_message("<b>[attacker_gloves]</b> объявляет, \"\the [A] опрокидывает после [attacker_gloves.hits_needed] ударов!\"")
			D.forcesay(GLOB.hit_appends)
			D.AdjustParalyzed(6 SECONDS)
			log_combat(A, D, "knocked out (modern boxing) ")
			D.balloon_alert_to_viewers("НОКАУТ!")

	else
		A.visible_message(span_warning("[A] пытается ударить [D], но руку замедлило!"),
						span_danger("Электронные перчатки не дают сделать вам удар, посылая ток в руку! Без перчаток в современном боксе не дерутся!"), null, COMBAT_MESSAGE_RANGE)
		playsound(D.loc, A.dna.species.miss_sound, 25, 1, -1)
		return TRUE
	return TRUE

/datum/martial_art/modern_boxing/teach(mob/living/carbon/human/H, make_temporary = TRUE)
	. = ..()
	if(.)
		if(H.pulling && ismob(H.pulling))
			H.stop_pulling()

/obj/item/clothing/gloves/boxing/modern
	name = "modern boxing gloves"
	desc = "A pair of modern electronic fighting gloves. They do count the amount of times you strike and send a signal to the opponent's boxing gloves, \
	as a sign of round end. Usually used in modern box matches to remove any strength advantages, leaving only technique. \
	Some people find it less entertaining due lack of primal randomness."
	icon = 'modular_bluemoon/honest_box/modern_boxing_gloves.dmi'
	icon_state = "modern_boxing_gloves_red"
	style = new /datum/martial_art/modern_boxing
	var/hits_done = 0
	var/hits_needed = 13
	unique_reskin = list(
		"Blue" = list(
			RESKIN_ICON_STATE = "modern_boxing_gloves_blue",
			RESKIN_ITEM_STATE = "boxingblue"
		),
		"Yellow" = list(
			RESKIN_ICON_STATE = "modern_boxing_gloves_yellow",
			RESKIN_ITEM_STATE = "boxingyellow"
		),
		"Green" = list(
			RESKIN_ICON_STATE = "modern_boxing_gloves_green",
			RESKIN_ITEM_STATE = "boxinggreen"
		)
	)

/obj/item/clothing/gloves/boxing/modern/examine(mob/user)
	. = ..()
	. += span_info("<u>Ударов требуется для нокаута: <b>[hits_needed]</b></u>.")
	. += span_info("Можно изменить визуальный стиль перчаток по нажатию на переключатель <b>(Alt+Click)</b>.")
	. += span_info("Можно изменить количество требуемых ударов перчаток по нажатию на счетчик <b>(Ctrl+Shift+Click)</b>.")

/obj/item/clothing/gloves/boxing/modern/CtrlShiftClick(mob/living/carbon/human/user as mob)
	var/new_hits_count = tgui_input_number(user, "Задайте необходимое количество ударов для падения оппонента:\n(5-100)", "Modern Boxing Gloves Conter", null, 100, 5)
	if(new_hits_count)
		hits_needed = new_hits_count
		to_chat(user, span_notice("Количество ударов выставлено на [new_hits_count]."))
		balloon_alert(user, "[hits_needed]")
