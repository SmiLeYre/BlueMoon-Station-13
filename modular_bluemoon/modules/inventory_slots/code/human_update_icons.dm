/mob/living/carbon/human/update_inv_shoulders()
	remove_overlay(SHOULDERS_LAYER)

	if(client && hud_used && hud_used.inv_slots[TOBITSHIFT(ITEM_SLOT_SHOULDERS) + 1])
		var/atom/movable/screen/inventory/inv = hud_used.inv_slots[TOBITSHIFT(ITEM_SLOT_SHOULDERS) + 1]
		inv.update_icon()

	if(wear_shoulders)
		if(!(head && (head.flags_inv & HIDESHOULDERS)))
			var/chosen_icon = 'icons/mob/clothing/neck.dmi'
			if(dna.species.icon_neck)
				chosen_icon = dna.species.icon_neck
			overlays_standing[SHOULDERS_LAYER] = wear_shoulders.build_worn_icon(default_layer = SHOULDERS_LAYER, default_icon_file = chosen_icon, override_state = wear_shoulders.icon_state)

		wear_shoulders.screen_loc = ui_shoulders
		if(client && hud_used && hud_used.hud_shown && hud_used.extra_shown)
			client.screen += wear_shoulders
		update_observer_view(wear_shoulders)

		apply_overlay(SHOULDERS_LAYER)
