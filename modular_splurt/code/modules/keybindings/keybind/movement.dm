/datum/keybinding/mob/tilt_right
	hotkey_keys = list("AltCtrlEast", "AltCtrlD")
	name = "pixel_tilt_east"
	full_name = "Pixel Tilt Right"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_right/down(client/user)
	var/mob/M = user.mob
	M.tilt_right()
	return TRUE

/datum/keybinding/mob/tilt_left
	hotkey_keys = list("AltCtrlWest", "AltCtrlA")
	name = "pixel_tilt_west"
	full_name = "Pixel Tilt Left"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_left/down(client/user)
	var/mob/M = user.mob
	M.tilt_left()
	return TRUE

/datum/keybinding/mob/pixel_shift/shift_north
	hotkey_keys = list("CtrlShiftW", "CtrlShiftNorth")
	name = "pixel_shift_north"
	full_name = "Pixel Shift North"

/datum/keybinding/mob/pixel_shift/shift_north/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(NORTH)
	return TRUE

/datum/keybinding/mob/pixel_shift/shift_east
	hotkey_keys = list("CtrlShiftD", "CtrlShiftEast")
	name = "pixel_shift_east"
	full_name = "Pixel Shift East"

/datum/keybinding/mob/pixel_shift/shift_east/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(EAST)
	return TRUE

/datum/keybinding/mob/pixel_shift/shift_south
	hotkey_keys = list("CtrlShiftS", "CtrlShiftSouth")
	name = "pixel_shift_south"
	full_name = "Pixel Shift South"

/datum/keybinding/mob/pixel_shift/shift_south/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(SOUTH)
	return TRUE

/datum/keybinding/mob/pixel_shift/shift_west
	hotkey_keys = list("CtrlShiftA", "CtrlShiftWest")
	name = "pixel_shift_west"
	full_name = "Pixel Shift West"

/datum/keybinding/mob/pixel_shift/shift_west/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(WEST)
	return TRUE
