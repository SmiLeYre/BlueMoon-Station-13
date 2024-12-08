/**
  * HTTP Get (Powered by RUSTG)
  *
  * This proc should be used as a replacement for [/world/proc/Export] due to an underlying issue with it.
  * See: https://www.byond.com/forum/post/2772166
  * The one thing you will need to be aware of is that this no longer wraps the response inside a "file", so anything that relies on a file2text() unwrap will need tweaking.
  * RUST HTTP also has better support for HTTPS as well as weird quirks with modern webservers.
  * Returns an assoc list that follows the standard [/world/proc/Export] format (https://secure.byond.com/docs/ref/index.html#/world/proc/Export), with the above exception
  *
  * Arguments:
  * * url - URL to GET
  */
/proc/HTTPGet(url)
	var/datum/http_request/req = new
	req.prepare(RUSTG_HTTP_METHOD_GET, url)
	req.begin_async()

	// Check if we are complete
	UNTIL(req.is_complete())
	var/datum/http_response/res = req.into_response()

	if(res.errored)
		. = list() // Return an empty list
		CRASH("Internal error during HTTP get: [res.error]")

	var/list/output = list()
	output["STATUS"] = res.status_code

	// Handle changes of line format. ASCII 13 = CR
	var/content = replacetext(res.body, "[ascii2text(13)]\n", "\n")
	output["CONTENT"] = content

	return output

/proc/log_connection(ckey, ip, cid, connection_type)
	ASSERT(connection_type in list(CONNECTION_TYPE_ESTABLISHED, CONNECTION_TYPE_DROPPED_IPINTEL, CONNECTION_TYPE_DROPPED_BANNED, CONNECTION_TYPE_DROPPED_INVALID))
	var/datum/db_query/query_accesslog = SSdbcore.NewQuery("INSERT INTO connection_ipintel_log (`datetime`, `ckey`, `ip`, `computerid`, `result`, `server_id`) VALUES(Now(), :ckey, INET_ATON(:ip), :cid, :result, :server_id)", list(
		"ckey" = ckey,
		"ip" = "[ip ? ip : "127.0.0.1"]",
		"cid" = cid,
		"result" = connection_type,
		"server_id" = CONFIG_GET(string/servername)
	))
	query_accesslog.warn_execute()
	qdel(query_accesslog)
