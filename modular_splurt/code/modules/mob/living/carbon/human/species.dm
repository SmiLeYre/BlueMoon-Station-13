/datum/species/althelp(mob/living/carbon/human/user, mob/living/carbon/human/target, datum/martial_art/attacker_style)
	if(user == target && istype(user))
		if(HAS_TRAIT(user, TRAIT_FLOORED))
			to_chat(user, "<span class='warning'>You can't seem to force yourself up right now!</span>")
			return
	. = ..()

/datum/species/handle_thirst(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOTHIRST))
		return

	// A lot of this is just copied and pasted from the handle_digestion proc
	if (H.thirst > 0 && H.stat != DEAD && !HAS_TRAIT(H, TRAIT_NOTHIRST))
		// THEY ~~HUNGER~~ THIRST
		var/thirst_rate = THIRST_FACTOR
		/*
		var/datum/component/mood/mood = H.GetComponent(/datum/component/mood)
		if(mood && mood.sanity > SANITY_DISTURBED)
			thirst_rate *= max(0.5, 1 - 0.002 * mood.sanity) //0.85 to 0.75

		// Whether we cap off our satiety or move it towards 0
		if(H.satiety > MAX_SATIETY)
			H.satiety = MAX_SATIETY
		else if(H.satiety > 0)
			H.satiety--
		else if(H.satiety < -MAX_SATIETY)
			H.satiety = -MAX_SATIETY
		else if(H.satiety < 0)
			H.satiety++
			if(prob(round(-H.satiety/40)))
				H.Jitter(5)
			thirst_rate = 3 * THIRST_FACTOR
		*/
		thirst_rate *= H.physiology.thirst_mod
		H.adjust_thirst(-thirst_rate)
