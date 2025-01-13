/datum/crafting_recipe/tailbag
	name = "Tailbag"
	result = /obj/item/storage/wallet/tailbag
	reqs = list(/obj/item/stack/sheet/leather = 2)
	time = 30
	category = CAT_CLOTHING

/datum/crafting_recipe/tailbag_xl
	name = "XL Tailbag (using empty Tailbag)"
	result = /obj/item/storage/wallet/tailbag/xtralg
	reqs = list(/obj/item/storage/wallet/tailbag = 1,
	/obj/item/stack/sheet/leather = 2)
	time = 30
	category = CAT_CLOTHING

/datum/crafting_recipe/tailbag_xl/check_requirements(mob/user, list/collected_requirements)
	for(var/obj/item/storage/wallet/tailbag/TB in collected_requirements[/obj/item/storage/wallet/tailbag])
		if(TB.contents.len)
			return FALSE
	return TRUE
