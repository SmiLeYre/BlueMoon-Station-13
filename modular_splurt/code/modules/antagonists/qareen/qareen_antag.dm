/datum/antagonist/qareen
	name = "Qareen"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	soft_antag = TRUE // BLUEMOON ADD - это антагонист для ЕРП, он не должен мешать спавну обычных антагонистов
	show_to_ghosts = TRUE

/datum/antagonist/qareen/greet()
	owner.announce_objectives()

//datum/antagonist/qareen/proc/forge_objectives()		Reserved for later. - Gardelin0
//	var/datum/objective/qareen/objective = new
//	objective.owner = owner
//	objectives += objective
//	var/datum/objective/qareenFluff/objective2 = new
//	objective2.owner = owner
//	objectives += objective2

//datum/antagonist/qareen/on_gain()
//	forge_objectives()
//	. = ..()
