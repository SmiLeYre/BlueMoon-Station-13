/obj/machinery/jukebox/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if ("random_song")
			ui_act("add_to_queue", list("track" = pick(cached_songs)), ui, state)
			return TRUE


/obj/item/jukebox/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if ("random_song")
			ui_act("add_to_queue", list("track" = pick(cached_songs)), ui, state)
			return TRUE

/obj/item/sign/moniq/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if ("random_song")
			ui_act("add_to_queue", list("track" = pick(cached_songs)), ui, state)
			return TRUE

/obj/structure/sign/moniq/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if ("random_song")
			ui_act("add_to_queue", list("track" = pick(cached_songs)), ui, state)
			return TRUE
