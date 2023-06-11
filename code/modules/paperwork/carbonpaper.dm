/obj/item/paper/carbon
	name = "sheet of carbon"
	icon_state = "paper_stack"
	item_state = "paper"
	// item_state = "paper"
	show_written_words = FALSE
	var/copied = FALSE
	var/iscopy = FALSE

/obj/item/paper/carbon/update_icon_state()
	if(default_raw_text)
		icon_state = "[icon_state]_words"
		return ..()
	if(iscopy)
		icon_state = "cpaper"
		return ..()
	if(copied)
		icon_state = "paper"
		return ..()

	icon_state = "paper_stack"
	return ..()

/obj/item/paper/carbon/proc/removecopy(mob/living/user)
	if(!copied)
		var/obj/item/paper/carbon/C = src
		var/copycontents = C.default_raw_text
		var/obj/item/paper/carbon/Copy = new /obj/item/paper/carbon(user.loc)

		if(default_raw_text)
			copycontents = replacetext(copycontents, "<font face=\"[PEN_FONT]\" color=", "<font face=\"[PEN_FONT]\" nocolor=")
			copycontents = replacetext(copycontents, "<font face=\"[CRAYON_FONT]\" color=", "<font face=\"[CRAYON_FONT]\" nocolor=")
			Copy.default_raw_text += copycontents
			Copy.default_raw_text += "</font>"
			Copy.name = "Copy - [C.name]"
		to_chat(user, "<span class='notice'>You tear off the carbon-copy!</span>")
		C.copied = TRUE
		Copy.iscopy = TRUE
		Copy.update_icon_state()
		C.update_icon_state()
		user.put_in_hands(Copy)
	else
		to_chat(user, "<span class='notice'>There are no more carbon copies attached to this paper!</span>")

/obj/item/paper/carbon/on_attack_hand(mob/living/user)
	if(loc == user && user.is_holding(src))
		removecopy(user)
		return
	return ..()
