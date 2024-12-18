// The TRUE fix for cyborgs dropping their shit
/obj/item/stack/tile/attack_self(mob/user)
	if(!tile_reskin_types)
		return ..()
	var/obj/item/stack/tile/choice = show_radial_menu(user, src, tile_reskin_types, radius = 48, require_near = TRUE)
	if (!choice || choice == type)
		return
	choice = new choice(user.drop_location(), amount)
	if (!QDELETED(choice))	// If the tile merged with floor tiles as a borg, you're fucked.
		if (istype(user, /mob/living/silicon/robot))	// This is where the changes start. Find out if we're a borgo
			var/mob/living/silicon/robot/R = user		// I want intellisense, give it to me.
			var/selected_module = R.get_selected_module()	// Store the selected module
			R.deselect_module(selected_module)			// Deactivate the selected module so we don't cry about it later
			moveToNullspace()							// This was breaking stuff so it's here now
			choice.is_cyborg = 1						// Let borgos use the new tile
			choice.custom_materials = null				// Get rid of custom materials so we don't make exploits
			choice.cost = 125							// A tile costs 125 materials
			R.module.remove_module(src, TRUE)			// And remove the old one
			R.module.add_module(choice, TRUE, TRUE)		// Add the new tile to the modules list
			choice.doMove(R.module)						// Move the new tile to the module so it's not just on the ground
			R.activate_module(choice)					// Activate the module so you don't have to manually
			R.select_module(selected_module)			// Select the module to make this shit ✨seamless✨
		else				// We're not a borg, so continue doing what the original proc does
			moveToNullspace()							// Instead of being before anything, this is here because it was breaking stuff
			user.put_in_active_hand(choice)
	else	// But not really, I'm a benevolent coder
		if (istype(user, /mob/living/silicon/robot))	// See above
			var/mob/living/silicon/robot/R = user
			var/selected_module = R.get_selected_module()
			R.deselect_module(selected_module)
			moveToNullspace()
			choice.is_cyborg = 1
			choice.custom_materials = null
			choice.cost = 125
			R.module.remove_module(src, TRUE)
			R.module.add_module(choice, TRUE, TRUE)
			choice.doMove(R.module)
			R.activate_module(choice)
			R.select_module(selected_module)
	qdel(src)
