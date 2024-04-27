/datum/component/riding/human/Initialize()
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_DIR_AFTER_CHANGE, PROC_REF(update_dir))

/datum/component/riding/human/proc/update_dir(mob/source, dir, newdir)
	handle_vehicle_offsets(newdir)
	handle_vehicle_layer(newdir)

/datum/component/riding/cyborg/Initialize()
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_DIR_AFTER_CHANGE, PROC_REF(update_dir))

/datum/component/riding/cyborg/proc/update_dir(mob/source, dir, newdir)
	handle_vehicle_offsets(newdir)
	handle_vehicle_layer(newdir)
