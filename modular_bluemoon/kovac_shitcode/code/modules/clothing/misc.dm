/obj/item/clothing/neck/tie/cross
	name = "Christian Cross Necklace"
	desc = "Amen."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "cross"

/obj/item/clothing/neck/tie/bandagewraps
	name = "Bandage wraps"
	desc = "Poor soldier. Take some medkit."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "head1"
	unique_reskin = list(
		"Head 2" = list("icon_state" = "head2"),
		"Head 3" = list("icon_state" = "head3"),
		"Head Bloody" = list("icon_state" = "head1b"),
		"Head Bloody 2" = list("icon_state" = "headb"),
		"Head Bloody 3" = list("icon_state" = "head3b"),
		"Chest" = list("icon_state" = "chest1"),
		"Chest 2" = list("icon_state" = "chest2"),
		"Chest Bloody" = list("icon_state" = "chest1b"),
		"Chest 2 Bloody" = list("icon_state" = "chestb")
	)

/datum/gear/neck/cross
	name = "Christian Cross Necklace"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/cross

/datum/gear/neck/bandagewraps
	name = "Bandage wraps"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/bandagewraps
