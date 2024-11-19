/proc/check_whitelist(key)
	if(!SSdbcore.Connect())
		log_world("Failed to connect to database in check_whitelist(). Disabling whitelist for current round.")
		WRITE_FILE(GLOB.world_game_log, "Failed to connect to database in check_whitelist(). Disabling whitelist for current round.")
		CONFIG_SET(flag/usewhitelist, FALSE)
		return TRUE

	var/datum/db_query/query_get_whitelist = SSdbcore.NewQuery({"
		SELECT id FROM [format_table_name("whitelist")]
		WHERE ckey = :ckey and deleted = 0
	"}, list("ckey" = key)
	)

	if(!query_get_whitelist.Execute())
		log_sql("Whitelist check for ckey [key] failed to execute. Rejecting")
		message_admins("Whitelist check for ckey [key] failed to execute. Rejecting")
		qdel(query_get_whitelist)
		return FALSE

	var/allow = query_get_whitelist.NextRow()

	qdel(query_get_whitelist)

	return allow

/proc/format_table(headers, rows)
	var/list/column_widths = list()

	// Определяем ширину заголовков
	for (var/header in headers)
		column_widths += max(length(header), 1)

	// Определяем максимальную ширину для каждого столбца
	for (var/row in rows)
		for (var/i = 1, i <= length(row), i++)
			if (i > length(column_widths))
				column_widths += max(length("[row[i]]"), 1)
			else
				column_widths[i] = max(column_widths[i], length("[row[i]]"))

	// Формируем разделитель и заголовок
	var/table_output = ""
	var/divider = ""
	for (var/width in column_widths)
		for (var/j = 1, j <= width + 2, j++)
			divider += "-"
		divider += "+"
	divider = "|" + copytext(divider, 2) + "\n"
	table_output += divider

	// Формируем заголовок
	var/header_row = "|"
	for (var/i = 1, i <= length(headers), i++)
		header_row += " [headers[i]] "
		for (var/j = 1, j <= (column_widths[i] - length(headers[i])), j++)
			header_row += " "
		header_row += "|"
	table_output += header_row + "\n" + divider

	// Формируем строки
	for (var/row in rows)
		var/data_row = "|"
		for (var/i = 1, i <= length(row), i++)
			data_row += " [row[i]] "
			for (var/j = 1, j <= (column_widths[i] - length("[row[i]]")), j++)
				data_row += " "
			data_row += "|"
		table_output += data_row + "\n"
	table_output += divider

	return table_output

// usually, this would go into chat_commands.dm
// BUT i don't want to put so much code there
/datum/tgs_chat_command/whitelist
	name = "whitelist"
	help_text = "Usage: whitelist (add ckey (comment)|remove ckey (comment)|reload|list (limit)|logs (limit)|managerlog manager_id (limit)|useraudit ckey (limit))"
	admin_only = TRUE

/datum/tgs_chat_command/whitelist/Run(datum/tgs_chat_user/sender, params)
	// Declare variables before any code
	var/default_limit = 100
	var/limit
	var/comment
	var/manager_id
	var/key

	. = ""
	if(!CONFIG_GET(flag/usewhitelist))
		. += "The whitelist is not enabled!\nThe command will continue to execute anyway\n"

	var/list/all_params = splittext(params, " ")
	if(length(all_params) < 1)
		. += "[src.help_text]"
		return

	switch(all_params[1])
		if("add")
			if(length(all_params) < 2)
				. += "Invalid argument"
				return

			key = ckey(all_params[2])

			// Extract comment if any
			comment = ""
			if(length(all_params) > 2)
				var/pos = findtext(params, all_params[2]) + length(all_params[2]) + 1
				comment = copytext(params, pos)

			var/datum/db_query/query_get_whitelist = SSdbcore.NewQuery({"
				SELECT id FROM [format_table_name("whitelist")]
				WHERE ckey = :ckey
			"}, list("ckey" = key)
			)
			if(!query_get_whitelist.Execute())
				. += "Failed to add ckey `[key]`\n"
				. += query_get_whitelist.ErrorMsg()
				qdel(query_get_whitelist)
				return

			if(query_get_whitelist.NextRow())
				qdel(query_get_whitelist)

				var/datum/db_query/query_update_whitelist = SSdbcore.NewQuery({"
					UPDATE [format_table_name("whitelist")]
					SET deleted = 0, manager = :manager, manager_id = :manager_id, comment = :comment
					WHERE ckey = :ckey
				"}, list("ckey" = key, "manager" = sender.friendly_name, "manager_id" = sender.id, "comment" = comment))

				if(!query_update_whitelist.Execute())
					. += "Failed to update ckey `[key]`\n"
					. += query_update_whitelist.ErrorMsg()
					qdel(query_update_whitelist)
					return

				qdel(query_update_whitelist)

				. += "`[key]` has been re-added to the whitelist!\n"
				return

			qdel(query_get_whitelist)

			var/datum/db_query/query_add_whitelist = SSdbcore.NewQuery({"
				INSERT INTO [format_table_name("whitelist")] (ckey, manager, manager_id, comment)
				VALUES (:ckey, :manager, :manager_id, :comment)
			"}, list("ckey" = key, "manager" = sender.friendly_name, "manager_id" = sender.id, "comment" = comment))

			if(!query_add_whitelist.Execute())
				. += "Failed to add ckey `[key]`\n"
				. += query_add_whitelist.ErrorMsg()
				qdel(query_add_whitelist)
				return

			qdel(query_add_whitelist)

			. += "`[key]` has been added to the whitelist!\n"
			return

		if("remove")
			if(length(all_params) < 2)
				. += "Invalid argument"
				return

			key = ckey(all_params[2])

			// Extract comment if any
			comment = ""
			if(length(all_params) > 2)
				var/pos = findtext(params, all_params[2]) + length(all_params[2]) + 1
				comment = copytext(params, pos)

			var/datum/db_query/query_remove_whitelist = SSdbcore.NewQuery({"
				UPDATE [format_table_name("whitelist")]
				SET deleted = 1, manager = :manager, manager_id = :manager_id, comment = :comment
				WHERE ckey = :ckey
			"}, list("ckey" = key, "manager" = sender.friendly_name, "manager_id" = sender.id, "comment" = comment))

			if(!query_remove_whitelist.Execute())
				. += "Failed to remove ckey `[key]`"
				. += query_remove_whitelist.ErrorMsg()
				qdel(query_remove_whitelist)
				return

			qdel(query_remove_whitelist)

			. += "`[key]` has been removed from the whitelist!\n"
			return

		if("list")
			limit = default_limit  // Use default limit
			if(length(all_params) > 1)
				limit = text2num(all_params[2])
				if(!limit || limit <= 0)
					limit = default_limit

			var/datum/db_query/query_get_all_whitelist = SSdbcore.NewQuery({"
				SELECT ckey FROM [format_table_name("whitelist")] WHERE deleted = 0 ORDER BY last_modified DESC LIMIT :limit
			"}, list("limit" = limit))

			if(!query_get_all_whitelist.Execute())
				. += "Failed to get all whitelisted keys\n"
				. += query_get_all_whitelist.ErrorMsg()
				qdel(query_get_all_whitelist)
				return

			while(query_get_all_whitelist.NextRow())
				var/key_result = query_get_all_whitelist.item[1]
				. += "`[key_result]`\n"

			qdel(query_get_all_whitelist)
			return

		if("logs")
			limit = default_limit  // Use default limit
			if(length(all_params) > 1)
				limit = text2num(all_params[2])
				if(!limit || limit <= 0)
					limit = default_limit

			var/datum/db_query/query_get_logs = SSdbcore.NewQuery({"
				SELECT ckey, manager, manager_id, action, date, comment FROM [format_table_name("whitelist_log")]
				ORDER BY date DESC
				LIMIT :limit
			"}, list("limit" = limit))

			if(!query_get_logs.Execute())
				. += "Failed to get whitelist logs\n"
				. += query_get_logs.ErrorMsg()
				qdel(query_get_logs)
				return

			var/list/rows = list()
			while(query_get_logs.NextRow())
				rows += list(
					query_get_logs.item[1],
					query_get_logs.item[2],
					query_get_logs.item[3],
					query_get_logs.item[4],
					query_get_logs.item[5],
					query_get_logs.item[6],
					query_get_logs.item[7]
				)
			qdel(query_get_logs)

			var/list/headers = list("id", "ckey", "manager", "manager_id", "action", "date", "comment")
			. += "```\n"
			. += "Whitelist Log (last [limit] entries):\n"
			. += format_table(headers, rows)
			. += "```\n"
			return

		if("managerlog")
			if(length(all_params) < 2)
				. += "Invalid argument: manager_id is required."
				return

			manager_id = all_params[2]
			limit = default_limit  // Use default limit
			if(length(all_params) > 2)
				limit = text2num(all_params[3])
				if(!limit || limit <= 0)
					limit = default_limit

			var/datum/db_query/query_get_logs = SSdbcore.NewQuery({"
				SELECT id, ckey, manager, manager_id, action, date, comment FROM [format_table_name("whitelist_log")]
				WHERE manager_id =  REPLACE(REPLACE(:manager_id, '<@', ''), '>', '')
				ORDER BY date DESC
				LIMIT :limit
			"}, list("manager_id" = manager_id, "limit" = limit))

			if(!query_get_logs.Execute())
				. += "Failed to get logs for manager_id `[manager_id]`\n"
				. += query_get_logs.ErrorMsg()
				qdel(query_get_logs)
				return

			var/list/rows = list()
			while(query_get_logs.NextRow())
				rows += list(
					query_get_logs.item[1],
					query_get_logs.item[2],
					query_get_logs.item[3],
					query_get_logs.item[4],
					query_get_logs.item[5],
					query_get_logs.item[6],
					query_get_logs.item[7]
				)
			qdel(query_get_logs)

			var/list/headers = list("id", "ckey", "manager", "manager_id", "action", "date", "comment")
			. += "```\n"
			. += "Whitelist Log for manager_id `[manager_id]` (last [limit] entries):\n"
			. += format_table(headers, rows)
			. += "```\n"
			return

		if("useraudit")
			if(length(all_params) < 2)
				. += "Invalid argument: ckey is required."
				return

			key = ckey(all_params[2])
			limit = default_limit  // Use default limit
			if(length(all_params) > 2)
				limit = text2num(all_params[3])
				if(!limit || limit <= 0)
					limit = default_limit

			var/datum/db_query/query_get_logs = SSdbcore.NewQuery({"
				SELECT id, ckey, manager, manager_id, action, date, comment FROM [format_table_name("whitelist_log")]
				WHERE ckey = :ckey
				ORDER BY date DESC
				LIMIT :limit
			"}, list("ckey" = key, "limit" = limit))

			if(!query_get_logs.Execute())
				. += "Failed to get logs for ckey `[key]`\n"
				. += query_get_logs.ErrorMsg()
				qdel(query_get_logs)
				return

			var/list/rows = list()
			while(query_get_logs.NextRow())
				rows += list(
					query_get_logs.item[1],
					query_get_logs.item[2],
					query_get_logs.item[3],
					query_get_logs.item[4],
					query_get_logs.item[5],
					query_get_logs.item[6],
					query_get_logs.item[7]
				)
			qdel(query_get_logs)

			var/list/headers = list("id", "ckey", "manager", "manager_id", "action", "date", "comment")
			. += "```\n"
			. += "Whitelist Log for ckey `[key]` (last [limit] entries):\n"
			. += format_table(headers, rows)
			. += "```\n"
			return

		else
			. += "Unknown command!"
			. += "[src.help_text]"
			return
