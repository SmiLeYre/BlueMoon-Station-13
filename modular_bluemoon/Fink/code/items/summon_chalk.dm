/obj/item/summon_chalk
	name = "summon chalk"
	desc = "A weird chalk covered in ectoplasm."
	icon = 'modular_bluemoon/Gardelin0/icons/items/qareen_chalk.dmi'
	icon_state = "chalk_pink"
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY


/obj/item/summon_chalk/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity)
		return
	if(GLOB.master_mode != "Extended")
		to_chat(user, "<span class='warning'>Unfortunately, magic does not work.</span>") //*boowomp
		return
	else
		if(istype(target, /turf/open/floor))
			if(do_after(user, 5))
				new /obj/effect/summon_rune(target)
				qdel(src)


/obj/effect/summon_rune
	name = "Lewd summon rune"
	desc = "It is believed this rune is capable of summoning horny creatures!"
	icon = 'modular_bluemoon/Gardelin0/icons/items/qareen_chalk.dmi'
	icon_state = "rune_pink"
	light_color = LIGHT_COLOR_PINK
	var/return_pos
	var/cooldown = 0

/obj/effect/summon_rune/Initialize(mapload)
	. = ..()
	set_light(2)

/obj/effect/summon_rune/attack_hand(mob/living/carbon/M)
	if(cooldown < world.time - 400)// ~
		cooldown = world.time
		var/list/applicants = list()
		var/list/applicants_result = list()
		for(var/mob/living/carbon/human/H in GLOB.carbon_list)
			if(HAS_TRAIT(H, TRAIT_LEWD_SUMMON))
				applicants += H
		for(var/mob/living/carbon/human/V in applicants)
			var/mob/living/carbon/human/A = V
			//var/atom/A = V

			var/species = "[A.dna.species]"
			if (A.dna.custom_species)
				species = "[A.dna.custom_species]"
			var/player_info = "[species], [A.gender]"
			applicants_result[initial(player_info)] = A

		var/choice = tgui_alert(usr, "Do you want to attempt to summon?", "Attempt to summon?", list("Yes", "No"))
		switch(choice)
			if("No")
				return
			if("Yes")
				var/target_info = input("Please, select a person to summon!", "Select", null, null) as null|anything in applicants_result
				var/target_id= applicants_result.Find(target_info)
				var/mob/living/carbon/human/target = applicants[target_id]
				if(isnull(target))
					to_chat(M, span_userdanger("Nobody to summon!"))
					return
				else

					var/applicant_choice = tgui_alert(target, "You have been summoned! Do you want to answer?", "Do you want to answer?", list("Yes", "No"))
					switch(applicant_choice)
						if("No")
							to_chat(M, span_userdanger("It refuses to answer!"))
						if("Yes")

							to_chat(M, span_lewd("Something is happening!"))
							var/old_pos = target.loc
							/// раздевалка
							nuding(target)
							new /obj/effect/temp_visual/yellowsparkles(target.loc)
							do_teleport(target, src.loc, channel = TELEPORT_CHANNEL_MAGIC)
							new /obj/effect/temp_visual/yellowsparkles(target.loc)

							to_chat(target, span_hypnophrase("You are turning on!"))
							ADD_TRAIT(target, TRAIT_LEWD_SUMMONED, src)
							REMOVE_TRAIT(target, TRAIT_LEWD_SUMMON, src)
							playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/spook.ogg", 50, 1)
							var/obj/effect/summon_rune/return_rune/R = new(src.loc)
							R.return_pos = old_pos
							qdel(src)


/obj/effect/summon_rune/return_rune/attack_hand(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_LEWD_SUMMONED))
		var/choice = tgui_alert(M, "Do you want to attempt to return?", "Attempt to return?", list("Yes", "No"))
		switch(choice)
			if("No")
				return
			if("Yes")
				playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/spook.ogg", 50, 1)
				REMOVE_TRAIT(M, TRAIT_LEWD_SUMMONED, src)
				ADD_TRAIT(M, TRAIT_LEWD_SUMMON, src)
				new /obj/effect/temp_visual/yellowsparkles(M.loc)
				nuding(M)
				do_teleport(M, return_pos, channel = TELEPORT_CHANNEL_MAGIC)
				new /obj/effect/temp_visual/yellowsparkles(M.loc)
				qdel(src)

/obj/effect/summon_rune/return_rune
	var/mob/living/carbon/returner

/obj/effect/summon_rune/return_rune/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/effect/summon_rune/return_rune/process()
	if (!returner)
		if(locate(/mob/living/carbon/human/) in oview(3,src)) // <-антирантайм. не лишняя проверка.
			var/mob/living/carbon/human/return_applicant = locate(/mob/living/carbon/human/) in oview(3,src)
			if(HAS_TRAIT(return_applicant, TRAIT_LEWD_SUMMONED)) // подходит
				returner = return_applicant
	if (returner)
		var/xdiff=abs(returner.x-src.x)
		var/ydiff=abs(returner.y-src.y)
		if (xdiff>=3 || ydiff>=3) // не отходим далеко от руны
			playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/spook.ogg", 50, 1)
			new /obj/effect/temp_visual/yellowsparkles(returner.loc)
			do_teleport(returner, src.loc, channel = TELEPORT_CHANNEL_MAGIC)
			to_chat(returner, span_hypnophrase("I need to satisfy my summoner!"))
			new /obj/effect/temp_visual/yellowsparkles(returner.loc)
	//spawn_atom_to_turf(/obj/effect/temp_visual/hierophant/telegraph/edge, src, 1, FALSE) // красивое
	//sleep(80)
	//if(QDELETED(src))
	//	return

/obj/effect/summon_rune/proc/nuding(mob/living/carbon/target)
	/// раздевалка
	var/items = target.get_contents()
	for(var/obj/item/item_worn in items)
		if(istype(item_worn,/obj/item/clothing/head))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/shoes))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/gloves))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/under))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/under))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/suit))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/clothing/neck))
			target.dropItemToGround(item_worn, TRUE)
		if(istype(item_worn,/obj/item/storage/backpack))
			target.dropItemToGround(item_worn, TRUE)
		else
			continue // оставляем только трусняк, очки и ухо

