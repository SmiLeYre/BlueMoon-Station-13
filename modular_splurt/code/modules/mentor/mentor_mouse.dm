/client
	COOLDOWN_DECLARE(mentor_mouse_spawn)

/client/proc/spawn_mentor_mouse()
	set name = "Spawn Mentor Mouse"
	set category = "Mentor"

	if(!isobserver(mob))
		to_chat(src, span_warning("You must be a ghost to use this verb!"))
		return
	if(!COOLDOWN_FINISHED(src, mentor_mouse_spawn))
		to_chat(src, span_warning("Please wait [DisplayTimeText(COOLDOWN_TIMELEFT(src, mentor_mouse_spawn))]"))
		return

	var/turf/current_turf = get_turf(mob)
	var/mob/living/simple_animal/hostile/syndimouse/mentor = new(current_turf)

	QDEL_IN(mob, 1)

	if(mob?.mind && isliving(mentor))
		mob?.mind.transfer_to(mentor, TRUE)
	else
		mob?.transfer_ckey(mentor)

	add_verb(src, /client/proc/despawn_mentor_mouse)
	remove_verb(src, /client/proc/spawn_mentor_mouse)
	message_admins("[ADMIN_LOOKUPFLW(src)] Spawned as a mentor mouse.")
	log_mentor("[key_name(src)] Spawned as a mentor mouse.")
	COOLDOWN_START(src, mentor_mouse_spawn, 30 SECONDS)

/client/proc/despawn_mentor_mouse()
	set name = "Despawn Mentor Mouse"
	set category = "Mentor"

	if(!istype(mob, /mob/living/simple_animal/hostile/syndimouse))
		to_chat(src, span_warning("You're not a Mentor Mouse!"))
		remove_verb(src, /client/proc/despawn_mentor_mouse)
		add_verb(src, /client/proc/spawn_mentor_mouse)
		return
	if(!COOLDOWN_FINISHED(src, mentor_mouse_spawn))
		to_chat(src, span_warning("Please wait [DisplayTimeText(COOLDOWN_TIMELEFT(src, mentor_mouse_spawn))]"))
		return

	QDEL_IN(mob, 1)

	add_verb(src, /client/proc/spawn_mentor_mouse)
	remove_verb(src, /client/proc/despawn_mentor_mouse)
	message_admins("[ADMIN_LOOKUPFLW(src)] Despawned their mentor mouse.")
	log_mentor("[key_name(src)] Despawned their mentor mouse.")
	COOLDOWN_START(src, mentor_mouse_spawn, 30 SECONDS)
