/datum/map_template/shelter/victor //We have an entire alphabet, but i must make sure it will not overlap with the SPLURT's future updates.
	name = "Shelter Victor"
	shelter_id = "shelter_victor"
	description = "An extremely luxurious self-contained pressurized shelter, with \
		built-in pool, entertainment, vendors and a \
		sleeping area! Provided by KinkMate Corporation!"
	mappath = "modular_bluemoon/_maps/templates/shelter_510.dmm" //They won't make +510 shelters, right?

/datum/map_template/shelter/victor/New() //Default code for shelters to make sure it won't succumb to something 'weird'
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)
