/datum/world_topic
	/// query key
	var/key

	/// can be used with anonymous authentication
	var/anonymous = FALSE

	var/list/required_params = list()
	var/statuscode
	var/response
	var/data

/datum/world_topic/proc/CheckParams(list/params)
	var/list/missing_params = list()
	var/errorcount = 0

	for(var/param in required_params)
		if(!params[param])
			errorcount++
			missing_params += param

	if(errorcount)
		statuscode = 400
		response = "Bad Request - Missing parameters"
		data = missing_params
		return errorcount

/datum/world_topic/proc/Run(list/input)
	// Always returns true; actual details in statuscode, response and data variables
	return TRUE

// API INFO TOPICS

/datum/world_topic/api_get_authed_functions
	key = "api_get_authed_functions"
	anonymous = TRUE

/datum/world_topic/api_get_authed_functions/Run(list/input)
	. = ..()
	var/list/functions = GLOB.topic_tokens[input["auth"]]
	if(functions)
		statuscode = 200
		response = "Authorized functions retrieved"
		data = functions
	else
		statuscode = 401
		response = "Unauthorized - No functions found"
		data = null

// TOPICS

/datum/world_topic/ping
	key = "ping"
	anonymous = TRUE

/datum/world_topic/ping/Run(list/input)
	. = ..()
	statuscode = 200
	response = "Pong!"
	data = length(GLOB.clients)

/datum/world_topic/status
	key = "status"
	anonymous = TRUE

/datum/world_topic/status/Run(list/input)
	. = ..()

	data = list()

	data["round_id"] = null
	if(GLOB.round_id)
		data["round_id"] = GLOB.round_id

	data["enter"] = GLOB.enter_allowed

	data["map_name"] = null
	if(SSmapping.config)
		.["map_name"] = SSmapping.config.map_name

	data["players"] = length(GLOB.clients)

	data["revision"] = GLOB.revdata.commit
	data["revision_date"] = GLOB.revdata.date

	data["round_duration"] = SSticker ? round((world.time-SSticker.round_start_time)/10) : 0

	statuscode = 200
	response = "Status retrieved"

/datum/world_topic/status/authed
	key = "status_authed"
	anonymous = FALSE

/datum/world_topic/status/authed/Run(list/input)
	. = ..()

	var/list/adm = get_admin_counts()
	var/list/presentmins = adm["present"]
	var/list/afkmins = adm["afk"]
	data["admins"] = length(presentmins) + length(afkmins)
	data["gamestate"] = SSticker.current_state

	//Time dilation stats.
	data["time_dilation_current"] = SStime_track.time_dilation_current
	data["time_dilation_avg"] = SStime_track.time_dilation_avg
	data["time_dilation_avg_slow"] = SStime_track.time_dilation_avg_slow
	data["time_dilation_avg_fast"] = SStime_track.time_dilation_avg_fast

	data["mcpu"] = world.map_cpu
	data["cpu"] = world.cpu

/datum/world_topic/certify
	key = "certify"
	required_params = list("identifier", "discord_id")

/datum/world_topic/certify/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_token(input["identifier"])
	if(!player_link)
		statuscode = 500
		response = "Database query failed"
		return

	if(player_link.timestamp < world.realtime - 4 HOURS)
		statuscode = 501
		response = "Authentication timed out."
		return

	if(player_link.discord_id)
		statuscode = 503
		response = "Player already authenticated."
		return

	var/datum/discord_link_record/id_player_link = SSdiscord.find_discord_link_by_discord_id(input["discord_id"])
	if(id_player_link)
		statuscode = 504
		response = "Discord ID already verified."
		return

	var/datum/db_query/query = SSdbcore.NewQuery(
		"UPDATE [format_table_name("discord_links")] SET valid = 1, discord_id = :discord_id WHERE token = :token",
		list("discord_id" = input["discord_id"], "token" = input["identifier"])
	)
	query.Execute()
	qdel(query)

	statuscode = 200
	response = "Successfully certified."

/datum/world_topic/certify_by_ckey
	key = "certify_ckey"
	required_params = list("ckey", "discord_id")

/datum/world_topic/certify_by_ckey/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_token(input["ckey"])
	if(player_link && player_link.discord_id)
		statuscode = 503
		response = "Player already authenticated."
		return

	var/datum/discord_link_record/id_player_link = SSdiscord.find_discord_link_by_discord_id(input["discord_id"])
	if(id_player_link)
		statuscode = 504
		response = "Discord ID already verified."
		return

	if(player_link)
		var/datum/db_query/query = SSdbcore.NewQuery(
			"UPDATE [format_table_name("discord_links")] SET valid = 1, discord_id = :discord_id WHERE ckey = :ckey",
			list("discord_id" = input["discord_id"], "ckey" = input["ckey"])
		)
		query.Execute()
		qdel(query)
	else
		var/datum/db_query/query = SSdbcore.NewQuery(
			"INSERT INTO [format_table_name("discord_link")] (ckey, discord_id, valid) VALUES (:ckey, :discord_id, 1)",
			list("ckey" = input["ckey"], "discord_id" = input["discord_id"])
		)
		query.Execute()
		qdel(query)

	statuscode = 200
	response = "Successfully certified."

/datum/world_topic/decertify_by_ckey
	key = "decertify_ckey"
	required_params = list("ckey")

/datum/world_topic/decertify_by_ckey/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_ckey(input["ckey"])
	if(!player_link)
		statuscode = 500
		response = "Database lookup failed."
		return

	if(!player_link.discord_id)
		statuscode = 501
		response = "No linked Discord."
		return

	var/datum/db_query/query = SSdbcore.NewQuery(
		"DELETE [format_table_name("discord_links")] WHERE ckey = :ckey",
		list("ckey" = player_link.ckey)
	)
	query.Execute()
	qdel(query)

	data["discord_id"] = player_link.discord_id
	data["ckey"] = player_link.ckey
	statuscode = 200
	response = "Decertification successful."

/datum/world_topic/decertify_by_discord_id
	key = "decertify_discord_id"
	required_params = list("discord_id")

/datum/world_topic/decertify_by_discord_id/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_discord_id(input["discord_id"])
	if(!player_link)
		statuscode = 500
		response = "Database lookup failed."
		return

	var/datum/db_query/query = SSdbcore.NewQuery(
		"DELETE [format_table_name("discord_links")] WHERE ckey = :ckey",
		list("ckey" = player_link.ckey)
	)
	query.Execute()
	qdel(query)

	data["discord_id"] = player_link.discord_id
	data["ckey"] = player_link.ckey
	statuscode = 200
	response = "Decertification successful."

/datum/world_topic/lookup_discord_id
	key = "lookup_discord_id"
	required_params = list("discord_id")

/datum/world_topic/lookup_discord_id/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_discord_id(input["discord_id"])
	if(!player_link)
		statuscode = 501
		response = "No linked Discord."
		return

	data["ckey"] = player_link.ckey
	data["discord_id"] = player_link.discord_id
	statuscode = 200
	response = "Lookup successful."

/datum/world_topic/lookup_ckey
	key = "lookup_ckey"
	required_params = list("ckey")

/datum/world_topic/lookup_ckey/Run(list/input)
	data = list()

	var/datum/discord_link_record/player_link = SSdiscord.find_discord_link_by_ckey(input["ckey"])
	if(!player_link)
		statuscode = 500
		response = "Database lookup failed."
		return

	data["ckey"] = player_link.ckey
	data["discord_id"] = player_link.discord_id
	statuscode = 200
	response = "Lookup successful."
