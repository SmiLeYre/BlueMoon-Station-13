// В основном, предназначено для акрадоров
// Маркинги, подразумевающиеся как линии на теле и т.п.

// Выделение плеч

/datum/sprite_accessory/mam_body_markings/plain_style
	icon = 'modular_bluemoon/icons/mob/body_markings/plain.dmi'

/datum/sprite_accessory/mam_body_markings/plain_style/arms_outer
	name = "Partial - Plain - Arms Outerline"
	icon_state = "arms_outerline"
	covered_limbs = list("Left Arm" =  MATRIX_RED, "Right Arm" =  MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/plain_style/arms_outer/reversed
	name = "Partial - Plain - Arms Outerline - Reversed"
	icon_state = "arms_outerline_reversed"

/datum/sprite_accessory/mam_body_markings/plain_style/torso_highlight_1
	name = "Partial - Plain - Torso Highlight 1"
	icon_state = "torso_highlight_1"
	covered_limbs = list("Chest" =  MATRIX_RED)
	gender_specific = TRUE
