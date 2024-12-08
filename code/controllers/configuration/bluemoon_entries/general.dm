/// Defines whether or not mentors can see ckeys alongside mobnames.
/datum/config_entry/flag/mentors_mobname_only

/// Defines whether the server uses the legacy mentor system with mentors.txt or the SQL system.
/datum/config_entry/flag/mentor_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/flag/ipintel_enabled
	default = FALSE

/datum/config_entry/string/ipintel_domain
	default = "check.getipintel.net"

/datum/config_entry/string/details_url
	default = "https://iphub.info/?ip="

/datum/config_entry/string/contact_email

/datum/config_entry/string/contact_email/ValidateAndSet(str_val)
	return str_val != "ch@nge.me" && (!length(str_val) || findtext(str_val, "@")) && ..()

/datum/config_entry/number/bad_rating
	default = 0.9
	integer = FALSE
	min_val = 0
	max_val = 1

/datum/config_entry/flag/whitelist_mode
	default = TRUE

/datum/config_entry/number/hours_save_good
	default = 72
	min_val = 0

/datum/config_entry/number/hours_save_bad
	default = 24
	min_val = 0

/datum/config_entry/number/playtime_ignore_threshold
	default = 10
	min_val = 0
