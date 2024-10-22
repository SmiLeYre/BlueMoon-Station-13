#define SANDMAN_HANDS_LAYER 1


/mob/living/simple_animal/hostile/morph/sandman/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return FALSE
	if(!istype(I))
		return FALSE

	. = TRUE
	var/index = get_held_index_of_item(I)
	if(index)
		held_items[index] = null
		update_inv_hands()

	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.equipped(src, slot)
	I.layer = ABOVE_HUD_LAYER
	I.plane = ABOVE_HUD_PLANE

/mob/living/simple_animal/hostile/morph/sandman/proc/apply_overlay(cache_index)
	if((. = sandman_overlays[cache_index]))
		add_overlay(.)

/mob/living/simple_animal/hostile/morph/sandman/proc/remove_overlay(cache_index)
	var/I = sandman_overlays[cache_index]
	if(I)
		cut_overlay(I)
		sandman_overlays[cache_index] = null

/mob/living/simple_animal/hostile/morph/sandman/update_inv_hands()
	remove_overlay(SANDMAN_HANDS_LAYER)
	var/list/hands_overlays = list()
	var/obj/item/l_hand = get_item_for_held_index(1)
	var/obj/item/r_hand = get_item_for_held_index(2)

	if(r_hand)
		hands_overlays += r_hand.build_worn_icon(default_layer = SANDMAN_HANDS_LAYER, default_icon_file = r_hand.righthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			r_hand.layer = ABOVE_HUD_LAYER
			r_hand.plane = ABOVE_HUD_PLANE
			r_hand.screen_loc = ui_hand_position(get_held_index_of_item(r_hand))
			client.screen |= r_hand

	if(l_hand)
		hands_overlays +=  l_hand.build_worn_icon(default_layer = SANDMAN_HANDS_LAYER, default_icon_file = l_hand.lefthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			l_hand.layer = ABOVE_HUD_LAYER
			l_hand.plane = ABOVE_HUD_PLANE
			l_hand.screen_loc = ui_hand_position(get_held_index_of_item(l_hand))
			client.screen |= l_hand

	if(hands_overlays.len)
		sandman_overlays[SANDMAN_HANDS_LAYER] = hands_overlays
	apply_overlay(SANDMAN_HANDS_LAYER)

/mob/living/simple_animal/hostile/morph/sandman/regenerate_icons()
	update_inv_hands()

/datum/hud/dextrous/sandman/New(mob/owner)
	..()

	var/atom/movable/screen/inventory/inv_box

	inv_box = new /atom/movable/screen/inventory()
	inv_box.name = "internal storage"
	inv_box.icon = ui_style
	inv_box.icon_state = "suit_storage"
	inv_box.screen_loc = ui_id
	inv_box.slot_id = ITEM_SLOT_DEX_STORAGE
	static_inventory += inv_box
