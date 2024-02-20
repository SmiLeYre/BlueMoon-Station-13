/datum/reagent/consumable/organicprecursor
	name = "Organic Precursor"
	description = "A very simple precursor-alike chemical that can be used in the creation of any specific liquids."
	color = "#FFFFFF" // rgb: 255, 255, 255
	taste_mult = 0 // oderless and tasteless

/datum/chemical_reaction/synthcum
	id = "organicprecursor0451" //We don't want to have organicprecursor somewhere in the future so 0451 postfix will prevent any shittery with splurt merge
	results = list(/datum/reagent/consumable/organicprecursor = 1)
	required_reagents = list(/datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/consumable/eggyolk = 1)
	required_temp = 375
	mob_react = FALSE

/datum/chemical_reaction/cum
	id = "cumcreation" //it is.
	results = list(/datum/reagent/consumable/semen = 2) //you did it.
	required_reagents = list(/datum/reagent/drug/aphrodisiacplus = 2, /datum/reagent/consumable/organicprecursor = 1)
	required_temp = 400
	mob_react = FALSE

/datum/chemical_reaction/femcum
	id = "femcumcreation" //it is.
	results = list(/datum/reagent/consumable/semen/femcum = 2) //you did it.
	required_reagents = list(/datum/reagent/drug/aphrodisiac = 2, /datum/reagent/consumable/organicprecursor = 1)
	required_temp = 400
	mob_react = FALSE
