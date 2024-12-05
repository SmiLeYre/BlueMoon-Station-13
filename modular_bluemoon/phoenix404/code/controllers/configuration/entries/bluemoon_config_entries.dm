/// Defines whether or not mentors can see ckeys alongside mobnames.
/datum/config_entry/flag/mentors_mobname_only

/// Defines whether the server uses the legacy mentor system with mentors.txt or the SQL system.
/datum/config_entry/flag/mentor_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/ipintel_base
	default = "check.getipintel.net"

/datum/config_entry/string/ipintel_email

/datum/config_entry/string/ipintel_email/ValidateAndSet(str_val)
	return str_val != "ch@nge.me" && (!length(str_val) || findtext(str_val, "@")) && ..()

/datum/config_entry/number/ipintel_rating_bad
	default = 1
	integer = FALSE
	min_val = 0
	max_val = 1

/datum/config_entry/flag/ipintel_reject_rate_limited
	default = FALSE

/datum/config_entry/flag/ipintel_reject_bad
	default = FALSE

/datum/config_entry/flag/ipintel_reject_unknown
	default = FALSE

/datum/config_entry/number/ipintel_rate_minute
	default = 15
	min_val = 0

/datum/config_entry/number/ipintel_cache_length
	default = 7
	min_val = 0

/datum/config_entry/number/ipintel_exempt_playtime_living
	default = 5
	min_val = 0
