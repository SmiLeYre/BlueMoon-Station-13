/datum/round_event_control/anomaly/tear/honk
	name = "Honked Dimmensional Tear"
	typepath = /datum/round_event/anomaly/tear/honk
	weight = 5
	max_occurrences = 1
	min_players = 30
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/tear/honk
	var/obj/effect/tear/honk/HE //i could just inherit but its being finicky.

/datum/round_event/anomaly/tear/honk/announce()
	priority_announce("На борту станции зафиксирована Хонканомалия. Предполагаемая локация: [impact_area.name].", "ВНИМАНИЕ: ХОНК-АНОМАЛИЯ.", 'sound/items/AirHorn.ogg')

/datum/round_event/anomaly/tear/honk/start()
	var/turf/T = pick(get_area_turfs(impact_area))
	if(T)
		HE = new /obj/effect/tear/honk(T.loc)

/datum/round_event/anomaly/tear/honk/end()
	if(HE)
		qdel(HE)

/obj/effect/tear/honk
	name = "Honkmensional Tear"
	desc = "A tear in the dimensional fabric of sanity."

/obj/effect/tear/honk/spew_critters()
	for(var/i in 1 to 6)
		var/mob/living/simple_animal/hostile/retaliate/clown/mutant/goblin/G = new(get_turf(src))
		if(prob(50))
			for(var/j = 1, j <= rand(1, 3), j++)
				step(G, pick(NORTH, SOUTH, EAST, WEST))
