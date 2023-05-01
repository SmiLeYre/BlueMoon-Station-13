/datum/antagonist/traitor/inteq_agents
	name = "InteQ Agent"
	employer = "InteQ"
	suicide_cry = "ЗА АДМИРАЛА БРАУНА!!"
	antagpanel_category = "InteQ"
	ui_name = "AntagInfoInteQ"
	var/give_equipment = TRUE
	var/special_role = "InteQ Agents"
	traitor_kind = /datum/traitor_class/human/inteq_agents

/datum/antagonist/traitor/inteq_agents/New()
	. = ..()

/datum/antagonist/traitor/inteq_agents/on_gain()
	START_PROCESSING(SSprocessing, src)
	if(give_equipment)
		equip_inteq()
		give_equipment = FALSE
	finalize_traitor()
	return ..()

/datum/antagonist/traitor/inteq_agents/proc/equip_inteq()
	var/mob/living/carbon/H = owner.current
	if(!istype(H))
		return
	. += inteq_give_item(/obj/item/inteq/uplink, H)

/datum/antagonist/traitor/inteq_agents/proc/inteq_give_item(obj/item/item_path, mob/living/carbon/human/H)
	var/list/slots = list(
		"backpack" = ITEM_SLOT_BACKPACK,
		"left pocket" = ITEM_SLOT_LPOCKET,
		"right pocket" = ITEM_SLOT_RPOCKET
	)

	var/T = new item_path(H)
	var/item_name = initial(item_path.name)
	var/where = H.equip_in_one_of_slots(T, slots, critical = TRUE)
	if(!where)
		to_chat(H, "<span class='userdanger'>Unfortunately, you weren't able to get a [item_name]. This is very bad and you should adminhelp immediately (press F1).</span>")
		return FALSE
	else
		to_chat(H, "<span class='danger'>You have a [item_name] in your [where].</span>")
		if(where == "backpack")
			SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)
		return TRUE

/datum/antagonist/traitor/inteq_agents/ui_static_data(mob/user)
	var/list/data = list()
	data["phrases"] = jointext(GLOB.syndicate_code_phrase, ", ")
	data["responses"] = jointext(GLOB.syndicate_code_response, ", ")
	data["theme"] = "inteq" //traitor_flavor["ui_theme"]
	data["code"] = ""
	data["intro"] = "You are from InteQ." //traitor_flavor["introduction"]
	data["allies"] = "Other agents were also sent to the station for the same purpose. Try to cooperate, because only in this way can you destroy the union." //traitor_flavor["allies"]
	data["goal"] = "Do whatever you can to help you reach your goal." //traitor_flavor["goal"]
	data["has_uplink"] = uplink ? TRUE : FALSE
	if(uplink)
		data["uplink_intro"] =  "Your Uplink in your backpack."  //traitor_flavor["uplink"]
		data["uplink_unlock_info"] = uplink.unlock_text
	data["objectives"] = get_objectives()
	return data

/datum/antagonist/traitor/inteq_agents/finalize_traitor()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/inteq.ogg', 100, FALSE, pressure_affected = FALSE)
	. = ..()
/datum/antagonist/traitor/inteq_agents/on_removal()
	STOP_PROCESSING(SSprocessing,src)
	. = ..()
/datum/antagonist/traitor/inteq_agents/process()
	inteq_agents_process()

/proc/is_internal_inteq_objective(datum/objective/O)
	return (istype(O, /datum/objective/inteq_agents)||istype(O, /datum/objective/inteq_agents))

/datum/antagonist/traitor/inteq_agents/reinstate_escape_objective()
	..()
	for (var/datum/objective/martyr/martyr_objective in objectives)
		objectives -= martyr_objective

	var/datum/objective/escape_objective = new /datum/objective/escape()
	escape_objective.owner = owner
	objectives += escape_objective

/datum/antagonist/traitor/inteq_agents/proc/inteq_agents_process()
	if(!owner)
		CRASH("Antag datum with no owner.")
	if(owner.current && owner.current.stat != DEAD)
		for(var/objective in objectives)
			if(!is_internal_inteq_objective(objective))
				continue

/datum/antagonist/traitor/inteq_agents/proc/forge_inteq_agents_objectives()
	if(SSticker.mode.target_list.len && SSticker.mode.target_list[owner]) // Is a double agent
		// Assassinate
		var/datum/mind/target_mind = SSticker.mode.target_list[owner]
		if(issilicon(target_mind.current))
			var/datum/objective/inteq_agents/destroy_objective = new
			destroy_objective.owner = owner
			destroy_objective.target = target_mind
			destroy_objective.update_explanation_text()
			add_objective(destroy_objective)
		else
			var/datum/objective/inteq_agents/kill_objective = new
			kill_objective.owner = owner
			kill_objective.target = target_mind
			kill_objective.update_explanation_text()
			add_objective(kill_objective)
	return

/datum/antagonist/traitor/inteq_agents/antag_panel_objectives()
	var/result = "<i><b>Objectives</b></i>:<br>"
	if (objectives.len == 0)
		result += "EMPTY<br>"
	else
		var/obj_count = 1
		for(var/datum/objective/objective in objectives)
			result += "<B>[obj_count]</B>: [objective.explanation_text] <a href='?src=[REF(owner)];obj_edit=[REF(objective)]'>Edit</a> <a href='?src=[REF(owner)];obj_delete=[REF(objective)]'>Delete</a> <a href='?src=[REF(owner)];obj_completed=[REF(objective)]'><font color=[objective.completed ? "green" : "red"]>[objective.completed ? "Mark as incomplete" : "Mark as complete"]</font></a><br>"
			obj_count++
	result += "<a href='?src=[REF(owner)];obj_add=1;target_antag=[REF(src)]'>Add objective</a><br>"
	result += "<a href='?src=[REF(owner)];obj_announce=1'>Announce objectives</a><br>"
	return result

/datum/antagonist/traitor/inteq_agents/forge_traitor_objectives()
	forge_inteq_agents_objectives()

	var/datum/objective/escape_objective = new /datum/objective/escape()
	escape_objective.owner = owner
	add_objective(escape_objective)

/datum/antagonist/traitor/inteq_agents/threat()
	return

/datum/antagonist/traitor/inteq_agents/set_traitor_kind(kind)
	return

/datum/antagonist/traitor/greet()
	to_chat(owner.current, "<B><font size=8 color=yellow>You are the InteQ Agent.</font></B>")
	owner.announce_objectives()
	if(should_give_codewords)
		give_codewords()
