/obj/item/clothing/under/misc/gear_harness
	can_adjust = FALSE
	body_parts_covered = NONE

/obj/item/clothing/under/misc/gear_harness/toggle_jumpsuit_adjust()
	// Alert user and return
	to_chat(usr, span_notice("[src] cannot be adjusted!"))
	return FALSE
