/datum/config_entry/flag/allow_silicon_choosing_laws

/datum/config_entry/keyed_list/choosable_laws
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_TYPE
	splitter = " | "
	lowercase_key = FALSE

/// Ticket ping frequency. Set 0 for disable that subsystem. 3000 - 5 minutes, 600 - 1 minute.
/datum/config_entry/number/ticket_ping_frequency
