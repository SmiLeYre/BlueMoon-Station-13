/obj/item/clothing/underwear/shirt/top/black_tape
	name = "Black Sticky Tape Top"
	desc = "Идеальна для закрытия протечек."
	icon = 'modular_bluemoon/icons/obj/clothing/tape_underwear.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/tape_underwear.dmi'
	icon_state = "tape_breasts"
	body_parts_covered = 0
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	can_toggle = TRUE
	var/alt_pos = 0

/obj/item/clothing/underwear/shirt/top/black_tape/examine(mob/user)
	. = ..()
	. += span_notice("Alt-Click to change wearing style.")

/obj/item/clothing/underwear/shirt/top/black_tape/AltClick(mob/user)
	. = ..()
	if(!ishuman(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	alt_pos = !alt_pos
	update_icon()

/obj/item/clothing/underwear/shirt/top/black_tape/proc/update_sprite_visibility(datum/source, obj/item/I)
	var/mob/living/carbon/human/H = source
	//var/obj/item/organ/genital/breasts/B = locate(/obj/item/organ/genital/breasts) in H.internal_organs
	var/obj/item/organ/genital/breasts/B = H.getorganslot(ORGAN_SLOT_BREASTS)
	if(B?.is_exposed() || H.is_chest_exposed())
		H.update_inv_w_shirt()
	else if(!HAS_TRAIT(H, TRAIT_HUMAN_NO_RENDER))
		H.remove_overlay(SHIRT_LAYER)


/obj/item/clothing/underwear/shirt/top/black_tape/update_icon_state()
	. = ..()
	if(current_equipped_slot == ITEM_SLOT_SHIRT && istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = loc
		var/obj/item/organ/genital/breasts/B = H.getorganslot(ORGAN_SLOT_BREASTS)
		icon_state = "[initial(icon_state)]_[B?.size || 0][alt_pos ? "_alt" : ""]"
		H.update_inv_w_shirt() //I-size breasts and bigger have minor incorrect sprite overlay. Sort of global error. Not my mistake nor my problem.
		//update_slot_icon()
		H.update_body() //updating tape style on mob
	else
		icon_state = "[initial(icon_state)][alt_pos ? "_alt" : ""]"

/obj/item/clothing/underwear/shirt/top/black_tape/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_SHIRT)
		var/mob/living/carbon/human/H = user
		RegisterSignal(H, COMSIG_MOB_ITEM_EQUIPPED,  PROC_REF(update_sprite_visibility))
		RegisterSignal(H, COMSIG_MOB_UNEQUIPPED_ITEM,  PROC_REF(update_sprite_visibility))
		update_icon()
		H.handle_post_sex(5, null, H)

/obj/item/clothing/underwear/shirt/top/black_tape/dropped(mob/user)
	. = ..()
	if(current_equipped_slot == ITEM_SLOT_SHIRT)
		var/mob/living/carbon/human/H = user
		UnregisterSignal(H, list(COMSIG_MOB_ITEM_EQUIPPED, COMSIG_MOB_UNEQUIPPED_ITEM))
		update_icon()
		playsound(loc, 'sound/items/poster_ripped.ogg', 20, 1)
		H.handle_post_sex(5, null, H)
		H.moan()

/*
/obj/item/clothing/underwear/briefs/black_tape
	name = "Black Sticky Tape Groin"
	desc = "Идеальна для закрытия протечек."
	icon = 'modular_bluemoon/icons/obj/clothing/tape_underwear.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/tape_underwear.dmi'
	icon_state = "tape_groin"
	body_parts_covered = 0
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/underwear/shirt/top/black_tape/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_SHIRT)
		var/mob/living/carbon/human/H = user
		H.handle_post_sex(5, null, H)

/obj/item/clothing/underwear/briefs/black_tape/dropped(mob/user)
	. = ..()
	if(current_equipped_slot == ITEM_SLOT_UNDERWEAR)
		var/mob/living/carbon/human/H = user
		playsound(loc, 'sound/items/poster_ripped.ogg', 20, 1)
		H.handle_post_sex(5, null, H)
		H.moan()
*/
