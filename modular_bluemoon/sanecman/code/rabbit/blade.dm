// Оружие ближнего боя
/obj/item/ego_weapon/city/rabbit_blade
	name = "high-frequency combat blade"
	desc = "A high-frequency combat blade made for use against abnormalities and other threats in Lobotomy Corporation and the outskirts."
	icon = 'modular_bluemoon/sanecman/icons/lcorp/obj/weapons.dmi'
	icon_state = "rabbitblade"
	item_state = null
	// inhand_icon_state = "rabbit_katana"
	lefthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/swords_lefthand.dmi'
	righthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/swords_righthand.dmi'
	force = 35
	throwforce = 24
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("stabs", "slices")
	attack_verb_simple = list("stab", "slice")

//Command Sabre
/obj/item/ego_weapon/city/rabbit_blade/command
	name = "R-corp command sabre"
	desc = "A stronger rcorp blade made for the ground commander."
	icon_state = "rcorp_sabre"
	// inhand_icon_state = "multiverse"
	lefthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/swords_lefthand.dmi'
	righthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/swords_righthand.dmi'
	force = 50
