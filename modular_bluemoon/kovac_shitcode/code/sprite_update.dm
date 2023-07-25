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
