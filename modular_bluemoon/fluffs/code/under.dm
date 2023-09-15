/obj/item/clothing/under/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/under_digi.dmi'

/obj/item/clothing/under/donator/bm/gorka
	name = "OMON Turtleneck"
	desc = "Special Police Detachment uniform. Consists of an UBAC shirt combined with olive camouflage pattern pants. You can see some flags on uniform's shoulders, looks eerily familiar. Probably one of many human states."
	icon_state = "omon"
	item_state = "omon"
	can_adjust = TRUE
	unique_reskin = list(
		"Default" = list("icon_state" = "omon"),
		"Woodland" = list("icon_state" = "omonwd"),
		"E2" = list("icon_state" = "omone")
	)

/obj/item/clothing/under/donator/bm/modern_suit
	name = "Modern Suit"
	desc = "A costume in red and black colors. It includes shorts, suspenders, and a tie. On the chest, you can see the inscription 'Epoque limited collection 2563, made specially for Tex'."
	icon_state = "modern_suit"
	item_state = "bl_suit"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = TRUE

/obj/item/clothing/under/donator/bm/utilgen
	name = "GG-66"
	desc = "Aramid made uniform of a rising private defense company, with a purple planet(?) on the back and 6's on the shoulders"
	icon_state = "utilgen"
	item_state = "utilgen"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/multicam
	name = "Multicam"
	desc = "A camouflage pattern designed for use in a wide range of environments and conditions which was specifically developed and is produced by SolFed company Crye Precision"
	icon_state = "multicam"
	item_state = "multicam"
	can_adjust = TRUE

/obj/item/clothing/under/plasmaman/security/reaper
	name = "Security Plasma Envirosuit"
	desc = "Plasmaman Envirosuit, retrofitted for combat exposure. There a purple planet on the back, with energy flowing in it."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/under.dmi'
	icon_state = "gg_envirosuit"

/obj/item/clothing/under/donator/bm/flektarn
	name = "flektarn combat uniform"
	desc = "Black turtleneck with -explosive- camouflaged combat pants."
	icon_state = "flektarn"
	item_state = "flektarn"
	can_adjust = TRUE

/obj/item/clothing/under/donator/bm/battle_coat
	name = "battle coat"
	desc = "A Tatical uniform with hood."
	icon_state = "battle_coat"
	item_state = "battle_coat"
