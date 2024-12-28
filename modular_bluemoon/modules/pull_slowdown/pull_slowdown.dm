// Дополняет /mob/living/proc/update_pull_movespeed()

// BLUEMOON ADD START - PULL_SLOWDOWN
/datum/movespeed_modifier/pull_slowdown
	variable = TRUE
	blacklisted_movetypes = (FLYING|FLOATING)
