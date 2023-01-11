/datum/config_entry/flag/xeno_supermacy //forbids command positions for humans
/*
/datum/species/human/qualifies_for_rank(rank, list/features)
	. = ..()
	if(CONFIG_GET(flag/xeno_supermacy))
		if(rank in GLOB.command_positions)
			return FALSE
	return TRUE
*/
/*
/datum/job/captain
	species_blacklist = list(SPECIES_HUMAN)

config_check

/datum/job/chief_engineer
	species_blacklist = list(SPECIES_HUMAN)

/datum/job/cmo
	species_blacklist = list(SPECIES_HUMAN)

/datum/job/hop
	species_blacklist = list(SPECIES_HUMAN)

/datum/job/hos
	species_blacklist = list(SPECIES_HUMAN)

/datum/job/qm
	species_blacklist = list(SPECIES_HUMAN)

/datum/job/rd
	species_blacklist = list(SPECIES_HUMAN)
*/
