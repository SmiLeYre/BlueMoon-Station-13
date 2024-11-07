
/*/datum/crafting_recipe
	var/list/machinery
	var/list/steps
	var/non_craftable
	var/list/tool_behaviors		/// String defines of items needed but not consumed. Lazy list.

///////////   GRINDER   ///////////

/datum/crafting_recipe/food/grinder
	machinery = list(/obj/machinery/reagentgrinder)
	steps = list("Put into grinder and grind")
	category = CAT_MISCFOOD
	non_craftable = TRUE

/datum/crafting_recipe/food/grinder/bonito
	reqs = list(/obj/item/reagent_containers/food/snacks/dried_fish = 1)
	result = /datum/reagent/consumable/bonito

/datum/crafting_recipe/food/knife/raw_noodles
	reqs = list(/obj/item/reagent_containers/food/snacks/rice_dough = 1)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles
	category = CAT_MISCFOOD

///////////   KNIFE   ///////////

/datum/crafting_recipe/food/knife
	tool_behaviors = list(TOOL_KNIFE)
	steps = list("Slice with a knife")
	category = CAT_MISCFOOD
	non_craftable = TRUE

/datum/crafting_recipe/food/knife/raw_noodles
	reqs = list(/obj/item/reagent_containers/food/snacks/rice_dough = 1)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles
	category = CAT_EAST*/

//replaced preceeding code for now with something that works

///////////   GRINDER   ///////////
/datum/crafting_recipe/food/bonito
	reqs = list(/obj/item/reagent_containers/food/snacks/dried_fish = 1)
	result = /datum/reagent/consumable/bonito
	subcategory = CAT_EAST

///////////   KNIFE   ///////////

/datum/crafting_recipe/food/raw_noodles
	reqs = list(/obj/item/reagent_containers/food/snacks/rice_dough = 1)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles
	subcategory = CAT_EAST
