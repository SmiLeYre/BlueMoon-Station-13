/datum/traitor_class/human/inteq_agents
	name = "InteQ"
	employer = "InteQ"
	threat = 3
	tgui_theme = "inteq"

/datum/traitor_class/inteq_agents/forge_objectives(datum/antagonist/traitor/T)
	var/datum/objective/inteq_agents/O = new
	O.explanation_text = "You have free goals and tasks. Do whatever you can to undermine the alliance between NT and the Syndicate!"
	O.owner = T.owner
	T.add_objective(O)
	return

/datum/objective/inteq_agents
	name = "inteq"
	explanation_text = "You have free goals and tasks. Do whatever you can to undermine the alliance between NT and the Syndicate!"

/datum/objective/inteq_agents/check_completion()
	var/list/datum/mind/owners = get_owners()
	for(var/datum/mind/M in owners)
	return TRUE
