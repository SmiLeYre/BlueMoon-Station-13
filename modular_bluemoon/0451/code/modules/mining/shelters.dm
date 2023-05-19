/datum/map_template/shelter/victor //We have an entire alphabet, but i must make sure it will not overlap with the SPLURT's future updates.
	name = "Shelter Victor"
	shelter_id = "shelter_victor"
	description = "An extremely luxurious self-contained pressurized shelter, with \
		built-in pool, entertainment, vendors and a \
		sleeping area! Provided by KinkMate Corporation!"
	mappath = "modular_bluemoon/0451/_maps/templates/shelter_510.dmm" //They won't make +510 shelters, right?
	
/datum/map_template/shelter/victor/New() //Default code for shelters to make sure it won't succumb to something 'weird'
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/*
/datum/map_template/shelter/vanguard //Military-grade capsule with vibes from vorestation. Will be created sometime later for some events. .dmm is not impleneted.
	name = "Shelter Vanguard"
	shelter_id = "shelter_vanguard"
	description = "A proper military-grade shelter, \
		with every service and equipment that \
		required by any combat scenario!"
	mappath = "modular_bluemoon/0451/_maps/templates/shelter_vanguard.dmm" //It will be created in the future. One day.

/datum/map_template/shelter/vanguard/New() //Default code for shelters to make sure it won't succumb to something 'weird'
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)
