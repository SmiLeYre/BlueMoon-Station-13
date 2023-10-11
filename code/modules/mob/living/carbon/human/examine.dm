/mob/living/carbon/human/examine(mob/user)
//this is very slightly better than it was because you can use it more places. still can't do \his[src] though.
	var/t_on 	= ru_who(TRUE)
	var/t_ego 	= ru_ego()
	var/t_a 	= ru_a()

	var/obscure_name
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	var/vampDesc = ReturnVampExamine(user) // Vamps recognize the names of other vamps.
	var/vassDesc = ReturnVassalExamine(user) // Vassals recognize each other's marks.
	if (vampDesc != "") // If we don't do it this way, we add a blank space to the string...something to do with this -->  . += ""
		. += vampDesc
	if (vassDesc != "")
		. += vassDesc

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_PROSOPAGNOSIA) || HAS_TRAIT(L, TRAIT_INVISIBLE_MAN))
			obscure_name = TRUE
	. = list("<span class='info'>Это - <EM>[!obscure_name ? name : "Неизвестный"]</EM>!")
	if(skipface || get_visible_name() == "Unknown")
		. += "Вы не можете разобрать, к какому виду относится находящееся перед вами существо."
	else
		. += "[ru_ego(TRUE)] раса - <EM>[spec_trait_examine_font()][dna.custom_species ? dna.custom_species : dna.species.name]</EM></font>!"
	if(user?.stat == CONSCIOUS && ishuman(user))
		user.visible_message(span_small("<b>[user]</b> смотрит на <b>[!obscure_name ? name : "Неизвестного"]</b>.") , span_small("Смотрю на <b>[!obscure_name ? name : "Неизвестного"]</b>.") , null, COMBAT_MESSAGE_RANGE)
	var/list/obscured = check_obscured_slots()

	//Underwear
	var/shirt_hidden = undershirt_hidden()
	var/undies_hidden = underwear_hidden()
	var/socks_hidden = socks_hidden()
	if(w_underwear && !undies_hidden)
		. += "[t_on] одет[t_a] в [w_underwear.get_examine_string(user)]."
	if(w_socks && !socks_hidden)
		. += "[t_on] одет[t_a] в [w_socks.get_examine_string(user)]."
	if(w_shirt && !shirt_hidden)
		. += "[t_on] одет[t_a] в [w_shirt.get_examine_string(user)]."
	//Wrist slot because you're epic
	if(wrists && !(ITEM_SLOT_WRISTS in obscured))
		. += "[t_on] одет[t_a] в [wrists.get_examine_string(user)]."
	//End of skyrat changes

	//uniform
	if(w_uniform && !(ITEM_SLOT_ICLOTHING in obscured))
		//accessory
		var/accessory_msg
		if(istype(w_uniform, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(length(U.attached_accessories) && !(U.flags_inv & HIDEACCESSORY))
				var/list/weehoo = list()
				var/dumb_icons = ""
				for(var/obj/item/clothing/accessory/attached_accessory in U.attached_accessories)
					if(!(attached_accessory.flags_inv & HIDEACCESSORY))
						weehoo += "\a [attached_accessory]"
						dumb_icons = "[dumb_icons][icon2html(attached_accessory, user)]"
				if(length(weehoo))
					accessory_msg += " с [dumb_icons]"
					if(length(U.attached_accessories) >= 2)
						accessory_msg += jointext(weehoo, ", ", 1, length(weehoo) - 1)
						accessory_msg += " и [weehoo[length(weehoo)]]"
					else
						accessory_msg += weehoo[1]
			. += "[t_on] одет[t_a] в [w_uniform.get_examine_string(user)][accessory_msg]."

	//head
	if(head && !(head.obj_flags & EXAMINE_SKIP))
		. += "[t_on] одет[t_a] в [head.get_examine_string(user)]."

	//suit/armor
	if(wear_suit && !(wear_suit.item_flags & EXAMINE_SKIP))
		//suit/armor storage
		var/suit_thing
		if(s_store && !(ITEM_SLOT_SUITSTORE in obscured))
			suit_thing += " и к нему прикреплён [s_store.get_examine_string(user)]"
		. += "[t_on] одет[t_a] в [wear_suit.get_examine_string(user)][suit_thing]."

	//back
	if(back && !(back.item_flags & EXAMINE_SKIP))
		. += "[t_on] держит на своей спине [back.get_examine_string(user)]."

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "В [get_held_index_name(get_held_index_of_item(I))] он[t_a] держит [I.get_examine_string(user)]."

	//gloves
	if(gloves && !(ITEM_SLOT_GLOVES in obscured))
		. += "[t_on] одет[t_a] в [gloves.get_examine_string(user)]."
	else if(length(blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			. += "<span class='warning'>[ru_ego(TRUE)] рук[hand_number > 1 ? "и" : "а"] в крови!</span>"

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/restraints/handcuffs/cable))
			. += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] связан[t_a]!</span>"
		else
			. += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] в наручниках!</span>"

	//mask
	if(wear_mask && !(ITEM_SLOT_MASK in obscured))
		. += "[t_on] носит [wear_mask.get_examine_string(user)]."

	if(wear_neck && !(ITEM_SLOT_NECK in obscured))
		. += "[t_on] носит на своей шее [wear_neck.get_examine_string(user)]."

	//belt
	if(belt && !(belt.item_flags & EXAMINE_SKIP))
		. += "[t_on] носит на своём поясе [belt.get_examine_string(user)]."

	//shoes
	if(shoes && !(ITEM_SLOT_FEET in obscured))
		. += "[t_on] одет[t_a] в [shoes.get_examine_string(user)]."

	//eyes
	if(!(ITEM_SLOT_EYES in obscured))
		if(glasses)
			. += "[t_on] носит [glasses.get_examine_string(user)]."
		else if((left_eye_color == BLOODCULT_EYE || right_eye_color == BLOODCULT_EYE) && iscultist(src) && HAS_TRAIT(src, TRAIT_CULT_EYES))
			. += "<span class='warning'><B>[ru_ego(TRUE)] глаза ярко-красные и они горят!</B></span>"
		else if(HAS_TRAIT(src, TRAIT_HIJACKER))
			var/obj/item/implant/hijack/H = user.getImplant(/obj/item/implant/hijack)
			if (H && !H.stealthmode && H.toggled)
				. += "<b><font color=orange>[ru_ego(TRUE)] глаза ярко-жёлтые и они горят!!</font></b>"

	//ears
	if(ears && !(ITEM_SLOT_EARS_LEFT in obscured))
		. += "[t_on] носит на своих ушах [ears.get_examine_string(user)]."
	if(ears_extra && !(ITEM_SLOT_EARS_RIGHT in obscured))
		. += "[t_on] носит на своих ушах [ears_extra.get_examine_string(user)]."
	//wearing two ear items makes you look like an idiot
	if((istype(ears, /obj/item/radio/headset) && !(ITEM_SLOT_EARS_LEFT in obscured)) && (istype(ears_extra, /obj/item/radio/headset) && !(ITEM_SLOT_EARS_RIGHT in obscured)))
		. += "<span class='warning'>[t_on] выглядит очень глупо ввиду того, что на [t_ego] голове находятся \an [ears.name] и \an [ears_extra.name] одновременно.</span>"

	//ID
	if(wear_id && !(wear_id.item_flags & EXAMINE_SKIP))
		. += "[t_on] носит [wear_id.get_examine_string(user)] на своей шее."
	. += "<hr>"
	//Status effects
	var/list/status_examines = status_effect_examines()
	if (length(status_examines))
		. += status_examines
	//Approximate character height based on current sprite scale
	var/dispSize = round(12*get_size(src)) // gets the character's sprite size percent and converts it to the nearest half foot
	if(dispSize % 2) // returns 1 or 0. 1 meaning the height is not exact and the code below will execute, 0 meaning the height is exact and the else will trigger.
		dispSize = dispSize - 1 //makes it even
		dispSize = dispSize / 2 //rounds it out
		. += "[t_on], кажется, чуть выше или около [dispSize] футов в высоту."
	else
		dispSize = dispSize / 2
		. += "[t_on], кажется, около [dispSize] футов в высоту."
	if(has_status_effect(/datum/status_effect/pregnancy))
		. += "<b>[t_on] имеет выступающую часть на уровне живота. Кажется, это беременность.\n</b>"
	//CIT CHANGES START HERE - adds genital details to examine text
	if(LAZYLEN(internal_organs) && (user.client?.prefs.cit_toggles & GENITAL_EXAMINE))
		for(var/obj/item/organ/genital/dicc in internal_organs)
			if(istype(dicc) && dicc.is_exposed())
				. += "[dicc.desc]"
				if((src == user || HAS_TRAIT(user, TRAIT_GFLUID_DETECT)) && ((dicc?.genital_flags & GENITAL_FUID_PRODUCTION) || ((dicc?.linked_organ?.genital_flags & GENITAL_FUID_PRODUCTION) && !dicc?.linked_organ?.is_exposed())))
					var/datum/reagent/cummies = find_reagent_object_from_type(dicc?.get_fluid_id())
					. += "Вы чувствуете, как от [t_ego] тела пахнет <b>'<span style='color:[cummies.color]';>[cummies.name]</span>'</b>..."
	if(user.client?.prefs.cit_toggles & VORE_EXAMINE)
		var/cursed_stuff = attempt_vr(src,"examine_bellies",args) //vore Code
		if(cursed_stuff)
			. += cursed_stuff
	//END OF CIT CHANGES
	//Jitters
	switch(jitteriness)
		if(300 to INFINITY)
			. += "<span class='warning'><B>[t_on] бьётся в судорогах!</B></span>\n"
		if(200 to 300)
			. += "<span class='warning'>[t_on] нервно дёргается.</span>\n"
		if(100 to 200)
			. += "<span class='warning'>[t_on] дрожит.</span>\n"
	var/appears_dead = FALSE
	var/just_sleeping = FALSE
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = TRUE
		if(isliving(user) && HAS_TRAIT(user, TRAIT_NAIVE))
			just_sleeping = TRUE
		if(!just_sleeping)
			if(suiciding)
				. += "<span class='warning'>[t_on] выглядит как суицидник... [t_ego] уже невозможно спасти.</span>\n"
			if(hellbound)
				. += span_warning("[ru_ego(TRUE)] душа выглядит вырванной из [t_ego] тела. Воскрешение невозможно.")
			else
				. += "<span class='deadsay'>[t_on] ни на что не реагирует; нет никаких признаков жизни...</span>"

	if(get_bodypart(BODY_ZONE_HEAD) && !getorgan(/obj/item/organ/brain))
		. += "<span class='deadsay'>Похоже, что у н[t_ego] нет мозга...</span>\n"

	var/list/msg = list()

	if(client && client.prefs)
		if(client.prefs.toggles & VERB_CONSENT)
			. += "<b>Игрок разрешил непристойные действия по отношению к его персонажу.</b>"
		else
			. += "<b>Игрок НЕ разрешил непристойные действия по отношению к его персонажу.</b>"

	//SPLURT edit
	if((user.client?.prefs.cit_toggles & GENITAL_EXAMINE))
		for(var/obj/item/organ/genital/G in internal_organs)
			if(CHECK_BITFIELD(G.genital_flags, GENITAL_CHASTENED) && G.is_exposed())
				. += "[t_on] носит БДСМ-клетку. БДСМ-клетка покрывает [G.name]."
	//
	var/list/missing = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/list/disabled = list()
	var/list/writing = list()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.disabled)
			disabled += BP
		if(BP.writtentext)
			writing += BP
		missing -= BP.body_zone
		for(var/obj/item/I in BP.embedded_objects)
			if(I.isEmbedHarmless())
				msg += "<B>Из [t_ego] [BP.name] торчит [icon2html(I, user)] [I]!</B>\n"
			else
				msg += "<B>У н[t_ego] застрял [icon2html(I, user)] [I] в [BP.name]!</B>\n"
		for(var/i in BP.wounds)
			var/datum/wound/iter_wound = i
			msg += "[iter_wound.get_examine_description(user)]\n"

	for(var/X in disabled)
		var/obj/item/bodypart/body_part = X
		var/damage_text
		if(HAS_TRAIT(body_part, TRAIT_DISABLED_BY_WOUND))
			continue // skip if it's disabled by a wound (cuz we'll be able to see the bone sticking out!)
		if(!(body_part.get_damage(include_stamina = FALSE) >= body_part.max_damage)) //we don't care if it's stamcritted
			damage_text = "выглядит обвисшей и бледноватой"
		else
			damage_text = (body_part.brute_dam >= body_part.burn_dam) ? body_part.heavy_brute_msg : body_part.heavy_burn_msg
		msg += "<B>[ru_ego(TRUE)] [body_part.ru_name] [damage_text]!</B>\n"

	var/obj/item/organ/vocal_cords/Vc = user.getorganslot(ORGAN_SLOT_VOICE)
	if(Vc)
		if(istype(Vc, /obj/item/organ/vocal_cords/velvet))
			if(client?.prefs.cit_toggles & HYPNO)
				msg += "<span class='velvet'><i>Вы чувствуете, как резонируют ваши голосовые связки при взгляде на н[t_ego].</i></span>\n"

	//stores missing limbs
	var/l_limbs_missing = 0
	var/r_limbs_missing = 0
	for(var/t in missing)
		if(t==BODY_ZONE_HEAD)
			msg += "<span class='deadsay'><B>[ru_ego(TRUE)] [ru_exam_parse_zone(parse_zone(t))] отсутствует!</B></span>\n"
			continue
		if(t == BODY_ZONE_L_ARM || t == BODY_ZONE_L_LEG)
			l_limbs_missing++
		else if(t == BODY_ZONE_R_ARM || t == BODY_ZONE_R_LEG)
			r_limbs_missing++

		msg += "<span class='warning'><B>[ru_ego(TRUE)] [ru_exam_parse_zone(parse_zone(t))] отсутствует!</B></span>\n"

	if(l_limbs_missing >= 2 && r_limbs_missing == 0)
		msg += "[t_on] стоит на правой ножке.\n"
	else if(l_limbs_missing == 0 && r_limbs_missing >= 2)
		msg += "[t_on] стоит на левой ножке.\n"
	else if(l_limbs_missing >= 2 && r_limbs_missing >= 2)
		msg += "[t_on] выглядит как котлетка.\n"

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		var/temp
		if(user == src && src.hal_screwyhud == SCREWYHUD_CRIT)//fake damage
			temp = 50
		else
			temp = getBruteLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] имеет незначительные ушибы.\n"
			else if(temp < 50)
				msg += "[t_on] <b>тяжело</b> ранен[t_a]!\n"
			else
				msg += "<B>[t_on] смертельно ранен[t_a]!</B>\n"

		temp = getFireLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] немного подгорел[t_a].\n"
			else if (temp < 50)
				msg += "[t_on] имеет <b>серьёзные</b> ожоги!\n"
			else
				msg += "<B>[t_on] имеет смертельные ожоги!</B>\n"

		temp = getCloneLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] имеет незначительные подтёки на теле.\n"
			else if(temp < 50)
				msg += "[t_on] имеет <b>обвисшую</b> кожу на большей части тела!\n"
			else
				msg += "<b>[t_on] имеет тело состоящее из кусков свисающей плоти!</b>\n"


	if(fire_stacks > 0)
		msg += "[t_on] в чем-то горючем.\n"
	if(fire_stacks < 0)
		msg += "[t_on] выглядит мокро.\n"


	if(pulledby?.grab_state)
		msg += "[t_on] удерживается в захвате <b>[pulledby]</b>.\n"

	if(nutrition < NUTRITION_LEVEL_STARVING - 50)
		msg += "[t_on] выглядит смертельно истощённо.\n"
	else if(nutrition >= NUTRITION_LEVEL_FAT)
		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
			msg += "[t_on] выглядит довольно толстенько, словно какой-то поросёнок. Очень вкусный поросёнок.\n"
		else
			msg += "[t_on] выглядит довольно плотно.\n"
	switch(disgust)
		if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
			msg += "[t_on] выглядит немного неприятно.\n"
		if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
			msg += "[t_on] выглядит очень неприятно.\n"
		if(DISGUST_LEVEL_DISGUSTED to INFINITY)
			msg += "[t_on] выглядит отвратительно.\n"

	if(!HAS_TRAIT(src, TRAIT_ROBOTIC_ORGANISM))
		var/apparent_blood_volume = blood_volume
		if(dna.species.use_skintones && skin_tone == "albino")
			apparent_blood_volume -= 150 // enough to knock you down one tier
		switch(apparent_blood_volume)
			if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
				msg += "[ru_ego(TRUE)] кожа бледная.\n"
			if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
				msg += "<b>Выглядит ужасно бледно.</b>\n"
			if(-INFINITY to BLOOD_VOLUME_BAD)
				msg += "<span class='deadsay'><b>[t_on] напоминает раздавленный пакет от сока из-за абсолютно бледного цвета кожи.</b></span>\n"

	if(is_bleeding())
		var/list/obj/item/bodypart/bleeding_limbs = list()
		var/list/obj/item/bodypart/grasped_limbs = list()

		for(var/i in bodyparts)
			var/obj/item/bodypart/BP = i
			if(BP.get_bleed_rate())
				bleeding_limbs += BP

		var/num_bleeds = LAZYLEN(bleeding_limbs)

		var/list/bleed_text
		if(appears_dead)
			bleed_text = list("<span class='deadsay'><B>Кровь брызгает струйками из [ru_ego(FALSE)] конечности -")
		else
			bleed_text = list("<B>У н[ru_ego(FALSE)] кровотечение в области")

		switch(num_bleeds)
			if(1 to 2)
				bleed_text += " [ru_otkuda_zone(bleeding_limbs[1].ru_name)][num_bleeds == 2 ? " и [ru_otkuda_zone(bleeding_limbs[2].ru_name)]" : ""]"
			if(3 to INFINITY)
				for(var/i in 1 to (num_bleeds - 1))
					var/obj/item/bodypart/body_part = bleeding_limbs[i]
					bleed_text += " [ru_otkuda_zone(body_part.ru_name)],"
				bleed_text += " и [ru_otkuda_zone(bleeding_limbs[num_bleeds].ru_name)]"

		if(appears_dead)
			bleed_text += ", но очень медленно.</span></B>\n"
		else
			if(reagents.has_reagent(/datum/reagent/toxin/heparin))
				bleed_text += " невероятно быстро"

			bleed_text += "!</B>\n"

		for(var/i in grasped_limbs)
			var/obj/item/bodypart/grasped_part = i
			bleed_text += "[t_on] сжимает свою конечность - [grasped_part.ru_name] -, пока из той течёт кровь!\n"

		msg += bleed_text.Join()

	if(reagents.has_reagent(/datum/reagent/teslium))
		msg += "[t_on] испускает нежное голубое свечение!\n"

	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[t_on] [stun_absorption[i]["examine_message"]]\n"

	if(just_sleeping)
		msg += "[t_on] спит. Гы.\n"

	if(!appears_dead)
		if(drunkenness && !skipface) //Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[t_on] немного пьян[t_a].\n"
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[t_on] пьян[t_a].\n"
				if(41.01 to 51)
					msg += "[t_on] довольно пьян[t_a] и от н[t_ego] чувствуется запах алкоголя.\n"
				if(51.01 to 61)
					msg += "Очень пьян[t_a] и от н[t_ego] несёт перегаром.\n"
				if(61.01 to 91)
					msg += "[t_on] в стельку.\n"
				if(91.01 to INFINITY)
					msg += "[t_on] в говно!\n"

		if(reagents.has_reagent(/datum/reagent/fermi/astral))
			if(mind)
				msg += "[t_on] имеет дикие, космические глаза, которые в свою очередь имеют странный, исключительно ненормальный вид.\n"
			else
				msg += "[t_on] имеет дикие, космические глаза, которые в свою очередь имеют странный, абсолютно ненормальный вид.\n"

		for(var/X in writing)
			if(!w_uniform)
				var/obj/item/bodypart/BP = X
				msg += "<span class='warning'>На [t_ego] [BP.name] написано: \"[html_encode(BP.writtentext)]\".</span>\n"
		for(var/obj/item/organ/genital/G in internal_organs)
			if(length(G.writtentext) && istype(G) && G.is_exposed())
				msg += "<span class='warning'>На [t_ego] [G.name] написано: \"[html_encode(G.writtentext)]\".</span>\n"

		if(!user)
			return

		if(src != user)
			if (a_intent != INTENT_HELP)
				msg += "[t_on] выглядит наготове.\n"
			if (getOxyLoss() >= 10)
				msg += "[t_on] жадно глотает воздух.\n"
			if (getToxLoss() >= 10)
				msg += "[t_on] выглядит болезненно.\n"
			if (HAS_TRAIT(src, TRAIT_BLIND))
				msg += "[t_on] смотрит в пустоту.\n"
			if (HAS_TRAIT(src, TRAIT_DEAF))
				msg += "[t_on] не реагирует на шум.\n"
			var/datum/component/mood/mood = src.GetComponent(/datum/component/mood)
			if(mood.sanity <= SANITY_DISTURBED)
				msg += "[t_on] выглядит расстроено.\n"
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "empath", /datum/mood_event/sad_empath, src)
			if(mood.shown_mood >= 6) //So roundstart people aren't all "happy" and that antags don't show their true happiness.
				msg += "[t_on] выглядит счастливо.\n"
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "empathH", /datum/mood_event/happy_empath, src)

		switch(stat)
			if(UNCONSCIOUS)
				msg += "<span class='deadsay'>[t_on] не реагирует на происходящее вокруг.</span>\n"
			if(SOFT_CRIT)
				msg += "<span class='deadsay'>[t_on] едва в сознании.</span>\n"
			if(CONSCIOUS)
				if(HAS_TRAIT(src, TRAIT_DUMB))
					msg += "[t_on] имеет глупое выражение лица.\n"
		if(getorgan(/obj/item/organ/brain))
			if(ai_controller?.ai_status == AI_STATUS_ON)
				msg += "<span class='deadsay'>[t_on] выглядит не очень разумно.</span>\n"
			if(!key)
				msg += "<span class='warning'>[t_on] кататоник. Стресс от жизни в глубоком космосе сильно повлиял на н[t_ego]. Восстановление маловероятно.</span>\n"
			else if(!client)
				msg += "<span class='warning'><B>Не стоит [ru_ego(TRUE)] трогать.</B> [t_on] имеет пустой, рассеянный взгляд и кажется совершенно не реагирующим ни на что. В этом состоянии [t_on] находится [round(((world.time - lastclienttime) / (1 MINUTES)), 1)] минут. [t_on] может выйти из этого состояни в ближайшее время.\n" //SKYRAT CHANGE - ssd indicator

	var/trait_exam = common_trait_examine()
	if (!isnull(trait_exam))
		msg += trait_exam

	var/scar_severity = 0
	for(var/i in all_scars)
		var/datum/scar/S = i
		if(S.is_visible(user))
			scar_severity += S.severity

	switch(scar_severity)
		if(1 to 4)
			msg += span_smallnoticeital("\n[t_on], похоже, имеет шрамы... стоит присмотреться, чтобы разглядеть ещё.")
		if(5 to 8)
			msg += span_notice("\n<i>[t_on] имеет несколько серьёзных шрамов... стоит присмотреться, чтобы разглядеть ещё.</i>")
		if(9 to 11)
			msg += span_notice("\n<b><i>[t_on] имеет множество ужасных шрамов... стоит присмотреться, чтобы разглядеть ещё.</i></b>")
		if(12 to INFINITY)
			msg += span_notice("\n<b><i>[t_on] имеет разорванное в хлам тело, состоящее из шрамов... стоит присмотреться, чтобы разглядеть ещё?</i></b>")

	if (length(msg))
		. += span_warning("[msg.Join("")]")

	var/traitstring = get_trait_string()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/cyberimp/eyes/hud/CIH = H.getorgan(/obj/item/organ/cyberimp/eyes/hud)
		if(istype(H.glasses, /obj/item/clothing/glasses/hud) || CIH)
			var/perpname = get_face_name(get_id_name(""))
			if(perpname)
				var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.general)
				if(R)
					. += "<span class='deptradio'>Должность:</span> [R.fields["rank"]]\n<a href='?src=[REF(src)];hud=1;photo_front=1'>\[Фото\]</a><a href='?src=[REF(src)];hud=1;photo_side=1'>\[Альт.\]</a>"
				if(istype(H.glasses, /obj/item/clothing/glasses/hud/health) || istype(CIH, /obj/item/organ/cyberimp/eyes/hud/medical))
					var/cyberimp_detect
					for(var/obj/item/organ/cyberimp/CI in internal_organs)
						if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
							cyberimp_detect += "[name] имеет модификацию [CI.name]."
					if(cyberimp_detect)
						. += "Обнаружены кибернетические модификации:"
						. += cyberimp_detect
					if(R)
						var/health_r = R.fields["p_stat"]
						. += "<a href='?src=[REF(src)];hud=m;p_stat=1'>\[[health_r]\]</a>"
						health_r = R.fields["m_stat"]
						. += "<a href='?src=[REF(src)];hud=m;m_stat=1'>\[[health_r]\]</a>"
					R = find_record("name", perpname, GLOB.data_core.medical)
					if(R)
						. += "<a href='?src=[REF(src)];hud=m;evaluation=1'>\[Медицинское заключение\]</a>"
					if(traitstring)
						. += "<span class='info'>Обнаружены особенности:\n[traitstring]</span>"

				if(istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(CIH, /obj/item/organ/cyberimp/eyes/hud/security))
					if(!user.stat && user != src)
					//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
						var/criminal = "Отсутствуют"

						R = find_record("name", perpname, GLOB.data_core.security)
						if(R)
							criminal = R.fields["criminal"]

						. += jointext(list("<span class='deptradio'>Criminal status:</span> <a href='?src=[REF(src)];hud=s;status=1'>\[[criminal]\] </a>",
							"<span class='deptradio'>Security record:</span> <a href='?src=[REF(src)];hud=s;view=1'>\[Показать\] </a>",
							"<a href='?src=[REF(src)];hud=s;add_crime=1'>\[Добавить нарушение\] </a>",
							"<a href='?src=[REF(src)];hud=s;view_comment=1'>\[Просмотреть комментарии\] </a>",
							"<a href='?src=[REF(src)];hud=s;add_comment=1'>\[Добавить комментарий\]</a>"), "")
	else if(isobserver(user) && traitstring)
		. += "<span class='info'><b>Особенности:</b> [traitstring]</span>"

	if(LAZYLEN(.) > 2) //Want this to appear after species text
		.[2] += "<hr>"

	if(!(ITEM_SLOT_EYES in obscured))
		. += span_boldnotice("Профиль персонажа: <a href='?src=\ref[src];character_profile=1'>\[Осмотреть\]</a>")

	// send signal last so everything else prioritizes above
	SEND_SIGNAL(src, COMSIG_PARENT_EXAMINE, user, .) //This also handles flavor texts now

/mob/living/proc/status_effect_examines(pronoun_replacement) //You can include this in any mob's examine() to show the examine texts of status effects!
	var/list/dat = list()
	if(!pronoun_replacement)
		pronoun_replacement = ru_who(TRUE)
	for(var/V in status_effects)
		var/datum/status_effect/E = V
		if(E.examine_text)
			var/new_text = replacetext_char(E.examine_text, "SUBJECTPRONOUN", pronoun_replacement)
			dat += "[new_text]\n" //dat.Join("\n") doesn't work here, for some reason
	if(dat.len)
		return dat.Join()
