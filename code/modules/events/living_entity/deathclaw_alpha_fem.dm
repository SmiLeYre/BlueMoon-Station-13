/datum/round_event_control/deathclaw_alpha_fem
	name = "Sexy Deathclaws in Techmain: Basic Girl"
	typepath = /datum/round_event/deathclaw_alpha_fem
	max_occurrences = 5
	weight = 60
	category = EVENT_CATEGORY_ENTITIES

/datum/round_event/deathclaw_alpha_fem/announce(fake)
	priority_announce("Один из наших... кхм... особых заключённых сбежал. Так получилось, что его последнее известное местонахождение до того, как их маячок заглох, - это ваша станция, так что будьте осторожней и остерегайтесь Технических Тоннелей. И еще... вы не видели ящерку уборщика?",
	sender_override = "Психиатрический Отдел Nanotrasen", has_important_message = TRUE)

/datum/round_event/deathclaw_alpha_fem/start()
	var/list/spawn_locs = list()
	var/list/unsafe_spawn_locs = list()
	for(var/X in GLOB.xeno_spawn)
		if(!isfloorturf(X))
			unsafe_spawn_locs += X
			continue
		var/turf/open/floor/F = X
		var/datum/gas_mixture/A = F.air
		var/oxy_moles = A.get_moles(GAS_O2)
		if((oxy_moles < 16 || oxy_moles > 50) || A.get_moles(GAS_PLASMA) || A.get_moles(GAS_CO2) >= 10)
			unsafe_spawn_locs += F
			continue
		if((A.return_temperature() <= 270) || (A.return_temperature() >= 360))
			unsafe_spawn_locs += F
			continue
		var/pressure = A.return_pressure()
		if((pressure <= 20) || (pressure >= 550))
			unsafe_spawn_locs += F
			continue
		spawn_locs += F

	if(!spawn_locs.len)
		spawn_locs += unsafe_spawn_locs

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/turf/T = get_turf(pick(spawn_locs))
	var/mob/living/simple_animal/hostile/deathclaw/funclaw/femclaw/S = new(T)
	playsound(S, 'sound/alien/Voice/roarFar1.ogg', 75, 1, 100)
	message_admins("An InteQ mutant has been spawned at [COORD(T)][ADMIN_JMP(T)]")
	log_game("An InteQ mutant has been spawned at [COORD(T)]")
	return SUCCESSFUL_SPAWN
