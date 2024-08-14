#define JUKEBOX_MAX_SONGS_PER_PAGE 25
/obj/item/jukebox
	var/ui_page = 0
	var/static/list/cached_songs
	var/list/queried_songs


/obj/item/jukebox/proc/get_cached_songs()
	LAZYINITLIST(cached_songs)

	if (!length(cached_songs))
		for(var/datum/track/S in SSjukeboxes.songs)
			cached_songs += S.song_name

	return cached_songs


/obj/item/jukebox/proc/get_songs()
	if (isnull(queried_songs))
		return get_cached_songs()
	return queried_songs


/obj/item/jukebox/proc/get_max_page_count()
	return CEILING(length(get_songs()) / JUKEBOX_MAX_SONGS_PER_PAGE, 1)


/obj/item/jukebox/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	// Здесь мы везде эксплуатируем queuecooldown,
	// чтоб интерфейс не затыкивали
	if(world.time < queuecooldown)
		return

	switch(action)
		if ("next_page")
			queuecooldown = world.time + (1 SECONDS)
			ui_page = (ui_page + 1) % get_max_page_count()
			return TRUE

		if ("prev_page")
			var/max_pages = get_max_page_count()
			queuecooldown = world.time + (1 SECONDS)
			ui_page = (ui_page + max_pages - 1) % max_pages
			return TRUE

		if ("search")
			var/query = params["query"]

			if (!query || !istext(query))
				queried_songs = null
				return TRUE

			if (length_char(query) > 32)
				query = copytext_char(query, 1, 33)

			do_search_query(query)
			return TRUE


/obj/item/jukebox/proc/do_search_query(query)
	queried_songs = simple_search(query, get_cached_songs(), case_sensitive = FALSE)
	ui_page = 0


/obj/item/jukebox/ui_data(mob/user)
	var/list/data = ..()

	var/list/songs = get_songs()
	data["songs"] = songs.Copy(
		(ui_page * JUKEBOX_MAX_SONGS_PER_PAGE) + 1,
		min((ui_page + 1) * JUKEBOX_MAX_SONGS_PER_PAGE, length(songs)) + 1
	)

	data["current_page"] = ui_page + 1
	data["pages"] = get_max_page_count()

	return data


///// <Moniq mod>
/obj/item/sign/moniq
	var/ui_page = 0
	var/static/list/cached_songs
	var/list/queried_songs


/obj/item/sign/moniq/proc/get_cached_songs()
	LAZYINITLIST(cached_songs)

	if (!length(cached_songs))
		for(var/datum/track/S in SSjukeboxes.songs)
			cached_songs += S.song_name

	return cached_songs


/obj/item/sign/moniq/proc/get_songs()
	if (isnull(queried_songs))
		return get_cached_songs()
	return queried_songs


/obj/item/sign/moniq/proc/get_max_page_count()
	return CEILING(length(get_songs()) / JUKEBOX_MAX_SONGS_PER_PAGE, 1)


/obj/item/sign/moniq/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	// Здесь мы везде эксплуатируем queuecooldown,
	// чтоб интерфейс не затыкивали
	if(world.time < queuecooldown)
		return

	switch(action)
		if ("next_page")
			queuecooldown = world.time + (1 SECONDS)
			ui_page = (ui_page + 1) % get_max_page_count()
			return TRUE

		if ("prev_page")
			var/max_pages = get_max_page_count()
			queuecooldown = world.time + (1 SECONDS)
			ui_page = (ui_page + max_pages - 1) % max_pages
			return TRUE

		if ("search")
			var/query = params["query"]

			if (!query || !istext(query))
				queried_songs = null
				return TRUE

			if (length_char(query) > 32)
				query = copytext_char(query, 1, 33)

			do_search_query(query)
			return TRUE


/obj/item/sign/moniq/proc/do_search_query(query)
	queried_songs = simple_search(query, get_cached_songs(), case_sensitive = FALSE)
	ui_page = 0


/obj/item/sign/moniq/ui_data(mob/user)
	var/list/data = ..()

	var/list/songs = get_songs()
	data["songs"] = songs.Copy(
		(ui_page * JUKEBOX_MAX_SONGS_PER_PAGE) + 1,
		min((ui_page + 1) * JUKEBOX_MAX_SONGS_PER_PAGE, length(songs)) + 1
	)

	data["current_page"] = ui_page + 1
	data["pages"] = get_max_page_count()

	return data

 //<\Moniq mod>
#undef JUKEBOX_MAX_SONGS_PER_PAGE
