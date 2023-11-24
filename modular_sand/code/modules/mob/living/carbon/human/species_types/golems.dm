// BLUEMOON ADD START
/datum/species/golems/New()
	. = ..()
	var/modular_inherent_traits = list(CAN_BE_OPERATED_WITHOUT_PAIN)
	LAZYADD(inherent_traits, modular_inherent_traits)
// BLUEMOON ADD END
