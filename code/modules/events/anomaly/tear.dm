/datum/round_event_control/anomaly/tear
	name = "Dimmensional Tear"
	typepath = /datum/round_event/anomaly/tear
	weight = 15
	max_occurrences = 1
	min_players = 30
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/tear
	start_when = 3
	announce_when = 20
	end_when = 50
	var/obj/effect/tear/TE

/datum/round_event/anomaly/tear/announce()
	priority_announce("На борту станции зафиксирован пространственно-временной разрыв. Предполагаемая локация: [impact_area.name].", "ВНИМАНИЕ: ОБНАРУЖЕНА АНОМАЛИЯ")

/datum/round_event/anomaly/tear/start()
	var/turf/T = pick(get_area_turfs(impact_area))
	if(T)
		TE = new /obj/effect/tear(T.loc)

/datum/round_event/anomaly/tear/setup()
	impact_area = placer.findValidTurf()

/datum/round_event/anomaly/tear/end()
	if(TE)
		qdel(TE)

/obj/effect/tear
	name="Dimensional Tear"
	desc="A tear in the dimensional fabric of space and time."
	icon='icons/effects/tear.dmi'
	icon_state="tear"
	density = 0
	anchored = 1
	light_range = 3
	pixel_x = -96
	pixel_y = -96
	layer = BYOND_LIGHTING_LAYER

/obj/effect/tear/Initialize(mapload)
	. = ..()
	var/obj/effect/overlay/animation = new(loc)
	animation.icon_state = "newtear"
	animation.icon = 'icons/effects/tear.dmi'
	spawn(15)
		if(animation)
			qdel(animation)

	addtimer(CALLBACK(src, PROC_REF(spew_critters)), rand(30, 120))

/obj/effect/tear/proc/spew_critters()
	for(var/i in 1 to 5)
		var/mob/living/simple_animal/S
		S = create_random_mob(get_turf(src), HOSTILE_SPAWN)
		S.faction |= "chemicalsummon"
		if(prob(50))
			for(var/j = 1, j <= rand(1, 3), j++)
				step(S, pick(NORTH, SOUTH, EAST, WEST))
