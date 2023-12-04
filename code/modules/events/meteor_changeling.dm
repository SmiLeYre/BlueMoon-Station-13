
/obj/effect/meteor/meaty/changeling
	name = "unsettlingly meaty meteor"
	desc = "A tightly packed knit of flesh and skin, pulsating with life."
	icon_state = "changeling"
	heavy = FALSE
	hits = 1 //Instantly splatters apart when it hits anything.
	hitpwr = EXPLODE_LIGHT
	threat = 100
	///Where we want our changeling to, by whatever means, end up at.
	var/atom/landing_target

/obj/effect/meteor/meaty/changeling/Initialize(mapload, turf/target)
	. = ..()

	landing_target = target

/obj/effect/meteor/meaty/changeling/meteor_effect()
	..()

	for(var/atom/movable/child in contents)
		child.forceMove(get_turf(src))

/obj/effect/meteor/meaty/changeling/ram_turf()
	return //So we don't instantly smash into our occupant upon unloading them.

//If the meteor misses the station and deletes itself, we make absolutely sure the changeling reaches the station.
/obj/effect/meteor/meaty/changeling/handle_stopping()
	if(!landing_target)
		//If our destination turf is gone for some reason, we chuck them at the observer_start landmark (usually at the center of the station) as a last resort.
		landing_target = locate(/obj/effect/landmark/observer_start) in GLOB.landmarks_list

	for(var/atom/movable/changeling in contents)
		changeling.forceMove(get_turf(src))
		changeling.throw_at(landing_target, 2, 2)
		changeling.visible_message(span_warning("[changeling] is launched out from inside of the [name]"), span_changeling("Sensing that something is terribly wrong, we forcibly eject ourselves from the [name]!"))
		playsound(changeling, 'sound/effects/splat.ogg', 50, pressure_affected = FALSE)

	return ..()
