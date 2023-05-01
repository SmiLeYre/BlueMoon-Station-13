	//Шлем
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec/fire
    name = "Firesquad Helmet"
    desc = "Fireproof ERT trooper hardsuit helmet."
    icon_state = "hardsuit0-warden"
    item_state = "hardsuit0-warden"
    icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/hats.dmi'
    mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/head.dmi'
    hardsuit_type = "hardsuit-warden"
    actions_types = list()

//Хардсьют огненного ертшника
/obj/item/clothing/suit/space/hardsuit/ert/alert/sec/fire
	name = "Firesquad Suit"
	desc = "Fireproof ERT trooper hardsuit."
	icon_state = "hardsuit-warden"
	item_state = "hardsuit-warden"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec/fire

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

/obj/item/clothing/suit/space/hardsuit/ert/alert/nri
	name = "NRI Spetsnaz hardsuit"
	desc = "Reinforced greenish hardsuit, designated for NRI special forces."
	icon_state = "russiansuit"
	item_state = "russiansuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/nri
	armor = list(MELEE = 70, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	mutantrace_variation = STYLE_DIGITIGRADE

//Хардсьют Солнечной Федерации
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sol
	name = "SolFed marine hardsuit helmet"
	desc = "Just like old times."
	icon_state = "hardsuit0-marine"
	item_state = "hardsuit0-marine"
	hardsuit_type = "marinesuit"
	armor = list(MELEE = 70, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/ert/alert/sol
	name = "SolFed marine hardsuit"
	desc = "Standart issue marine hardsuit. Nothing special."
	icon_state = "marinesuit"
	item_state = "marinesuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sol
	armor = list(MELEE = 70, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	mutantrace_variation = STYLE_DIGITIGRADE
