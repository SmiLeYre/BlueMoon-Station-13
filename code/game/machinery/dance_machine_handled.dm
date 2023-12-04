/obj/item/jukebox
	name = "Handled Jukebox"
	desc = "Переносная колонка для крутых."
	icon = 'modular_citadel/icons/obj/boombox.dmi'
	righthand_file = 'modular_citadel/icons/obj/boombox_righthand.dmi'
	lefthand_file = 'modular_citadel/icons/obj/boombox_lefthand.dmi'
	item_state = "raiqbawks"
	icon_state = "raiqbawks"
	verb_say = "states"
	density = TRUE
	var/active = FALSE
	var/list/rangers = list()
	var/stop = 0
	var/volume = 100
	var/queuecost = PRICE_CHEAP //Set to -1 to make this jukebox require access for queueing
	var/datum/track/playing = null
	var/datum/track/selectedtrack = null
	var/list/queuedplaylist = list()
	var/queuecooldown //This var exists solely to prevent accidental repeats of John Mulaney's 'What's New Pussycat?' incident. Intentional, however......

/obj/item/jukebox/emagged
	name = "Handled Jukebox"
	desc = "Переносная колонка для крутых. ТЕПЕРЬ ВЗЛОМАННАЯ."
	obj_flags = EMAGGED
	queuecost = PRICE_FREE

///obj/item/jukebox/emag_act(mob/user)
//	. = ..()
//	if(obj_flags & EMAGGED)
//		return
//	log_admin("[key_name(usr)] emagged [src] at [AREACOORD(src)]")
//	obj_flags |= EMAGGED
//	queuecost = PRICE_FREE
//	req_one_access = null
//	to_chat(user, "<span class='notice'>You've bypassed [src]'s audio volume limiter, and enabled free play.</span>")
//	return TRUE

/obj/item/jukebox/update_icon_state()
	if(active)
		icon_state = "[initial(icon_state)]-active"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/jukebox/ui_status(mob/user)
	if((queuecost < 0 && !allowed(user)) && !isobserver(user))
		to_chat(user,"<span class='warning'>Error: Access Denied.</span>")
		user.playsound_local(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	if(!SSjukeboxes.songs.len && !isobserver(user))
		to_chat(user,"<span class='warning'>Error: No music tracks have been authorized for your station. Petition Central Command to resolve this issue.</span>")
		playsound(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	return ..()

/obj/item/jukebox/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Jukebox", name)
		ui.open()

/obj/item/jukebox/ui_data(mob/user)
	var/list/data = list()
	data["active"] = active
	data["songs"] = list()
	for(var/datum/track/S in SSjukeboxes.songs)
		var/list/track_data = list(name = S.song_name)
		data["songs"] += list(track_data)
	data["queued_tracks"] = list()
	for(var/datum/track/S in queuedplaylist)
		var/list/track_data = list(name = S.song_name)
		data["queued_tracks"] += list(track_data)
	data["track_selected"] = null
	data["track_length"] = null
	if(playing)
		data["track_selected"] = playing.song_name
		data["track_length"] = DisplayTimeText(playing.song_length)
	data["volume"] = volume
	data["is_emagged"] = (obj_flags & EMAGGED)
	data["cost_for_play"] = queuecost
	data["has_access"] = allowed(user)
	return data

/obj/item/jukebox/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle")
			if(QDELETED(src))
				return
			if(!allowed(usr))
				return
			if(!active && !playing)
				activate_music()
			else
				stop = 0
			return TRUE
		if("add_to_queue")
			var/list/available = list()
			for(var/datum/track/S in SSjukeboxes.songs)
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selectedtrack = available[selected]
			if(world.time < queuecooldown)
				return
			if(!istype(selectedtrack, /datum/track))
				return
			if(!allowed(usr) && queuecost)
				var/obj/item/card/id/C
				if(isliving(usr))
					var/mob/living/L = usr
					C = L.get_idcard(TRUE)
				to_chat(usr, "<span class='notice'>You spend [queuecost] credits to queue [selectedtrack.song_name].</span>")
				log_econ("[queuecost] credits were inserted into [src] by [key_name(usr)] (ID: [C.registered_name]) to queue [selectedtrack.song_name].")
			queuedplaylist += selectedtrack
			if(active)
				say("[selectedtrack.song_name] has been added to the queue.")
			else if(!playing)
				activate_music()
			playsound(src, 'sound/machines/ping.ogg', 50, TRUE)
			queuecooldown = world.time + (3 SECONDS)
			return TRUE
		if("select_track")
			var/list/available = list()
			for(var/datum/track/S in SSjukeboxes.songs)
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selectedtrack = available[selected]
			return TRUE
		if("set_volume")
			if(!allowed(usr))
				return
			var/new_volume = params["volume"]
			if(new_volume  == "reset")
				volume = initial(volume)
			else if(new_volume == "min")
				volume = 0
			else if(new_volume == "max")
				volume = ((obj_flags & EMAGGED) ? 1000 : 100)
			else if(text2num(new_volume) != null)
				volume = clamp(0, text2num(new_volume), ((obj_flags & EMAGGED) ? 1000 : 100))
			var/wherejuke = SSjukeboxes.findjukeboxindex(src)
			if(wherejuke)
				SSjukeboxes.updatejukebox(wherejuke, jukefalloff = volume/35)
			return TRUE

/obj/item/jukebox/proc/activate_music()
	if(playing || !queuedplaylist.len)
		return FALSE
	playing = queuedplaylist[1]
	var/jukeboxslottotake = SSjukeboxes.addjukebox(src, playing, volume/35)
	if(jukeboxslottotake)
		active = TRUE
		update_icon()
		START_PROCESSING(SSobj, src)
		stop = world.time + playing.song_length
		queuedplaylist.Cut(1, 2)
		say("Сейчас играет: [playing.song_name]")
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, TRUE)
		return TRUE
	else
		return FALSE

/obj/item/jukebox/proc/dance_over()
	var/position = SSjukeboxes.findjukeboxindex(src)
	if(!position)
		return
	SSjukeboxes.removejukebox(position)
	STOP_PROCESSING(SSobj, src)
	playing = null
	rangers = list()

/obj/item/jukebox/process()
	if(active)
		if(world.time >= stop)
			active = FALSE
			dance_over()
			if(stop && queuedplaylist.len)
				activate_music()
			else
				playsound(src,'sound/machines/terminal_off.ogg',50,1)
				update_icon()
				playing = null
				stop = 0
