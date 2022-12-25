// Modular-friendly way of adding new quirk-based inspect text
// Hijacks the function used for abductor examine
/mob/common_trait_examine()
	// The ever-important funny BYOND dots
	. = ..()

	// Empathy abilities escape clause
	// Please change this when adding new quirk detection
	if(!(HAS_TRAIT(usr, TRAIT_EMPATH) || HAS_TRAIT(usr, TRAIT_FRIENDLY) || src == usr))
		return

	// Pronoun stuff
	var/t_He = p_they(FALSE)
	//var/t_his = p_their()
	//var/t_is = p_are()

	// Check for Distant (no touch head!)
	if(HAS_TRAIT(src, TRAIT_DISTANT))
		. += "<span class='warning'>You sense [t_He] might be disturbed by physical affection.</span>\n"
	// Check for Heatpat Slut (pls touch head!)
	if(HAS_TRAIT(src, TRAIT_HEADPAT_SLUT))
		. += "<span class='info'>You sense [t_He] appreciates receiving physical affection more than normal.</span>\n"
