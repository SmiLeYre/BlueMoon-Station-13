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

/datum/sprite_accessory/mam_body_markings/plain_style/chest_highlight_1
	name = "Partial - Plain - Chest Highlight 1"
	icon_state = "chest_highlight_1"
	covered_limbs = list("Chest" =  MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/plain_style/upper_press_gradient_light
	name = "Partial - Plain - Upper Press Gradient (light)"
	icon_state = "upper_press_gradient_light"
	covered_limbs = list("Chest" =  MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/plain_style/abdominals
	name = "Partial - Plain - Light Abdominals"
	icon_state = "light_abdominals"
	covered_limbs = list("Chest" =  MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/plain_style/nipples
	name = "Partial - Plain - Nipples"
	icon_state = "nipples"
	covered_limbs = list("Chest" =  MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/plain_style/inner_thighs_1
	name = "Partial - Plain - Inner Thighs 1"
	icon_state = "inner_thighs_1"
	covered_limbs = list("Chest" =  MATRIX_RED, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED)
