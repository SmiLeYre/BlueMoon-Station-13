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
