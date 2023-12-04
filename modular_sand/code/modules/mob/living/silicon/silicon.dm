/mob/living/silicon
	examine_cursor_icon = null
	combat_cursor_icon = null
	pull_cursor_icon = null
	throw_cursor_icon = null

/mob/living/silicon/verb/robot_nom(mob/living/T in oview(1))
	set name = "Eat Mob"
	set category = "Vore"
	set desc = "Allows you to eat someone."

	if(!CHECK_BITFIELD(T.vore_flags, DEVOURABLE))
		to_chat(src, "<span class='warning'>System error: Unauthorized operation.</span>")
		return
	return feed_grabbed_to_self(src,T)
