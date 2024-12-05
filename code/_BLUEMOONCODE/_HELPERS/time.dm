//returns timestamp in a sql and a not-quite-compliant ISO 8601 friendly format
/proc/ISOtime(timevar)
	return time2text(timevar || world.timeofday, "YYYY-MM-DD hh:mm:ss")
