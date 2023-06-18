	//Шлем
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec/fire
    name = "Firesquad Helmet"
    desc = "Fireproof ERT trooper hardsuit helmet."
    icon_state = "hardsuit0-warden"
    item_state = "hardsuit0-warden"
    icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/hats.dmi'
    mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/head.dmi'
    hardsuit_type = "warden"
    mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

//Хардсьют огненного ертшника
/obj/item/clothing/suit/space/hardsuit/ert/alert/sec/fire
	name = "Firesquad Suit"
	desc = "Fireproof ERT trooper hardsuit."
	icon_state = "hardsuit0-warden"
	icon_state = "hardsuit0-warden"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec/fire
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	hardsuit_type = "warden"

//Хардсьют НРИ
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/nri
	name = "NRI Spetsnaz hardsuit helmet"
	desc = "Stay with me, cyka!"
	icon_state = "hardsuit0-russian"
	item_state = "hardsuit0-russian"
	hardsuit_type = "russiansuit"
	armor = list(MELEE = 70, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/space/hardsuit/ert/alert/nri
	name = "NRI Spetsnaz hardsuit"
	desc = "Reinforced greenish hardsuit, designated for NRI special forces."
	icon_state = "russiansuit"
	item_state = "russiansuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/nri
	armor = list(MELEE = 70, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

	//Хардсьюты клоун опсов
//Helmet_ELITE
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/clown
	name = "HONK elite hardsuit helmet"
	desc = "HONK HONK HONK Bith ass motherfucker!"
	icon_state = "hardsuit0-clown"
	item_state = "hardsuit0-clown"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/head.dmi'
	hardsuit_type = "clown"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
//Suit_ELITE
/obj/item/clothing/suit/space/hardsuit/syndi/elite/clown
	name = "HONK elite hardsuit"
	desc = "HONK HONK HONK Bith ass motherfucker!"
	icon_state = "hardsuit0-clown"
	item_state = "hardsuit0-clown"
	hardsuit_type = "clown"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/clown

	//Helmet_SHIELDED
/obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/clown
	name = "HONK shielded hardsuit helmet"
	desc = "Get out of my sword or I will rip your honking asshole."
	icon_state = "hardsuit0-clown"
	item_state = "hardsuit0-clown"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/head.dmi'
	hardsuit_type = "clown"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
//Suit_SHIELDED
/obj/item/clothing/suit/space/hardsuit/shielded/syndi/clown
	name = "HONK shielded hardsuit"
	desc = "Get out of my sword or I will rip your honking asshole."
	icon_state = "hardsuit0-clown"
	item_state = "hardsuit0-clown"
	hardsuit_type = "clown"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi/clown
//////////
