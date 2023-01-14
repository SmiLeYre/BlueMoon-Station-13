/datum/keybinding/human/quick_equip_suitstorage
	hotkey_keys = list("ShiftQ")
	name = "quick_equipsuitstorage"
	full_name = "Quick suit storage"
	description = "Put held thing in suit storage or take the item from it"

/datum/keybinding/human/quick_equip_suitstorage/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.smart_equip_suitstorage()
	return TRUE

/datum/keybinding/human/quick_equip_lpocket
	hotkey_keys = list("Unbound")
	name = "quick_equip_lpocket"
	full_name = "Quick left pocket"
	description = "Put held thing in left pocket or take the item from it"

/datum/keybinding/human/quick_equip_lpocket/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.smart_equip_lpocket()
	return TRUE

/datum/keybinding/human/quick_equip_rpocket
	hotkey_keys = list("Unbound")
	name = "quick_equip_rpocket"
	full_name = "Quick right pocket"
	description = "Put held thing in right pocket or take the item from it"

/datum/keybinding/human/quick_equip_rpocket/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.smart_equip_rpocket()
	return TRUE
