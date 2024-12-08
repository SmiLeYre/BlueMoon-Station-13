SUBSYSTEM_DEF(who)
	name = "Who"
	flags = SS_BACKGROUND
	runlevels = RUNLEVELS_DEFAULT|RUNLEVEL_LOBBY
	init_order = 40
	wait = 2 SECONDS

	var/datum/player_list/who = new
	var/datum/player_list/staff/staff_who = new

/datum/controller/subsystem/who/Initialize()
	who.update_data()
	staff_who.update_data()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/who/fire(resumed = TRUE)
	who.update_data()
	staff_who.update_data()


// WHO DATA
/datum/player_list
	var/tgui_name = "Who"
	var/tgui_interface_name = "Who"
	var/list/base_data = list()
	var/list/admin_sorted_additional = list()

/datum/player_list/proc/update_data()
	var/list/base_data = list()
	var/list/admin_sorted_additional = list()

	var/list/statistic_additional = list()
	admin_sorted_additional["statistic_additional"] = list("flags" = R_ADMIN, "data" = statistic_additional)

	var/list/player_additional = list()
	admin_sorted_additional["player_additional"] = list("flags" = R_ADMIN, "data" = player_additional)

	var/list/player_stealthed_additional = list()
	admin_sorted_additional["player_stealthed_additional"] = list("flags" = R_STEALTH, "data" = player_stealthed_additional)

	var/list/counted_additional = list(
		"lobby" = 0,
		"admin_observers" = 0,
		"observers" = 0,
		"playing" = 0,
	)

	// Running thru all clients and doing some counts
	for(var/client/client as anything in sortTim(GLOB.clients, GLOBAL_PROC_REF(cmp_ckey_asc)))
		var/list/client_payload = list()
		var/fake_key = client.holder?.fakekey
		client_payload["text"] = "[fake_key ? fake_key : client.key] ([round(C.avgping, 1)]ms)"
		client_payload["ckey_color"] = "white"

		base_data["total_players"] += list(list(client.key = list(client_payload.Copy())))
		player_additional["total_players"] += list(list(client.key = list(client_payload)))

		if(fake_key)
			client_payload["text"] += " (HIDDEN '[client.key]')"

		var/mob/client_mob = client.mob
		if(client_mob)
			if(istype(client_mob, /mob/dead/new_player))
				client_payload["text"] += " - in Lobby"
				counted_additional["lobby"]++

			else if(isobserver(client_mob))
				client_payload["text"] += " - Playing as [client_mob.real_name]"
				if(check_rights_for(client, R_ADMIN))
					counted_additional["admin_observers"]++
				else
					counted_additional["observers"]++

				var/mob/dead/observer/observer = client_mob
				if(observer.started_as_observer)
					client_payload["color"] = "#ce89cd"
					client_payload["text"] += " - Spectating"
				else
					client_payload["color"] = "#A000D0"
					client_payload["text"] += " - DEAD"

			else
				client_payload["text"] += " - Playing as [client_mob.real_name]"

				switch(client_mob.stat)
					if(UNCONSCIOUS)
						client_payload["color"] = "#B0B0B0"
						client_payload["text"] += " - Unconscious"
					if(DEAD)
						client_payload["color"] = "#A000D0"
						client_payload["text"] += " - DEAD"

				if(client_mob.stat != DEAD)
					counted_additional["playing"]++

				if(is_special_character(client.mob))
					client_payload["color"] = "#894444"
					client_payload["text"] += " (Antagonist)"

	//Bulky section with pre writen names and desc for counts
	statistic_additional += list(list("content" = "In Lobby: [counted_additional["lobby"]]", "color" = "#777", "text" = "Player in lobby"))
	statistic_additional += list(list("content" = "Spectating Players: [counted_additional["observers"]]", "color" = "#777", "text" = "Spectating players"))
	statistic_additional += list(list("content" = "Spectating Admins: [counted_additional["admin_observers"]]", "color" = "#777", "text" = "Spectating administrators"))
	statistic_additional += list(list("content" = "Playing: [counted_additional["playing"]]", "color" = "#249408", "text" = "Players playing"))

	src.base_data = base_data
	src.admin_sorted_additional = admin_sorted_additional

/datum/player_list/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, tgui_name, tgui_interface_name)
		ui.open()
		ui.set_autoupdate(TRUE)

/datum/player_list/ui_data(mob/user)
	. = list()
	// Sending base client data, this data sended to EVERYONE
	.["base_data"] = base_data

	// Admin rights based data
	if(!check_rights_for(user.client, R_ADMIN))
		return
	for(var/data_packet_name in admin_sorted_additional) // One by one for Drulikar complains
		if(!check_rights_for(user.client, admin_sorted_additional[data_packet_name]["flags"]))
			continue
		. += list("[data_packet_name]" = admin_sorted_additional[data_packet_name]["data"])

/datum/player_list/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("get_player_panel")
			if(!check_rights_for(ui.user.client, R_ADMIN))
				return
			var/chosen_ckey = params["ckey"]
			for(var/client/target in GLOB.clients)
				if(target.key != chosen_ckey)
					continue
				if(target.mob)
					var/datum/admins/holder = GLOB.admin_datums[ui.user.client.ckey]
					holder.show_player_panel(target.mob)
				break

/datum/player_list/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE


// STAFF DATA
/datum/player_list/staff
	tgui_name = "StaffWho"
	tgui_interface_name = "Staff Who"

/datum/player_list/staff/update_data()
	var/list/base_data = list()
	var/list/admin_sorted_additional = list()

	var/list/admin_additional = list()
	admin_sorted_additional["admin_additional"] = list("flags" = R_ADMIN, "data" = admin_additional)

	var/list/listings = list(
		"Management" = list(R_PERMISSIONS, list(), "purple"),
		"Administrators" = list(R_ADMIN, list(), "red"),
		"Moderators" = list(R_BAN, list(), "orange"),
		"Mentors" = list(0, GLOB.mentors, "green")
	)

	for(var/client/client as anything in GLOB.admins)
		for(var/category in listings)
			if(listings[category][1] && check_rights_for(client, listings[category][1]))
				listings[category][2] += client
				break

	for(var/category in listings)
		base_data["categories"] += list(list(
			"category" = category,
			"category_color" = listings[category][3],
		))

		for(var/client/client as anything in listings[category][2])
			var/list/admin_payload = list()
			admin_payload["category"] = category
			var/rank = client.holder.rank

			admin_additional["total_admins"] += list(list("[client.key] ([rank])" = list(admin_payload)))
			if(client.holder?.fakekey)
				admin_payload["special_color"] = "#7b582f"
				admin_payload["special_text"] += " (HIDDEN AS '[client.holder?.fakekey]')"
			else
				admin_payload["special_text"] += " ([round(client.avgping, 1)]ms)"
				base_data["total_admins"] += list(list("[client.key] ([rank])" = list(admin_payload.Copy())))

			admin_payload["text"] = ""
			if(istype(client.mob, /mob/dead/observer))
				var/mob/dead/observer/observer = client.mob
				if(observer.started_as_observer)
					admin_payload["color"] = "#808080"
					admin_payload["text"] += "Spectating"
				else
					admin_payload["color"] = "#161616"
					admin_payload["text"] += "DEAD"

			else if(istype(client.mob, /mob/dead/new_player))
				admin_payload["color"] = "#FFFFFF"
				admin_payload["text"] += "in Lobby"
			else
				admin_payload["color"] = "#688944"
				admin_payload["text"] += "Playing"

			if(is_special_character(client.mob))
				admin_payload["color"] = "#894444"
				admin_payload["special_text"] += " (Antagonist)"

			if(client.is_afk())
				admin_payload["color"] = "#A040D0"
				admin_payload["special_text"] += " (AFK)"

	src.base_data = base_data
	src.admin_sorted_additional = admin_sorted_additional


// VERBS
/mob/verb/who()
	set category = "OOC"
	set name = "Who"

	SSwho.who.ui_interact(src)

/mob/verb/staffwho()
	set category = "Admin"
	set name = "StaffWho"

	SSwho.staff_who.ui_interact(src)
