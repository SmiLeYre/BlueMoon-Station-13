/turf/open/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/chasm/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

//BLUEMOON ADD - Water turf now extinguishes people
/turf/open/water/Entered(atom/movable/A)
	. = ..()
	if(istype(A, /mob/living))
		var/mob/living/L = A
		if(L.fire_stacks)
			L.fire_stacks = 0
			L.ExtinguishMob()
//BLUEMOON ADD END

/turf/open/water/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE
