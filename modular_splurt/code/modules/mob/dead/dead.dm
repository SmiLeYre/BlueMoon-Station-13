/mob/dead/check_out(atom/A)
	if (!CONFIG_GET(flag/ghost_interaction))
		to_chat(usr, "<span class='notice'>You cannot check out people when dead!</span>")
		return
	. = ..()
