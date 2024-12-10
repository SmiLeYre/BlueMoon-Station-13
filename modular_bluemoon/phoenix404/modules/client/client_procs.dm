/client/proc/is_connecting_from_localhost()
	var/static/list/localhost_addresses = list("127.0.0.1", "::1")
	if((!address && !world.port) || (address in localhost_addresses))
		return TRUE
	return FALSE
