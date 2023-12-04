/datum/traitor_class/human/freeform
	name = "InteQ Agent"
	employer = "InteQ Intelligence Department"
	weight = 5
	chaos = 0

/datum/traitor_class/human/freeform/forge_objectives(datum/antagonist/traitor/T)
	var/datum/objective/freedom/O = new
	O.explanation_text = "У вас нет явных целей! Хотя мы не одобряем бездумную резню, вы можете враждовать с Nanotrasen и Синдикатом, как вам заблагорассудится! Не попадайте в плен и не будьте убиты. Если вы ничего не сделали за целую смену, у вас будут проблемы!"
	O.owner = T.owner
	T.add_objective(O)
	return
