/datum/antagonist/pirate/raiders
	name = "InteQ Raider"
	job_rank = ROLE_RAIDER
	roundend_category = "inteq raiders"
	antagpanel_category = "InteQ"
	threat = 15
	show_to_ghosts = TRUE
	var/static/datum/team/pirate/raiders/raiders_team = new /datum/team/pirate/raiders
	var/raider_outfit = /datum/outfit/inteq_raider
	var/send_to_spawnpoint = TRUE //Should the user be moved to default spawnpoint.
	var/equip_outfit = TRUE

/datum/antagonist/pirate/raiders/leader
	name = "InteQ Raider Vanguard"
	raider_outfit = /datum/outfit/inteq_raider/vanguard

/datum/antagonist/pirate/raiders/greet()
	SEND_SOUND(owner.current, sound('modular_bluemoon/kovac_shitcode/sound/inteq_raiders_spawn.ogg'))
	to_chat(owner, "<span class='boldannounce'>Вы - наёмник InteQ!</span>")
	to_chat(owner, "<B>Капитан станции отказался заплатить. Атакуйте её: похищайте ресурсы, берите заложников. Избегайте ненужных жертв. Не забывайте следить за своим кораблём.</B>")
	owner.announce_objectives()

/datum/antagonist/pirate/raiders/get_team()
	return crew

/datum/antagonist/pirate/raiders/create_team(datum/team/pirate/raiders/new_team)
	if(!new_team)
		for(var/datum/antagonist/pirate/raiders/P in GLOB.antagonists)
			if(!P.owner)
				continue
			if(P.crew)
				crew = P.crew
				return
		if(!new_team)
			crew = new /datum/team/pirate/raiders
			crew.forge_objectives()
			return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	crew = new_team

/datum/antagonist/pirate/raiders/on_gain()
	if(crew)
		objectives |= crew.objectives
	. = ..()

/datum/team/pirate/raiders
	name = "InteQ"

/datum/team/pirate/raiders/roundend_report()
	var/list/parts = list()

	parts += "<span class='header'InteQ Raiders were:</span>"

	var/all_dead = TRUE
	for(var/datum/mind/M in members)
		if(considered_alive(M))
			all_dead = FALSE
	parts += printplayerlist(members)

	parts += "Loot stolen: "
	var/datum/objective/loot/L = locate() in objectives
	parts += L.loot_listing()
	parts += "Total loot value : [L.get_loot_value()]/[L.target_value] credits"

	if(L.check_completion() && !all_dead)
		parts += "<span class='greentext big'>InteQ Raiders were successful!</span>"
	else
		parts += "<span class='redtext big'>InteQ Raiders have failed.</span>"

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

///////////////  Sleeper //////

/obj/effect/mob_spawn/human/raider
	name = "InteQ Raider Sleeper"
	desc = "A cryo sleeper. Look slightly modified. <i>Seems like it can be destroyed with the right tools...</i>"
	job_description = "InteQ Raider"
	random = TRUE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	mob_name = "an InteQ raider"
	canloadappearance = TRUE
	outfit = /datum/outfit/inteq_raider
	roundstart = FALSE
	death = FALSE
	anchored = TRUE
	density = FALSE
	show_flavour = FALSE //Flavour only exists for spawners menu
	short_desc = "You are an InteQ raider."
	flavour_text = "Капитан станции отказался платить в ответ на требование наёмников InteQ. Атакуйте её: похищайте ресурсы, берите заложников. Избегайте ненужных жертв. Не забывайте следить за своим корабль."
	assignedrole = "InteQ Raider"

/obj/effect/mob_spawn/human/raider/vanguard
	outfit = /datum/outfit/inteq_raider/vanguard

/obj/effect/mob_spawn/human/raider/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()
	if(.)
		return
	if(user.mind.has_antag_datum(/datum/antagonist/pirate/raiders))
		to_chat(user, "<span class='notice'>Your shipmate sails within their dreams for now. Perhaps they may wake up eventually.</span>")
	else
		to_chat(user, "<span class='notice'>If you want to destroy the sleeper, something to pry open it might be the best way.</span>")


/obj/effect/mob_spawn/human/raider/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_CROWBAR && user.a_intent != INTENT_HARM)
		if(user.mind.has_antag_datum(/datum/antagonist/pirate/raiders))
			to_chat(user,"<span class='warning'>Why would you want to the PMC propercy? That'd be stupid.</span>")
			return
		user.visible_message("<span class='warning'>[user] start to pry open [src]...</span>",
				"<span class='notice'>You start to pry open [src]...</span>",
				"<span class='italics'>You hear prying...</span>")
		W.play_tool_sound(src)
		if(do_after(user, 100*W.toolspeed, target = src))
			user.visible_message("<span class='warning'>[user] pries open [src], devastating the sleeper.</span>",
				"<span class='notice'>You pry open [src], devastating the sleeper..</span>",
				"<span class='italics'>You hear prying, followed by devastating of sleeper..</span>")
			log_game("[key_name(user)] has successfully pried open [src] and disabled an InteQ raider spawner.")
			W.play_tool_sound(src)
			playsound(src.loc, 'sound/effects/bamf.ogg', 50, 1, 4, 1.2)
			qdel(src)
	else
		..()

/obj/effect/mob_spawn/human/raider/special(mob/living/new_spawn)
	new_spawn.mind.add_antag_datum(/datum/antagonist/pirate/raiders)

/obj/effect/mob_spawn/human/raider/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

/////////////////////////////// Outfits ///////////

/datum/outfit/inteq_raider
	name = "InteQ Raider"

	uniform = /obj/item/clothing/under/inteq
	shoes = /obj/item/clothing/shoes/combat
	//r_pocket = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	//gloves = /obj/item/clothing/gloves/combat
	//back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/syndicate/alt
	id = /obj/item/card/id/syndicate/inteq/raider
	//belt = /obj/item/gun/ballistic/automatic/pistol
	//backpack_contents = list(/obj/item/storage/box/survival/syndie=1,
	//obj/item/kitchen/knife/combat/survival)

	var/command_radio = FALSE

/datum/outfit/inteq_raider/vanguard
	name = "InteQ Vanguard Raider"
	id = /obj/item/card/id/syndicate/inteq/raider/leader
	suit = /obj/item/clothing/suit/armor/inteq/vanguard
	head = /obj/item/clothing/head/HoS/inteq_vanguard
	l_pocket = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	command_radio = TRUE

/datum/outfit/inteq_raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.faction |= "InteQ"

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_SYNDICATE)
	R.freqlock = TRUE
	if(command_radio)
		R.command = TRUE

	var/obj/item/implant/weapons_auth/W = new
	W.implant(H)

	H.update_icons()

	H.grant_language(/datum/language/codespeak, TRUE, TRUE)

////// Shuttle (Krashly) ///////////

/area/shuttle/inteq
	name = "InteQ Shuttle"

/datum/map_template/shuttle/inteq_collosus
	prefix = "_maps/shuttles/bluemoon/"
	port_id = "inteq"
	suffix = "collosus"
	name = "Collosus Shuttle"

/obj/machinery/computer/shuttle/inteq_collosus
	name = "Collosus Control"
	desc = "Used to control the Collosus."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_ORANGE
	circuit = /obj/item/circuitboard/computer/inteq_collosus
	shuttleId = "inteq_collosus"
	possible_destinations = "raiders_away;inteq_collosus_custom;collosus_home" //Я твою мать ебал. (C) Krashly

/obj/item/circuitboard/computer/inteq_collosus
	name = "Collosus Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/inteq_collosus

/obj/machinery/computer/camera_advanced/shuttle_docker/inteq_collosus
	name = "Collosus Navigation Computer"
	desc = "The Navigation console for the Collosus."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "inteq_collosus"
	lock_override = NONE
	shuttlePortId = "inteq_collosus_custom"
	jumpto_ports = list("whiteship_away" = 1, "whiteship_home" = 1)
	view_range = 14
	x_offset = -7
	y_offset = -7

/obj/machinery/porta_turret/syndicate/energy/pirate/inteq
	max_integrity = 260
	integrity_failure = 0.08
	armor = list(MELEE = 50, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 90, ACID = 90)
	faction = list("InteQ")

///Krashly Changes
/obj/effect/landmark/start/inteq_raider
	name = "inteq raider"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/inteq_raider/Initialize(mapload)
	..()
	GLOB.raider_start += get_turf(src)
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/inteq_raider_leader
	name = "inteq raider vanguard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/inteq_raider_leader/Initialize(mapload)
	..()
	GLOB.raider_leader_start += get_turf(src)
	return INITIALIZE_HINT_QDEL

/datum/antagonist/pirate/raiders/proc/equip_raider()
	if(!ishuman(owner.current))
		return
	var/mob/living/carbon/human/H = owner.current
	H.equipOutfit(raider_outfit)

/datum/admins/proc/makeRaiderTeam()
	var/list/mob/candidates = pollGhostCandidates("Do you wish to be considered for the InteQ Raiders team?", ROLE_RAIDER)
	var/list/mob/chosen = list()
	var/mob/theghost = null

	if(candidates.len)
		var/numslavers = 4
		var/slavercount = 0

		for(var/i = 0, i<numslavers,i++)
			shuffle_inplace(candidates) //More shuffles means more randoms
			for(var/mob/j  in candidates)
				if(!j || !j.client || QDELETED(j) || jobban_isbanned(j, ROLE_RAIDER) || jobban_isbanned(j, ROLE_INTEQ))
					candidates.Remove(j)
					continue

				theghost = j
				candidates.Remove(theghost)
				chosen += theghost
				slavercount++
				break
		//Making sure we have atleast 1 slaver
		if(slavercount < 1)
			return 0

		//Let's find the spawn locations
		var/leader_chosen = FALSE
		var/datum/team/raiders/raiders_team
		for(var/mob/c in chosen)
			var/mob/living/carbon/human/new_character=makeBody(c)
			if(!leader_chosen && !GLOB.slavers_spawned) // If we have no leader, pick one. Second check means only pick a leader if no previous slaver team has spawned, avoiding multiple leaders.
				leader_chosen = TRUE
				new_character.mind.add_antag_datum(/datum/antagonist/pirate/raiders/leader)
			else
				new_character.mind.add_antag_datum(/datum/antagonist/pirate/raiders)
		return 1
	else
		return 0

/datum/antagonist/pirate/raiders/proc/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.raider_start))

/datum/antagonist/pirate/raiders/leader/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.raider_leader_start))

/datum/antagonist/pirate/raiders/proc/admin_send_to_base(mob/admin)
	owner.current.forceMove(pick(GLOB.raider_start))

/datum/antagonist/pirate/raiders/on_gain()
	. = ..()
	if(equip_outfit)
		equip_raider()
	if(send_to_spawnpoint)
		move_to_spawnpoint()
