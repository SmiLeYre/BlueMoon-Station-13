/obj/machinery/rnd/production/Initialize(mapload)
	. = ..()

	// Generate access lists
	gen_access()

/obj/machinery/rnd/production/ui_interact(mob/user)
	// Check if access is required
	if(!req_access)
		return ..()

	// Check if user can use machine
	if(!user.can_use_production(src))
		return

	// Return normally
	. = ..()

/obj/machinery/rnd/production/Topic(raw, ls)
	// Check if access is required
	if(!req_access)
		return ..()

	// Check if user can use machine
	if(!usr.can_use_production(src))
		return

	// Return normally
	. = ..()
