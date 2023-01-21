/obj/item/reagent_containers/spray/chemsprayer/sleeper
	list_reagents = list(/datum/reagent/toxin/sodium_thiopental = 100, /datum/reagent/consumable/condensedcapsaicin = 100, /datum/reagent/toxin/chloralhydrate = 100)

/obj/item/reagent_containers/spray/plushmium
	name = "\improper Love to Life spray bottle"
	desc = "A toy spray bottle marked with the Donk Co. Stuffing For Spessmen branding. Must be applied directly to a plush, and only contains enough for one."
	icon_state = "cleaner_drying"
	// Single use item!
	volume = 5
	spray_range = 1
	can_fill_from_container = FALSE
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5)
	list_reagents = list(/datum/reagent/fermi/plushmium = 5)

// Custom interaction to prevent wasting the item
/obj/item/reagent_containers/spray/plushmium/afterattack(atom/target, mob/user)
	// Check for plush toy
	if(!istype(target, /obj/item/toy/plush))
		// Alert user and return
		to_chat(user, span_warning("You don't want to waste the solution on a non-plushie."))
		return

	// Return normally
	. = ..()
