/datum/reagent/consumable/semen/on_mob_add(mob/living/carbon/M)
	. = ..()
	var/datum/quirk/dumb4cum/d4c = locate() in M.roundstart_quirks
	if(d4c)
		d4c.uncrave()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_add(mob/living/carbon/M)
	. = ..()
	var/datum/quirk/dumb4cum/d4c = locate() in M.roundstart_quirks
	if(d4c)
		d4c.uncrave()

//incubus and succubus additions below
/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(1)

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_INCUBUS))
		M.adjust_nutrition(1.5)

/datum/reagent/blood/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(HAS_TRAIT(C,BLOODFLEDGE))
		C.adjust_nutrition(6) //3/4ed this, felt it was a bit too much
		C.adjust_disgust(-3) //makes the churches effects easily negated

/datum/reagent/water/holywater/on_mob_life(mob/living/carbon/M)
	. = ..()
	//makes holy water slightly disgusting and hungering for vampires
	if(HAS_TRAIT(M,BLOODFLEDGE))
		M.adjust_disgust(1)
		M.adjust_nutrition(-0.1)

	// Cursed blood effect moved here
	if(HAS_TRAIT(M, TRAIT_CURSED_BLOOD))
		// Wait for stuttering, to match old effect
		if(!M.stuttering)
			return

		// Escape clause: 12% chance to continue
		if(!prob(12))
			return
		
		// Character speaks nonsense
		M.say(pick("Somebody help me...","Unshackle me please...","Anybody... I've had enough of this dream...","The night blocks all sight...","Oh, somebody, please..."), forced = "holy water")
		
		// Escape clause: 10% chance to continue
		if(!prob(10))
			return
		
		// Character has a seisure
		M.visible_message("<span class='danger'>[M] starts having a seizure!</span>", "<span class='userdanger'>You have a seizure!</span>")
		M.Unconscious(120)
		to_chat(M, "<span class='cultlarge'>[pick("The moon is close. It will be a long hunt tonight.", "Ludwig, why have you forsaken me?", \
		"The night is near its end...", "Fear the blood...")]</span>")
		
		// Apply damage
		M.adjustToxLoss(1, 0)
		M.adjustFireLoss(1, 0)
		
		// Escape clause: 25% chance to continue
		if(!prob(25))
			return
		
		// Spontaneous combustion
		M.IgniteMob()
