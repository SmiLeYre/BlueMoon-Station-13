/obj/item/storage/belt/grenade/fire_grenade
	name = "firetrooper belt"
	desc = "A belt for holding lots of incendiary grenades."
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/storage/belt/grenade/fire_grenade/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 15
	STR.display_numerical_stacking = TRUE
	STR.max_combined_w_class = 60
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(list(
		/obj/item/grenade,
		/obj/item/screwdriver,
		/obj/item/lighter,
		/obj/item/multitool,
		/obj/item/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/grenade/plastic/c4,
		))

/obj/item/storage/belt/grenade/fire_grenade/PopulateContents()
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)

/obj/item/choice_beacon/ert_mech
	name = "ERT mech beacon"
	desc = "To summon your own steel titan."

/obj/item/choice_beacon/ert_mech/generate_display_names()
	var/static/list/ert_mech_list = list("Marauder" = /obj/vehicle/sealed/mecha/combat/marauder/loaded,
		"Seraph" = /obj/vehicle/sealed/mecha/combat/marauder/seraph)
	if(!ert_mech_list)
		ert_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			ert_mech_list[initial(A.name)] = A
	return ert_mech_list

/obj/item/choice_beacon/nri_mech
	name = "NRI mech beacon"
	desc = "To summon your own steel titan. For the Emperor!"

/obj/item/choice_beacon/nri_mech/generate_display_names()
	var/static/list/nri_mech_list = list("TU-802 Sevastopol" = /obj/vehicle/sealed/mecha/combat/durand/tu802,
		"Savannah-Ivanov" = /obj/vehicle/sealed/mecha/combat/savannah_ivanov/loaded)
	if(!nri_mech_list)
		nri_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			nri_mech_list[initial(A.name)] = A
	return nri_mech_list

/obj/item/card/id/nri
	name = "\improper NRI ID"
	desc = "An Novaya Rossiyskya Imperia Spetsnaz ID card."
	icon_state = "nri"
	registered_name = "NRI Soldier"
	assignment = "NRI Soldier"
	uses_overlays = FALSE

/obj/item/card/id/nri/Initialize(mapload)
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/sol
	name = "\improper SolFed ID"
	desc = "An Solar Federation Military ID card."
	icon_state = "sol"
	registered_name = "SolFed Soldier"
	assignment = "SolFed Soldier"
	uses_overlays = FALSE

/obj/item/card/id/sol/Initialize(mapload)
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/clothing/suit/armor/solfed_coat
	name = "SolFed Officer Coat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	icon_state = "furcoat"
	item_state = "furcoat"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	armor = list(MELEE = 55, BULLET = 65, LASER = 65, ENERGY = 65, BOMB = 40, BIO = 50, RAD = 100, FIRE = 40, ACID = 50,  WOUND = 40)

/obj/item/clothing/suit/suspenders/suspenders_white
	name = "white suspenders"
	desc = "They suspend the illusion of painting."
	icon_state = "suspenders_white"
