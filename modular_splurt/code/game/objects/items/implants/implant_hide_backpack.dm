/obj/item/implant/hide_backpack
	name = "storage concealment implant"
	desc = "Prevents your backpack from being observable by the naked eye."
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "backpack_faded"

	// Custom action for extra customization
	actions_types = list(/datum/action/item_action/hide_backpack)

// Implant flavor text
/obj/item/implant/hide_backpack/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Chameleon Storage Concealment Implant<BR>
				<b>Important Notes:</b> Pending approval from some security teams.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Subject emits a weak psychic signal that conceals the presence of back-equipped gear items.<BR>
				<b>Integrity:</b> Implant will last so long as the implant is inside the host."}
	return dat

// Only allow use on "human" targets
/obj/item/implant/hide_backpack/can_be_implanted_in(mob/living/target)
	if(!ishuman(target))
		return FALSE
	. = ..()

/*
 * Action datum
*/

// Action for toggling backpack
/datum/action/item_action/hide_backpack
	name = "Conceal Backwear"
	desc = "Toggle a weak psychic signal that conceals the presence of back-equipped gear items."
	icon_icon = 'modular_splurt/icons/obj/storage.dmi'
	button_icon_state = "backpack_faded"
	background_icon_state = "bg_tech"

	// Is this being used?
	var/ability_active = TRUE

	// Cooldown variables
	var/cooldown = 1 SECONDS
	var/last_use = 0

	// Effect used when toggling
	var/obj/effect/temp_visual/effect_toggle = /obj/effect/temp_visual/telekinesis

// Runs on gaining the ability
/datum/action/item_action/hide_backpack/Grant(mob/grant_to)
	. = ..()

	// Add the trait
	adjust_trait(TRUE)

// Runs on losing the ability
/datum/action/item_action/hide_backpack/Remove(mob/remove_from)
	// Remove the trait (must be done before removal so that owner still exists)
	adjust_trait(FALSE)
	return ..()

// Function to update trait
/datum/action/item_action/hide_backpack/proc/adjust_trait(state)
	// Set owner
	var/mob/living/carbon/human/action_owner = owner

	if(!owner)
		return

	// Toggle trait status
	if(state)
		ADD_TRAIT(action_owner, TRAIT_HIDE_BACKPACK, TRAIT_GENERIC)
	else
		REMOVE_TRAIT(action_owner, TRAIT_HIDE_BACKPACK, TRAIT_GENERIC)

	// Update sprites
	action_owner.update_inv_back()

// Runs on toggling the ability
/datum/action/item_action/hide_backpack/Trigger(trigger_flags)
	// Check for cooldown
	if(last_use + cooldown > world.time)
		// Warn user and return
		to_chat(owner, span_warning("The Storage Concealment implant is still recharging!"))
		return

	// Set owner
	var/mob/living/carbon/human/action_owner = owner

	// Set last use time
	last_use = world.time

	// Update active status
	ability_active = !ability_active

	// Update trait
	adjust_trait(ability_active)

	// Set icon state variables
	if(ability_active)
		// Half-faded backpack
		icon_icon = 'modular_splurt/icons/obj/storage.dmi'
		button_icon_state = "backpack_faded"
	else
		// Normal backpack
		icon_icon = 'icons/obj/storage.dmi'
		button_icon_state = "backpack"

	// Update icon state
	UpdateButtons()

	// Define back item slot
	var/obj/item/item_backpack = action_owner.get_item_by_slot(ITEM_SLOT_BACK)

	// Check if a back item exists
	if(!istype(item_backpack))
		// This is not a valid back item!
		// Alert user
		to_chat(action_owner, span_notice("You toggle the Storage Concealment implant, but nothing seems to happen. Try wearing something on your back."))

		// Exit without effect or message
		return

	// Display fake sparks to match flavor text
	// Replaced by new temporary effect
	//do_fake_sparks(2,FALSE,action_owner)

	// Define mob location
	var/current_turf = get_turf(action_owner)

	// Create particle effect
	spawn_atom_to_turf(effect_toggle, current_turf, 1, FALSE)

	// Play sound
	playsound(current_turf, 'sound/effects/chairwhoosh.ogg', 50, 1)

	// Set toggle text based on active state
	var/implant_toggle_text = (!ability_active ? "discernible" : "imperceptible")
	var/implant_toggle_text_2 = (!ability_active ? "dis" : "") // Engage or Disengage

	// Display a chat message
	action_owner.visible_message(span_notice("[item_backpack] worn by [action_owner] flickers momentarily, before becoming [implant_toggle_text]."), span_notice("You [implant_toggle_text_2]engage the Storage Concealment implant, causing [item_backpack] to be [implant_toggle_text]."))

/*
 * Implant items
*/

// Implanter item
/obj/item/implanter/hide_backpack
	name = "Implanter (storage concealment)"
	imp_type = /obj/item/implant/hide_backpack

// Implant case item
/obj/item/implantcase/hide_backpack
	name = "implant case - 'Storage Concealment'"
	desc = "A glass case containing a Storage Concealment implant."
	imp_type = /obj/item/implant/hide_backpack
