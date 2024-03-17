/datum/crafting_recipe/bagholding
	name = "Bag of Holding"
	reqs = list(
		/obj/item/BoH_inert/bag = 1,
		/obj/item/assembly/signaler/anomaly/bluespace = 1,
	)
	result = /obj/item/storage/backpack/holding
	category = CAT_CLOTHING

/datum/crafting_recipe/satchelholding
	name = "Satchel of Holding"
	reqs = list(
		/obj/item/BoH_inert/satchel = 1,
		/obj/item/assembly/signaler/anomaly/bluespace = 1,
	)
	result = /obj/item/storage/backpack/holding/satchel
	category = CAT_CLOTHING

/datum/crafting_recipe/duffelholding
	name = "Duffel Bag of Holding"
	reqs = list(
		/obj/item/BoH_inert/duffel = 1,
		/obj/item/assembly/signaler/anomaly/bluespace = 1,
	)
	result = /obj/item/storage/backpack/holding/duffel
	category = CAT_CLOTHING
