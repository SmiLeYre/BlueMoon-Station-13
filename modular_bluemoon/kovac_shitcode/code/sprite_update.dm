/obj/item/clothing/under/syndicate/centcom
	name = "green turtleneck"
	icon_state = "centcom_t"
	item_state = "centcom_t"

/obj/item/clothing/under/syndicate/skirt/centcom
	name = "green skirtleneck"
	icon_state = "centcom_t_skirt"
	item_state = "centcom_t_skirt"

/obj/item/clothing/under/syndicate/brigdoc
	name = "red turtleneck"
	icon_state = "security_medic_turtleneck"
	item_state = "security_medic_turtleneck"

/obj/item/clothing/under/syndicate/skirt/brigdoc
	name = "red skirtleneck"
	icon_state = "security_medic_turtleneck_skirt"
	item_state = "security_medic_turtleneck_skirt"

/obj/item/clothing/suit/armor/vest/agent
	name = "agent armored vest"
	desc = "A Type II armored vest that provides protection against most types of damage. This one is used by the Internal Affairs Agents."
	icon_state = "agent"
	item_state = "agent"
	dog_fashion = null
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 45, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90, "wound" = 40)

/obj/item/clothing/head/helmet/flakhelm	//Actually the M1 Helmet
	name = "flak helmet"
	icon_state = "m1helm"
	item_state = "m1helm"
	desc = "A dilapidated helmet used in ancient wars. This one is brittle and essentially useless. An ace of spades is tucked into the band around the outer shell."
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/tiny/spacenam	//So you can stuff other things in the elastic band instead of it simply being a fluff thing.

/obj/item/clothing/head/helmet/russian_green_helmet
	name = "6b79 helmet"
	icon_state = "russian_green_helmet"
	item_state = "russian_green_helmet"
	desc = "One of the newest NRI helmets, also widely spread asross space corporations security forces."

/obj/item/clothing/head/helmet/aviator_helmet
	name = "aviator helmet"
	icon_state = "avipilotdown"
	item_state = "avipilotdown"
	desc = "Touch the skies and above!"

/obj/item/clothing/head/helmet/aviator_helmet/no_armor
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/head/helmet/blast_helmet
	name = "blast helmet"
	icon_state = "blast_helmet"
	item_state = "blast_helmet"
	desc = "Generic heavy troopers helmet. Reinforced parts and plates were replaced with simpler parts."

/obj/item/clothing/suit/chaplain/clownpriest
	name = "honkmother garb"
	desc = "This outfit makes you proud of being clown mate."
	icon_state = "clownpriest"
	item_state = "clownpriest"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/chaplain/shrinehand
	name = "shrinehand garb"
	desc = "Siddhartha Gautama - Superstar."
	icon_state = "shrinehand"
	item_state = "shrinehand"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/head/clownmitre
	name = "clown mitre"
	desc = "A mitre, worn by Honkmother faith servants."
	icon_state = "clownmitre"
	item_state = "clownmitre"
	flags_inv = HIDEHAIR

/obj/item/clothing/mask/gas/nri
	name = "NRI Gas Mask"
	desc = "An additional part of 6b79 helmet, provided with wide clear visor and simple breathing systems."
	alternate_screams = RUSSIAN_SCREAMS
	icon_state = "nri_gas"
	item_state = "nri_gas"
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	icon = 'modular_bluemoon/kovac_shitcode/icons/rus/obj_rus.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_rus.dmi'

/obj/item/storage/backpack/rucksack
	name = "Rucksack"
	icon_state = "rucksack"
	item_state = "rucksack"

/obj/item/storage/backpack/rucksack/blue
	icon_state = "rucksack_blue"
	item_state = "rucksack_blue"

/obj/item/storage/backpack/rucksack/green
	icon_state = "rucksack_green"
	item_state = "rucksack_green"

/obj/item/storage/backpack/rucksack/navy
	icon_state = "rucksack_navy"
	item_state = "rucksack_navy"

/obj/item/storage/backpack/rucksack/tan
	icon_state = "rucksack_tan"
	item_state = "rucksack_tan"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/gear/mask/surgical
	name = "Surgical Mask"
	path = /obj/item/clothing/mask/surgical
	cost = 2

/datum/gear/mask/redscarf
	name = "Red Facescarf"
	path = /obj/item/clothing/mask/balaclava/breath/redscarf
	cost = 2

/datum/gear/mask/bluescarf
	name = "Blue Facescarf"
	path = /obj/item/clothing/mask/balaclava/breath/redscarf/bluescarf
	cost = 2

/datum/gear/mask/purplescarf
	name = "Purple Facescarf"
	path = /obj/item/clothing/mask/balaclava/breath/redscarf/purplescarf
	cost = 2

/datum/gear/mask/yellowscarf
	name = "Yellow Facescarf"
	path = /obj/item/clothing/mask/balaclava/breath/redscarf/yellowscarf
	cost = 2

/datum/gear/mask/greenscarf
	name = "Green Facescarf"
	path = /obj/item/clothing/mask/balaclava/breath/redscarf/greenscarf
	cost = 2


////////////////////////////////////////////////////////////////////////////////////////

///datum/gear/accessory/storage
	//slot = ITEM_SLOT_BACKPACK

///datum/gear/accessory/storage/rucksack
	//name = "Rucksack"
	//path = /obj/item/storage/backpack/rucksack
	//cost = 5

///datum/gear/accessory/storage/rucksack_blue
	//name = "Blue Rucksack"
	//path = /obj/item/storage/backpack/rucksack/blue
	//cost = 5

///datum/gear/accessory/storage/rucksack_green
	//name = "Green Rucksack"
	//path = /obj/item/storage/backpack/rucksack/green
	//cost = 5

///datum/gear/accessory/storage/rucksack_navy
	//name = "Navy Rucksack"
	//path = /obj/item/storage/backpack/rucksack/navy
	//cost = 5

///datum/gear/accessory/storage/rucksack_tan
	//name = "Tan Rucksack"
	//path = /obj/item/storage/backpack/rucksack/tan
	//cost = 5
