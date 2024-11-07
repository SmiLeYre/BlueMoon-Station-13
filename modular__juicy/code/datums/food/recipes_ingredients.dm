/datum/crafting_recipe/food/rice_dough
	name = "Rice dough"
	reqs = list(
		/datum/reagent/consumable/flour = 10,
		/datum/reagent/consumable/rice = 10,
		/datum/reagent/water = 10,
	)
	result = /obj/item/reagent_containers/food/snacks/rice_dough
	subcategory = CAT_EAST

/datum/crafting_recipe/food/worcestershire_sauce
	name = "Worcestershire Sauce"
	reqs = list(
		// /datum/reagent/consumable/onion_juice = 1, нету сока из чеснока увы
		/datum/reagent/consumable/garlic = 1,
		/datum/reagent/consumable/vinegar = 1,
		/datum/reagent/consumable/bonito = 1,
		/datum/reagent/consumable/sugar = 1,
		)
	result = /obj/item/reagent_containers/food/snacks/tonkatsuwurst
	subcategory = CAT_EAST
