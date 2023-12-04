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
	item_state = "syndicate-black"
	can_adjust = TRUE

/obj/item/clothing/under/donator/bm/flektarn_casual
	name = "flektarn casual uniform"
	desc = "White tank top with -explosive- camouflaged combat pants."
	icon_state = "flektarn_casual"
	item_state = "syndicate-black"
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/nri_drg // civil variant of nri antagonist uniform
	name = "covert ops tactical uniform"
	desc = "A non-descript and slightly suspicious looking uniform."
	icon_state = "nri_drg"
	item_state = "nri_drg"
	icon = 'modular_bluemoon/kovac_shitcode/icons/rus/obj_drg.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_drg.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_drg_digi.dmi'
	can_adjust = FALSE
	unique_reskin = list(
		"Camo" = list("icon_state" = "nri_drg"),
		"Turtleneck" = list("icon_state" = "nri_drg_alt")
	)

/obj/item/clothing/under/donator/bm/battle_coat
	name = "battle coat"
	desc = "A Tatical uniform with hood."
	icon_state = "battle_coat"
	item_state = "bl_suit"

/obj/item/clothing/under/donator/bm/ellys_suit
	name = "Ellys Suit"
	desc = "A costume in white and black colors."
	icon_state = "ellys_uniform"
	item_state = "white_suit"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/booma
	name = "Boomah Turtleneck"
	desc = "Водолазка выполненная под специальный заказ для служащих в группировке Бустеров. Выполнена в кремово-белом исполнении, с нанесенным характерным логотипом группировки."
	icon_state = "booma"
	item_state = "booma"
	can_adjust = TRUE
