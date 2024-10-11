//Tarkov.
/datum/map_template/ruin/space/tarkoff
	name = "Port Tarkov"
	prefix = "_maps/RandomRuins/SpaceRuins/BlueMoon/"
	allow_duplicates = FALSE
	id = "tarkoff-base"

/datum/map_template/ruin/space/tarkoff/New()
	var/num = rand(0, 3)
	switch(num)
		if(0)
			suffix = "defcon5.dmm"
		if(1)
			suffix = "defcon4.dmm"
		if(2)
			suffix = "defcon3.dmm"
		if(3)
			suffix = "defcon2.dmm"
	. = ..()

//DS2.
/datum/map_template/ruin/space/deepspacetwo
	name = "Deep Space Two"
	prefix = "_maps/RandomRuins/SpaceRuins/BlueMoon/"
	suffix = "space_syndicate_base.dmm"
	allow_duplicates = FALSE
	always_place = TRUE
	id = "ds2-base"

/datum/map_template/ruin/space/forgottenship
	name = "SCSBC-12"
	description = "InteQ хотели бы напомнить своим сотрудникам, что любой линейный крейсер будет обслуживаться соответствующим образом, как и экипаж."
	prefix = "_maps/RandomRuins/SpaceRuins/BlueMoon/"
	suffix = "forgotten_ship.dmm"
	allow_duplicates = FALSE
	always_place = TRUE
	id = "forgottenship"

/datum/map_template/ruin/space/forgottenship/New()
	if(GLOB.master_mode == "Extended")
		suffix = "sol_ship.dmm"
	else
		suffix = "forgotten_ship.dmm"
	. = ..()
