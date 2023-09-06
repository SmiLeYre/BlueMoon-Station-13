/*
Holds things like antag datums, game modes, abilities, and everything
related to the antag that could be a datum
*/

//ANTAGONIST
/datum/antagonist/wendigo
	name = "wendigo"
	antagpanel_category = "Wendigo"
	soft_antag = FALSE // BLUEMOON ADDITION

/datum/antagonist/wendigo/on_gain()
	if(istype(owner.current, /mob/living/carbon/human))
		var/mob/living/carbon/wendigo/new_owner = new/mob/living/carbon/wendigo(get_turf(owner.current))
		var/mob/current_body = owner.current
		current_body.transfer_ckey(new_owner)
		current_body.Destroy()
		owner = new_owner.mind
		owner.current = new_owner
	..()

//HUD
//Contents: Intentions, Hands, Dropping/Throwing/Pulling, Inventory Equip
//		Health + Souls on the bottom of screen
//TODO: Health doll, Soul counter (not devil)

/datum/hud/human/wendigo
