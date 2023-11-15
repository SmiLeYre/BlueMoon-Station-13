/datum/chemical_reaction/sodiumchloride2
	id = "sodiumchloride2"
	results = list(/datum/reagent/consumable/sodiumchloride = 1)
	required_reagents = list(/datum/reagent/ash = 1, /datum/reagent/consumable/ethanol/beer = 1)
	required_temp = 373.15
	mob_react = FALSE

/datum/chemical_reaction/ethanol
	id = "ethanol"
	results = list(/datum/reagent/consumable/ethanol = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol/vodka = 2)
	required_temp = 473.15
	mob_react = FALSE
