/datum/species/mammal/synthetic/New()
	. = ..()

	// Define inherent traits to add
	var/modular_inherent_traits = list(TRAIT_NOTHIRST)
	modular_inherent_traits += list(CAN_BE_OPERATED_WITHOUT_PAIN) // BLUEMOON ADD

	// Add new traits to list
	LAZYADD(inherent_traits, modular_inherent_traits)
