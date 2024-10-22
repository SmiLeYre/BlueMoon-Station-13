// BLUEMOON ADD START
/datum/species/corporate/New()
	. = ..()
	var/modular_inherent_traits = list(TRAIT_NOTHIRST, CAN_BE_OPERATED_WITHOUT_PAIN)
	LAZYADD(inherent_traits, modular_inherent_traits)
// BLUEMOON ADD END
