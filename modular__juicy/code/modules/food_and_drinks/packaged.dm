/obj/item/reagent_containers/food
	///Extra flags for things such as if the food is in a container or not
	var/food_flags
	///Amount of volume the food can contain
	var/max_volume
	///Food that's immune to decomposition.
	var/preserved_food = FALSE

/datum/reagents
	var/flags

// Cans
/obj/item/reagent_containers/food/snacks/canned
	name = "Canned Air"
	desc = "If you ever wondered where air came from..."
	list_reagents = list(
		/datum/reagent/oxygen = 6,
		/datum/reagent/nitrogen = 24,
	)
	icon = 'modular__juicy/icons/obj/items/food/canned.dmi'
	icon_state = "peachcan"
	food_flags = FOOD_IN_CONTAINER
	w_class = WEIGHT_CLASS_NORMAL
	max_volume = 30
	w_class = WEIGHT_CLASS_SMALL
	preserved_food = TRUE

// /obj/item/reagent_containers/food/snacks/canned/make_germ_sensitive(mapload)	// Чтобы это все заработало, надо реализовать code/datums/components/food/germ_sensitive.dm у нас... Удачи)
// 	return // It's in a can

/obj/item/reagent_containers/food/snacks/canned/proc/open_can(mob/user)
	to_chat(user, span_notice("You pull back the tab of \the [src]."))
	playsound(user.loc, 'modular__juicy/sound/items/foodcanopen.ogg', 50)
	reagents.flags |= OPENCONTAINER
	preserved_food = FALSE

/obj/item/reagent_containers/food/snacks/canned/attack_self(mob/user)
	if(!is_drainable())
		open_can(user)
		icon_state = "[icon_state]_open"
	return ..()

/obj/item/reagent_containers/food/snacks/canned/attack(mob/living/target, mob/user, def_zone)
	if (!is_drainable())
		to_chat(user, span_warning("[src]'s lid hasn't been opened!"))
		return FALSE
	return ..()

///This proc makes things infective and decomposing when they stay on the floor for too long.
///Set preserved_food to TRUE to make it never decompose.
///Set decomp_req_handle to TRUE to only make it decompose when someone picks it up.
///Requires /datum/component/germ_sensitive to detect exposure
// /obj/item/reagent_containers/food/snacks/proc/make_germ_sensitive(mapload)
// 	if(!isnull(trash))
// 		return // You don't eat the package and it protects from decomposing
// 	AddComponent(
// 		/datum/component/germ_sensitive,
// 		mapload
// 		)
// 	if(!preserved_food)
// 		AddComponent(
// 			/datum/component/decomposition,
// 			mapload,
// 			decomp_req_handle,
// 			decomp_flags = foodtypes,
// 			decomp_result = decomp_type,
// 			ant_attracting = ant_attracting,
// 			custom_time = decomposition_time,
// 			stink_particles = decomposition_particles
// 			)

/obj/item/reagent_containers/food/snacks/canned/squid_ink	// Сделаем пока съедобной всю банку
	name = "canned squid ink"
	desc = "An odd ingredient in typical cooking, squid ink lends a taste of the sea to any dish- while also dyeing it jet black in the process."
	icon = 'modular__juicy/icons/obj/items/food/canned.dmi'
	icon_state = "squidinkcan"
	trash = /obj/item/reagent_containers/food/snacks/canned/squid_ink/trash
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/sodiumchloride = 5,
		)
	tastes = list("seafood" = 7, "tin" = 1)
	foodtype = SEAFOOD

/obj/item/reagent_containers/food/snacks/canned/squid_ink/trash	// пустая банка
	icon_state = "squidinkcan_empty"
	trash = /obj/item/reagent_containers/food/snacks/canned/squid_ink/trash
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 0,
		/datum/reagent/consumable/sodiumchloride = 0,
		)
	tastes = list("empty" = 1)
	foodtype = SEAFOOD
