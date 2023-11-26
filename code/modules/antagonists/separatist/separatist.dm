/datum/team/nation
	name = "Nation"

/datum/antagonist/separatist
	name = "Separatists"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	var/datum/team/nation/nation
	soft_antag = TRUE //BLUEMOON ADD - дружелюбные, малозначимые гостроли не должны считаться за антагонистов (ломает динамик)

/datum/antagonist/separatist/create_team(datum/team/nation/new_team)
	if(!new_team)
		return
	nation = new_team

/datum/antagonist/separatist/get_team()
	return nation

/datum/antagonist/separatist/greet()
	to_chat(owner, "<B>You are a separatist! [nation.name] forever! Protect the sovereignty of your newfound land with your comrades in arms!</B>")
