/*
 * EARS
 */

/datum/sprite_accessory/ears/mam_ears/acrador
	name = "Acrador Long"
	icon = 'modular_bluemoon/modules/acradors/acradors_ears.dmi'
	icon_state = "acrador_long"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/acrador/alt
	name = "Acrador Long (Alt)"
	icon_state = "acrador_long_alt"

/datum/sprite_accessory/ears/mam_ears/acrador/side
	name = "Acrador Long Side"
	icon_state = "acrador_long_side"

/datum/sprite_accessory/ears/mam_ears/acrador/side/alt
	name = "Acrador Long Side (Alt)"
	icon_state = "acrador_long_side_alt"

/datum/sprite_accessory/ears/mam_ears/acrador/short
	name = "Acrador Short"
	icon_state = "acrador_short"

/datum/sprite_accessory/ears/mam_ears/acrador/short/side
	name = "Acrador Short Side"
	icon_state = "acrador_short_side"

/datum/sprite_accessory/ears/mam_ears/acrador/short/side_alt
	name = "Acrador Short Side (Alt)"
	icon_state = "acrador_short_side_alt"

/datum/sprite_accessory/ears/mam_ears/acrador/short/side_alt_2
	name = "Acrador Short Side (Alt 2)"
	icon_state = "acrador_short_side_alt_2"
/*
 * SNOUTS
 */

/datum/sprite_accessory/snouts/mam_snouts/acrador
	name = "Acrador 1 (Short)"
	icon = 'modular_bluemoon/modules/acradors/acradors_snouts.dmi'
	icon_state = "acrador_1"
	matrixed_sections = MATRIX_ALL
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/snouts/mam_snouts/acrador/second
	name = "Acrador 2 (Normal)"
	icon_state = "acrador_2"

/datum/sprite_accessory/snouts/mam_snouts/acrador/third
	name = "Acrador 3 (Normal)"
	icon_state = "acrador_3"

/datum/sprite_accessory/snouts/mam_snouts/acrador/fourth
	name = "Acrador 4 (Normal)"
	icon_state = "acrador_4"

/datum/sprite_accessory/snouts/mam_snouts/acrador/fifth
	name = "Acrador 5 (Normal)"
	icon_state = "acrador_5"

/datum/sprite_accessory/snouts/mam_snouts/acrador/alt
	name = "Acrador 1 (Short) (Noseless)"
	icon_state = "acrador_1_alt"
	extra = NONE

/datum/sprite_accessory/snouts/mam_snouts/acrador/alt/second
	name = "Acrador 2 (Normal) (Noseless)"
	icon_state = "acrador_2_alt"

/datum/sprite_accessory/snouts/mam_snouts/acrador/alt/third
	name = "Acrador 3 (Normal) (Noseless)"
	icon_state = "acrador_3_alt"

/datum/sprite_accessory/snouts/mam_snouts/acrador/alt/fourth
	name = "Acrador 4 (Normal) (Noseless)"
	icon_state = "acrador_4_alt"

/datum/sprite_accessory/snouts/mam_snouts/acrador/alt/fifth
	name = "Acrador 5 (Normal) (Noseless)"
	icon_state = "acrador_5_alt"

/*
 * TAILS
 */

/datum/sprite_accessory/tails/mam_tails/acrador
	icon = 'modular_bluemoon/modules/acradors/acradors_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/acrador
	icon = 'modular_bluemoon/modules/acradors/acradors_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/acrador/femine
	name = "Acrador (Narrow)"
	icon_state = "acrador_1"

/datum/sprite_accessory/tails/mam_tails/acrador/normal
	name = "Acrador (Medium)"
	icon_state = "acrador_2"

/datum/sprite_accessory/tails/mam_tails/acrador/big
	name = "Acrador (Big)"
	icon_state = "acrador_3"

/datum/sprite_accessory/tails/mam_tails/acrador/femine_long
	name = "Acrador (Narrow and Long)"
	icon_state = "acrador_4"

/datum/sprite_accessory/tails_animated/mam_tails_animated/acrador/femine_long
	name = "Acrador (Narrow and Long)"
	icon_state = "acrador_4"

/datum/sprite_accessory/tails/mam_tails/acrador/femine_very_long
	name = "Acrador (Narrow and Very Long)"
	icon_state = "acrador_5"

/datum/sprite_accessory/tails_animated/mam_tails_animated/acrador/femine_very_long
	name = "Acrador (Narrow and Very Long)"
	icon_state = "acrador_5"

/*
 * NECK
 */

/datum/sprite_accessory/insect_fluff/acradors_neckfluff
	icon = 'modular_bluemoon/modules/acradors/acradors_neck.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	relevant_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/insect_fluff/acradors_neckfluff/first
	name = "Neckfluff (Acradors 1)"
	icon_state = "neckfluff_acradors_1"
