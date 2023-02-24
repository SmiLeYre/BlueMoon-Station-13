/mob/living/carbon/cuff_resist(obj/item/I, breakouttime = 600, cuff_break = 0)
	if(istype(I, /obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/rope = I
		cuff_break = rope.prepare_resist(src)
		if(cuff_break == -1)
			to_chat(src, "<span class='danger'>You are not able to reach the rope.</span>")
			return
	. = ..()

/mob/living/carbon/clear_cuffs(obj/item/I, cuff_break)
	if(istype(I, /obj/item/restraints/bondage_rope))
		var/obj/item/restraints/bondage_rope/rope = I
		if(LAZYLEN(rope.rope_stack) > 1)
			visible_message("<span class='danger'>[src] manages to loosen up their rope!</span>")
			to_chat(src, "<span class='notice'>You successfully loosen up your rope.</span>")

			var/obj/item/restraints/bondage_rope/new_rope = new rope.type()
			new_rope.color = pop(rope.rope_stack)
			new_rope.forceMove(src.loc)
			return
	. = ..()

// Liquid Panty Dropper effect
/mob/living/carbon/proc/clothing_burst(mob/living/carbon/target_user)
	// Variable for if the action succeeded
	var/user_disrobed = FALSE

	// Get worn items
	var/items = target_user.get_contents()

	// Iterate over worn items
	for(var/obj/item/item_worn in items)
		// Ignore non-mob (storage)
		if(!ismob(item_worn.loc))
			continue

		// Ignore held items
		if(target_user.is_holding(item_worn))
			continue

		// Check for anything covering a body part
		if(item_worn.body_parts_covered)
			// Set the success variable
			user_disrobed = TRUE

			// Drop the target item
			target_user.dropItemToGround(item_worn, TRUE)

			// Throw item to a random spot
			item_worn.throw_at(pick(oview(7,get_turf(src))),10,1)

	// When successfully disrobing a target
	if(user_disrobed)
		// Display a chat message
		target_user.visible_message("<span class='userlove'>[target_user] suddenly bursts out of [target_user.ru_ego()] clothes!</span>", "<span class='userlove'>You suddenly burst out of your clothes!</span>")

		// Play the ripped poster sound
		playsound(target_user.loc, 'sound/items/poster_ripped.ogg', 50, 1)
