#define REGENERATION_DELAY 60  // After taking damage, how long it takes for automatic regeneration to begin for tentacles.

mob/living
	var/has_tentacles = FALSE

/mob/living/proc/has_tentacles()
	return FALSE

/mob/living/tentacles/has_tentacles()
	return TRUE

/obj/structure/tentacles/node
	name = "tentacles node"
	desc = "Looks like their roots."
	icon = 'modular_bluemoon/Gardelin0/icons/mob/tentacles.dmi'
	icon_state = "node"
	density = 1
	opacity = 0
	anchored = TRUE
	max_integrity = 200
	CanAtmosPass = ATMOS_PASS_DENSITY

/mob/living/simple_animal/hostile/tentacles
	name = "Tentacles"
	desc = "I have seen enough space hentai to know..."
	icon = 'modular_bluemoon/Gardelin0/icons/mob/tentacles.dmi'
	icon_state = "tentacles"
	icon_living = "tentacles"
	icon_dead = "tentacles_dead"
	icon_gib = "tentacles_dead"
	var/base_icon = "tentacles"

	var/change_target_hole_cooldown = 0
	var/chosen_hole
	has_penis = TRUE
	has_tentacles = TRUE

	mob_biotypes = MOB_ORGANIC|MOB_BEAST

	//Tentacles don't speak nor move
	speak_chance = 0
	wander = 0
	stop_automated_movement = 1
	speed = -5
	turns_per_move = 3

	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat)

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"

	maxHealth = 200
	health = 200

	//Harmless
	harm_intent_damage = 0
	obj_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	attack_verb_continuous = "slap"
	attack_verb_simple = "slap"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("jiggles", "waves", "vibrates")
	//Tentacles aren't affected by cold.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	pressure_resistance = 200
	gold_core_spawnable = HOSTILE_SPAWN

	//some tentacles heal over time
	var/regen_cooldown = 0 //Used for how long it takes before a healing will take place default in 60 seconds
	var/regen_amount = 6 //How much is healed pre regen cooldown

/mob/living/simple_animal/hostile/tentacles/Initialize()
	. = ..()
	new/obj/structure/tentacles/node(src.loc)
	status_flags &= !CANPUSH

/mob/living/simple_animal/hostile/tentacles/moan() //Tentacles do not moan lmao
	return

/mob/living/simple_animal/hostile/tentacles/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(regen_amount)
		regen_cooldown = world.time + REGENERATION_DELAY

/mob/living/simple_animal/hostile/tentacles/BiologicalLife(delta_time, times_fired)
	if(!(. = ..()))
		return
	if(regen_amount && regen_cooldown < world.time)
		heal_overall_damage(regen_amount)

/mob/living/simple_animal/hostile/tentacles/MoveToTarget()
	stop_automated_movement = 1
	if(!target || !CanAttack(target))
		LoseTarget()
		return 0
	if(targets_from && isturf(targets_from.loc) && target.Adjacent(targets_from)) //If they're next to us, attack
		MeleeAction()
	else
		return 1


/mob/living/simple_animal/hostile/tentacles/AttackingTarget()
	var/mob/living/M = target

	var/onLewdCooldown = FALSE
	var/wantsNoncon = FALSE

	if(get_refraction_dif() > 0)
		onLewdCooldown = TRUE

	if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
		wantsNoncon = TRUE

	if(onLewdCooldown || !wantsNoncon)
		return // Do nothing

	if(!M.pulledby)
		if(!M.buckled && !M.density)
			M.forceMove(src.loc)

		start_pulling(M, supress_message = TRUE)
		log_combat(src, M, "grabbed")
		M.visible_message("<span class='warning'>[src] violently grab and entangle [M]!</span>", \
			"<span class='userdanger'>[src] violently grab and entangle you!</span>")
		setGrabState(GRAB_NECK) //Instant neck grab
		if(prob(15))
			M.Stun(15) //People want them to be dangerous, huh?
			M.visible_message("<span class='warning'>[src] secure [M]'s limbs, immobilizing them!</span>", \
				"<span class='userdanger'>[src] secures your limbs, immobilizing you!</span>")

		return

	if(change_target_hole_cooldown < world.time)
		chosen_hole = null
		while (chosen_hole == null)
			pickNewHole(M)
		change_target_hole_cooldown = world.time + 100

	if(get_refraction_dif() > 0)
		..()
		return

	do_lewd_action(M)
	addtimer(CALLBACK(src, .proc/do_lewd_action, M), rand(8, 12))

/mob/living/simple_animal/hostile/tentacles/proc/pickNewHole(mob/living/M)
	switch(rand(1))
		if(0)
			chosen_hole = CUM_TARGET_ANUS
		if(1)
			if(M.has_vagina())
				chosen_hole = CUM_TARGET_VAGINA
			else if(M.has_penis())
				chosen_hole = CUM_TARGET_PENIS
			else
				chosen_hole = CUM_TARGET_ANUS

/mob/living/simple_animal/hostile/tentacles/proc/do_lewd_action(mob/living/M)
	if(get_refraction_dif() > 0)
		return

	var/datum/interaction/I
	M.forceMove(src.loc) //Just to be sure
	switch(chosen_hole)
		if(CUM_TARGET_ANUS)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_SHIRT))
				return
			if(tearSlot(M, ITEM_SLOT_UNDERWEAR))
				return

			I = SSinteractions.interactions["/datum/interaction/lewd/tentacle/anus"]
			I.display_interaction(src, M)

		if(CUM_TARGET_VAGINA)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_SHIRT))
				return
			if(tearSlot(M, ITEM_SLOT_UNDERWEAR))
				return

			switch(rand(1))
				if(0)
					I = SSinteractions.interactions["/datum/interaction/lewd/tentacle/female"]
				if(1)
					I = SSinteractions.interactions["/datum/interaction/lewd/tentacle/female_double"]
			I.display_interaction(src, M)

		if(CUM_TARGET_PENIS)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_SHIRT))
				return
			if(tearSlot(M, ITEM_SLOT_UNDERWEAR))
				return

			switch(rand(1))
				if(0)
					I = SSinteractions.interactions["/datum/interaction/lewd/tentacle/female"]
				if(1)
					I = SSinteractions.interactions["/datum/interaction/lewd/tentacle/female_double"]
			I.display_interaction(src, M)

/mob/living/simple_animal/hostile/tentacles/cum(mob/living/M)

	if(get_refraction_dif() > 0)
		return

	var/message

	if(ishuman(target) && CUM_TARGET_VAGINA)
		if(M.is_bottomless() && M.has_vagina())
			message = "вгоняют свои тентакли в дырочки \the [M] и заполняют их спермой!"
			M.impregnate(src, M.getorganslot(ORGAN_SLOT_WOMB), src.type)
		else
			message = "кончают на \the [M]."

	if(ishuman(target) && CUM_TARGET_PENIS)
		if(M.is_bottomless() && M.has_anus())
			message = "обхватывают член \the [M] и обливают спермой!"
		else
			message = "кончают на \the [M]."

	if(ishuman(target) && CUM_TARGET_ANUS)
		if(M.is_bottomless() && M.has_anus())
			message = "вгоняют свои тентакли в задницу \the [M] и заполняют её спермой!"
		else if (prob(50))
			message = "кончают на \the [M]."
		else
			message = "кончают на пол!"

	if(istype(M, /mob/living/carbon))
		M.reagents.add_reagent(/datum/reagent/consumable/semen, 30)
		M.reagents.add_reagent(/datum/reagent/drug/aphrodisiacplus, 5) //Cum contains hexocrocin
	new /obj/effect/decal/cleanable/semen(loc)

	playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/splast.ogg", 30, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	shake_camera(M, 6, 1)
	set_is_fucking(null ,null)

	refractory_period = world.time + rand(100, 150) // Sex cooldown
	set_lust(0) // Nuts at 400

	addtimer(CALLBACK(src, .proc/slap, M), 15)

/mob/living/simple_animal/hostile/tentacles/proc/slap(mob/living/M)
	playsound(loc, "modular_sand/sound/interactions/slap.ogg", 30, 1, -1)
	visible_message("<span class='danger'>\The [src]</b> slaps \the [M] right on the ass!</span>", \
			"<span class='userdanger'>\The [src]</b> slaps \the [M] right on the ass!</span>", null, COMBAT_MESSAGE_RANGE)
	sleep(50) //5 seconds. Let the victim rest a little.

/mob/living/simple_animal/hostile/tentacles/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.dropItemToGround(W)
		playsound(loc, "sound/items/poster_ripped.ogg", 30, 1, -1)
		visible_message("<span class='danger'>\The [src]</b> tears off \the [M]'s clothes!</span>", \
				"<span class='userdanger'>\The [src]</b> tears off \the [M]'s clothes!</span>", null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE

/obj/item/reagent_containers/food/snacks/cube/tentacles
	name = "tentacles cube"
	desc = "Instant tentacles! Just add water!"
	tastes = list("pleasure" = 1, "hentai" = 1)
	dried_being = /mob/living/simple_animal/hostile/tentacles

/obj/item/storage/box/tentaclescubes
	name = "tentacles cube box"
	desc = "Drymate brand tentacles cubes. Just add water!"
	icon = 'modular_bluemoon/Gardelin0/icons/mob/tentacles.dmi'
	icon_state = "tentaclecubebox"
	illustration = null

//  ⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⢸⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠
//  ⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄
//  ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄
//  ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄
//  ⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰
//  ⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤
//  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗
//  ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄
//  ⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄
//  ⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄
//  ⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄
// ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄
//  ⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄⠄⠄⠄⠄
//  ⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄⠄⠄⠄⠄⢀⣠⣴
//  ⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠

/obj/item/storage/box/tentaclescubes/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/food/snacks/cube/tentacles))

/obj/item/storage/box/tentaclescubes/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/food/snacks/cube/tentacles(src)
