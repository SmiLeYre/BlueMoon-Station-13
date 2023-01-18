/obj/item/clothing/suit/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	desc = "When equipped, a strange hologram is activated, and the fabric of the cloak itself disappears, and lightning starts projecting all over the body."
	icon_state = "lightning_holo"
	item_state = "lightning_holo_blue"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	unique_reskin = list(
		"Blue" = list(
			"icon_state" = "lightning_holo_blue",
			"item_state" = "lightning_holo_blue",
			"name" = "blue lightning holo-cloak"
		),
		"Pink" = list(
			"icon_state" = "lightning_holo_pink",
			"item_state" = "lightning_holo_pink",
			"name" = "pink lightning holo-cloak"
		),
		"Red" = list(
			"icon_state" = "lightning_holo_red",
			"item_state" = "lightning_holo_red",
			"name" = "red lightning holo-cloak"
		),
		"Yellow" = list(
			"icon_state" = "lightning_holo_yellow",
			"item_state" = "lightning_holo_yellow",
			"name" = "yellow lightning holo-cloak"
		)
	)

/obj/item/clothing/suit/donator/bm/cerberus_suit
	name = "cerberus coat"
	desc = "Бронированое пальто болотного цвета с кучей пуговиц. Ходят слухи, что новых уже давно не делают, а те что имеются - снимают с трупов для дальнейшего ношения. От него пованивает тухлым мясом."
	icon_state = "cerberussuit_mob"
	item_state = "cerberussuit_mob"
