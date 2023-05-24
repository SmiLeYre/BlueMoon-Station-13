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

///


/obj/item/clothing/mask/balaclava/breath/redscarf
	name = "Security facescarf"
	desc = "tacticool"
	icon_state = "red"
	item_state = "red"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	clothing_flags = ALLOWINTERNALS

/obj/item/clothing/mask/balaclava/breath/redscarf/bluescarf
	name = "Medical facescarf"
	icon_state = "blue"
	item_state = "blue"

/obj/item/clothing/mask/balaclava/breath/redscarf/purplescarf
	name = "Research facescarf"
	icon_state = "purple"
	item_state = "purple"

/obj/item/clothing/mask/balaclava/breath/redscarf/yellowscarf
	name = "Cargo facescarf"
	icon_state = "yellow"
	item_state = "yellow"


/obj/item/clothing/mask/balaclava/breath/redscarf/greenscarf
	name = "Facescarf"
	icon_state = "green"
	item_state = "green"

/obj/item/clothing/mask/gas/syndicate/ds/wide
	name = "wide shape balaclava"
	desc = "For organising your tricky covert operations. Provided with additional fibers, allowing user to breath normally"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "balaclava_wide"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/mask/gas/syndicate/ds/mouth
	name = "mouth balaclava"
	desc = "Get down on the floor, cyka."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "balaclava_mouth"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/mask/gas/syndicate/ds/coif
	name = "terra gov balaclava"
	desc = "Solar Federation tactical coif"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "coif"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON


///

/obj/item/clothing/under/rank/security/officer/urban_camo
	name = "urban camouflage uniform"
	desc = "an urban painted military suit, developed the Bibis&Co. Usually associated with CEHU and LonoMith PMC's"
	icon_state = "urban_camo"
	item_state = "urban_camo"


///
/datum/gear/neck/cross
	name = "Christian Cross Necklace"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/cross

/datum/gear/neck/bandagewraps
	name = "Bandage wraps"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/bandagewraps

/datum/gear/suit/suspenders
	name = "Suspenders"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/suspenders

/datum/gear/suit/suspenders_white
	name = "White Suspenders"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/suspenders/suspenders_white

/obj/item/card/id/sol_citizen
	name = "SolFed Citizen ID"
	desc = "An ID made to recognize Solar Federation habbitants and tourists."
	icon_state = "sol"
	assignment = "SolFed Citizen"
	uses_overlays = FALSE

/obj/item/card/id/nri_citizen
	name = "NRI Citizen ID"
	desc = "An ID made to recognize Novaya Rossiyskya Imperia habbitants and tourists."
	icon_state = "nri"
	assignment = "NRI Citizen"
	uses_overlays = FALSE

/datum/gear/hands/sol_citizen
	name = "Solar Federation Citizen ID"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/sol_citizen

/datum/gear/hands/nri_citizen
	name = "New Russian Empire Citizen ID"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/nri_citizen
