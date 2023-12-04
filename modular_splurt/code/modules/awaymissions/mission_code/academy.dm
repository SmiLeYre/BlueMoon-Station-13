//Academy Items

/obj/item/dice/d20/fate
	var/list/used_fingerprints = null // Used to track who used the one_use die

/obj/item/dice/d20/fate/one_use
	reusable = 1 // Obsolete by the used_fingerprints list

/obj/item/dice/d20/fate/effect(var/mob/living/carbon/human/user,roll)
	// This override checks if a user has rolled the dice
	// If true; Reject them and abort
	if (user in used_fingerprints)
		// Send a message implying someone else should roll
		visible_message("<span class='notice'>[user] rolls the dice, but it doesn't respond to [user.ru_na()] again.</span>")
		return
	// If false; Add them to the user list and continue
	else
		LAZYADD(used_fingerprints, user)

	// Run the function normally
	..()
