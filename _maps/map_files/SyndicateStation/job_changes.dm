#define JOB_MODIFICATION_MAP_NAME "SyndicateBoxStation"

/datum/job/captain/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = outfit = /datum/outfit/job/captain/syndicate

/datum/job/captain/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/blueshield/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/blueshield/syndicate

/datum/job/blueshield/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/ntr/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/ntr/syndicate

/datum/job/ntr/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/lawyer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/lawyer/syndicate

/datum/job/lawyer/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/bridgeofficer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/bridgeofficer/syndicate

/datum/job/bridgeofficer/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/hop/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/hop/syndicate

/datum/job/hop/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/bartender/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/bartender/syndicate

/datum/job/cook/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/cook/syndicate

/datum/job/janitor/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/janitor/syndicate

/datum/job/hydro/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/botanist/syndicate

/datum/job/clown/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/clown/syndicate

/datum/job/mime/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/mime/syndicate

/datum/job/chaplain/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/chaplain/syndicate

/datum/job/curator/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/curator/syndicate

/datum/job/cmo/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/cmo/syndicate

/datum/job/cmo/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/doctor/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/doctor/syndicate

/datum/job/virologist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/virologist/syndicate

/datum/job/chemist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/chemist/syndicate

/datum/job/paramedic/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/paramedic/syndicate

/datum/job/psychologist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/doctor/psychologist/syndicate

/datum/job/geneticist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/geneticist/syndicate

/datum/job/rd/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/rd/syndicate

/datum/job/rd/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/scientist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/scientist/syndicate

/datum/job/roboticist/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/roboticist/syndicate

/datum/job/expeditor/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/expeditor/syndicate

/datum/job/chief_engineer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/ce/syndicate

/datum/job/chief_engineer/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/engineer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/engineer/syndicate

/datum/job/atmos/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/atmos/syndicate

/datum/job/qm/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/quartermaster/syndicate

/datum/job/qm/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/cargo_tech/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/cargo_tech/syndicate

/datum/job/mining/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/miner/syndicate

/datum/job/hos/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/hos/syndicate

/datum/job/hos/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/warden/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/warden/syndicate

/datum/job/warden/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/officer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/security/syndicate

/datum/job/officer/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/brigdoc/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/brigdoc/syndicate

/datum/job/brigdoc/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/detective/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/detective/syndicate

/datum/job/detective/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/peacekeeper/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/peacekeeper/syndicate

/datum/job/peacekeeper/get_access()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		return get_all_accesses()

/datum/job/stowaway/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/stowaway/syndicate

/datum/job/assistant/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/assistant/syndicate

/datum/job/bouncer/New()
	. = ..()
	if(SSmapping.config?.map_name == "Syndicate Station")
		outfit = /datum/outfit/job/bouncer/syndicate
