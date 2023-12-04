/datum/job
	var/list/species_blacklist = list()

/datum/job/proc/is_species_blacklisted(client/C)
	if(C.prefs.pref_species.id in species_blacklist)
		return TRUE
	return FALSE
