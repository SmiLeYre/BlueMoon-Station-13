/obj/item/toy/plush/chaotic_toaster/gaston
	name = "Gaston"
	desc = "Игрушка фиолетового цвета, её хозяин кажется так сильно любит фиолетовый, что красит буквально всё в этот цвет. Также эта игрушка кого-то явно напоминает из сотрудников на станции."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "gaston_toaster"
	attack_verb = list("beeped", "booped", "pinged")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/lighter/donator/bm/militaryzippo
	name = "military zippo"
	desc = "Army styled zippo with graved \"Dmitry Strelnikov\" on backside. Has a much hotter flame than normal."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "mzippo"
	heat = 2000
	light_color = LIGHT_COLOR_FIRE
	overlay_state = "mzippo"
	grind_results = list(/datum/reagent/iron = 1, /datum/reagent/fuel = 5, /datum/reagent/oil = 5)
