/obj/item/clothing/suit/apron/chef/AltClick()
	if(!body_parts_covered)
		to_chat(usr, "<span class='notice'>Your [src] is now covering your chest and groin.</span>")
		body_parts_covered = CHEST|GROIN
	else
		to_chat(usr, "<span class='notice'>Your [src] is no longer covering anything.</span>")
		body_parts_covered = NONE
	return TRUE

/obj/item/clothing/neck/stole/AltClick()
	if(!body_parts_covered)
		to_chat(usr, "<span class='notice'>Your [src] is now covering your chest and groin.</span>")
		body_parts_covered = CHEST|GROIN
	else
		to_chat(usr, "<span class='notice'>Your [src] is no longer covering anything.</span>")
		body_parts_covered = NONE
	return TRUE

/obj/item/clothing/neck/mantle/AltClick()
	if(!body_parts_covered)
		to_chat(usr, "<span class='notice'>Your [src] is now covering your chest and groin.</span>")
		body_parts_covered = CHEST | ARMS
	else
		to_chat(usr, "<span class='notice'>Your [src] is no longer covering anything.</span>")
		body_parts_covered = NONE
	return TRUE
