/datum/job
	var/list/species_blacklist = list()

/datum/job/proc/is_species_blacklisted(client/C)
	if(C.prefs.pref_species.id in species_blacklist)
		return TRUE
	return FALSE

/datum/config_entry/flag/xeno_supremacy //forbids command positions for humans

/datum/job/New()
	if(CONFIG_GET(flag/xeno_supremacy))
		if(title in (GLOB.command_positions | GLOB.security_positions))
			species_blacklist += list(SPECIES_HUMAN)
	. = ..()
