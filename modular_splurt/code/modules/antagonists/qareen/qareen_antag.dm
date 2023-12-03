/datum/antagonist/qareen
	name = "Qareen"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	threat = 3 //Just a horny antag, threat reduced. - Gardelin0
	show_to_ghosts = TRUE

/datum/antagonist/qareen/greet()
	owner.announce_objectives()

/datum/antagonist/qareen/proc/forge_objectives()
	var/datum/objective/qareen/objective = new
	objective.owner = owner
	objectives += objective
	var/datum/objective/qareenFluff/objective2 = new
	objective2.owner = owner
	objectives += objective2

/datum/antagonist/qareen/on_gain()
	forge_objectives()
	. = ..()
