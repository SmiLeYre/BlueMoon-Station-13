/datum/gear/donator/lewdsleepy
	name = "Lewd sleepy medipen"
	path = /obj/item/reagent_containers/hypospray/medipen/lewdsleepy
	cost = 2
	ckeywhitelist = list()
	donator_group_id = DONATOR_GROUP_TIER_1

/obj/item/card/id/heresy
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	name = "Occult Card"
	desc = "ID for research related to occult activities whose nature of phenomena is poorly supported by scientific evidence."
	icon_state = "heresy_card"
	assignment = "Herecit"
	uses_overlays = FALSE

/datum/gear/donator/bm/heresy_card
	name = "Occult Card"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/heresy
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
