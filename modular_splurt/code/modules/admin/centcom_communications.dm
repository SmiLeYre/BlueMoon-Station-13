GLOBAL_LIST_EMPTY(centcom_communications_messages)
GLOBAL_VAR_INIT(next_command_message_id, 1)

/datum/centcom_communications

/datum/centcom_communications/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "centcomCommunications", "Command Communications")
		ui.open()

/datum/centcom_communications/ui_data(mob/user)
	. = list()

	.["command_name"] = command_name()
	.["time"] = world.time
	.["messages"] = GLOB.centcom_communications_messages

/datum/centcom_communications/ui_act(action, params, datum/tgui/ui)
	if (..())
		return

	var/client/admin = usr.client

	if (!check_rights(R_ADMIN))
		to_chat(admin, "Error: you are not an admin!")
		return

	switch(action)
		if ("mark_message")
			for(var/list/commandMessage in GLOB.centcom_communications_messages)
				if(commandMessage["id"] == params["message_id"])
					commandMessage["handled"] = TRUE

		if ("orbit_sender")
			var/atom/movable/sender = get_mob_by_key(params["sender_ckey"])
			if(!sender)
				to_chat(usr, "<span class='notice'>This player cannot be observed.</span>")
				return

			if(!isobserver(admin.mob))
				admin.admin_ghost()
			var/mob/dead/observer/O = admin.mob
			O.ManualFollow(sender)

		if ("set_command_name")
			admin.cmd_change_command_name()

		if ("reset_command_name")
			change_command_name(DEFAULT_CENTCOM_NAME)
			message_admins("[key_name_admin(admin)] has changed Central Command's name to [DEFAULT_CENTCOM_NAME]")
			log_admin("[key_name(admin)] has changed the Central Command name to: [DEFAULT_CENTCOM_NAME]")

		if ("send_command_report")
			admin.cmd_admin_create_centcom_report()

/datum/centcom_communications/ui_state(mob/user)
	return GLOB.admin_state
