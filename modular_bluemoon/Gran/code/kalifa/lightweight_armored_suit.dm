/obj/item/clothing/suit/space/space_ninja/ronin/arachnophobe
	actions_types = list(/datum/action/item_action/initialize_ninja_suit, /datum/action/item_action/ninjastatus, /datum/action/item_action/ninja_naginata_recall)

/obj/item/clothing/suit/space/space_ninja/ronin/arachnophobe/lock_suit(mob/living/carbon/human/ninja)
	if(!istype(ninja))
		return FALSE
	if(!istype(ninja.head, /obj/item/clothing/head/helmet/space/space_ninja))
		to_chat(ninja, "<span class='userdanger'>ERROR</span>: 100113 UNABLE TO LOCATE HEAD GEAR\nABORTING...")
		return FALSE
	if(!istype(ninja.shoes, /obj/item/clothing/shoes/space_ninja))
		to_chat(ninja, "<span class='userdanger'>ERROR</span>: 122011 UNABLE TO LOCATE FOOT GEAR\nABORTING...")
		return FALSE
	if(!istype(ninja.gloves, /obj/item/clothing/gloves/space_ninja))
		to_chat(ninja, "<span class='userdanger'>ERROR</span>: 110223 UNABLE TO LOCATE HAND GEAR\nABORTING...")
		return FALSE
	affecting = ninja
	ADD_TRAIT(src, TRAIT_NODROP, NINJA_SUIT_TRAIT) //colons make me go all |=
	slowdown = 0
	icon_state = "s-ninjar"
	n_hood = ninja.head
	ADD_TRAIT(n_hood, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	n_shoes = ninja.shoes
	ADD_TRAIT(n_shoes, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	//n_shoes.slowdown--
	n_shoes.icon_state = "s-ninjar"
	n_shoes.item_state = "s-ninjar"
	n_gloves = ninja.gloves
	ADD_TRAIT(n_gloves, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	n_gloves.icon_state = "s-ninjar"
	n_gloves.item_state = "s-ninjar"
	n_mask = ninja.wear_mask
	n_mask.icon_state = "s-ninjar"
	n_mask.item_state = "s-ninjar"

	ADD_TRAIT(ninja, TRAIT_NOGUNS, NINJA_SUIT_TRAIT)
	return TRUE
