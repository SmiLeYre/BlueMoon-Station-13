SUBSYSTEM_DEF(callbacks)
	name = "Auxtools Callbacks"
	flags = SS_TICKER | SS_NO_INIT
	wait = 1
	priority = FIRE_PRIORITY_CALLBACKS

/datum/controller/subsystem/callbacks/fire()
	if(process_atmos_callbacks(TICK_REMAINING_MS))
		pause()
