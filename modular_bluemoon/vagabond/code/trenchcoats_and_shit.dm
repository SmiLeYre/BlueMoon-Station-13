/obj/item/clothing/suit/jacket/paratrench
	name = "trenchcoat"
	desc = "A trenchcoat with a TailorCo brand on the tag. Looks expensive."
	icon_state = "paratrench"
	item_state = "gentlecoat"
	icon = 'modular_bluemoon/vagabond/icons/clothing/trench_item.dmi'
	mob_overlay_icon = 'modular_bluemoon/vagabond/icons/clothing/trench.dmi'

/obj/item/clothing/suit/jacket/paratrench/black
	icon_state = "paratrench_black"
	unique_reskin = list(
		"Adjusted coat" = list("icon_state" = "paratrench_black_d")
	)

/datum/gear/suit/paratrench
	name = "Brown trenchcoat"
	path = /obj/item/clothing/suit/jacket/paratrench
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS
	cost = 2

/datum/gear/suit/paratrenchblack
	name = "Black trenchcoat"
	path = /obj/item/clothing/suit/jacket/paratrench/black
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS
	cost = 2


