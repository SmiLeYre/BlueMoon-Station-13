/datum/component/storage/concrete/pockets/small/collar/mind_collar/Initialize()
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/reagent_containers/food/snacks/cookie,
	/obj/item/reagent_containers/food/snacks/sugarcookie,
	/obj/item/mind_controller,
	/obj/item/card))
