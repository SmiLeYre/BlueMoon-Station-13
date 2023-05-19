/obj/item/clothing/suit/armor/hos/pmc_leader_armor
	name = "M4 pattern PMC leader armor"
	desc = "A modification of the M4 body armor, it is designed for high-profile security operators and corporate mercenaries in mind. This particular suit looks like it belongs to a high-ranking officer."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "officer_armor"
	item_state = "officer_armor"

/obj/item/clothing/suit/donator/bm/cerberus_suit/butler
	name = "butler jacket"
	desc = "White butler jacket."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "butler"
	item_state = "butler"

/obj/item/clothing/head/donator/bm/cerberus_helmet/armored
	armor = list(MELEE = 45, BULLET = 30, LASER = 30,ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80

/obj/item/clothing/suit/donator/bm/cerberus_suit/armored
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list(MELEE = 45, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 10)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/donator/bm/cerberus_suit/armored/censor
	name = "censor's coat"
	desc = "A red overcoat with the coat of arms of Ravenheart in the middle. It has steel plates sewn into it."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "censor"
	item_state = "censor"

/obj/item/clothing/suit/donator/bm/cerberus_suit/armored/baron
	name = "gorgeous red outfit"
	desc = "Lush black outfit with red stripes. Looks definitely very rich."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "baron"
	item_state = "baron"

//InteQ//

/obj/item/clothing/suit/armor/inteq
	name = "InteQ armor vest"
	desc = "Strict black armor vest. Well, at least you won't die immediately."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "armor"
	item_state = "armor"

/obj/item/clothing/suit/armor/inteq/vanguard
	name = "InteQ armored coat"
	desc = "Lush overcoat with fur around the neck. Has armor plates in its composition."
	icon_state = "armor_vanguard"
	item_state = "armor_vanguard"

/obj/item/clothing/suit/armor/inteq/labcoat
	name = "InteQ armored labcoat"
	desc = "Sterile (or almost) lab coat of the InteQ department for the modernization of existing technologies."
	icon_state = "labcoat_inteq"
	item_state = "labcoat_inteq"

//InteQ Hardsuits//

//Helmet_ELITE
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/inteq
	name = "InteQ elite hardsuit helmet"
	desc = "InteQ elite stormtrooper hardsuit helmet."
	icon_state = "hardsuit0-inteq"
	item_state = "hardsuit0-inteq"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/head.dmi'
	hardsuit_type = "inteq"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
//Suit_ELITE
/obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq
	name = "InteQ elite hardsuit"
	desc = "InteQ elite stormtrooper hardsuit."
	icon_state = "hardsuit0-inteq"
	item_state = "hardsuit0-inteq"
	hardsuit_type = "inteq"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits_digidrated.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/inteq
//////////

//Helmet_STANDART
/obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
	name = "InteQ hardsuit helmet"
	desc = "InteQ stormtrooper hardsuit helmet."
	icon_state = "hardsuit0-brown"
	item_state = "hardsuit0-brown"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/head_muzzled.dmi'
	hardsuit_type = "brown"
//Suit_STANDART
/obj/item/clothing/suit/space/hardsuit/syndi/inteq
	name = "InteQ hardsuit"
	desc = "InteQ stormtrooper hardsuit."
	icon_state = "hardsuit0-brown"
	item_state = "hardsuit0-brown"
	hardsuit_type = "brown"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits_digidrated.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/inteq
//////////

//Helmet_SHIELDED
/obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/inteq
	name = "InteQ shielded hardsuit helmet"
	desc = "InteQ shielded stormtrooper hardsuit helmet."
	icon_state = "hardsuit0-brown"
	item_state = "hardsuit0-brown"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/head_muzzled.dmi'
	hardsuit_type = "brown"
//Suit_SHIELDED
/obj/item/clothing/suit/space/hardsuit/shielded/syndi/inteq
	name = "InteQ shielded hardsuit"
	desc = "InteQ shielded stormtrooper hardsuit."
	icon_state = "hardsuit0-brown"
	item_state = "hardsuit0-brown"
	hardsuit_type = "brown"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/suits_digidrated.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/inteq
	shield_state = "shield-yellow"
//////////
