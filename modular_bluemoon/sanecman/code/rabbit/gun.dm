// Оружие Отряда Кроликов
/obj/item/gun/energy/e_gun/rabbit
	name = "R-Corporation R-3000 'Mark 2'"
	desc = "An energy gun produced specifically to suppress threats within Lobotomy Corporation, it has four firing modes to switch between."
	icon = 'modular_bluemoon/sanecman/icons/lcorp/obj/weapons.dmi'
	lefthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/sanecman/icons/lcorp/mob/guns_righthand.dmi'
	icon_state = "rabbit"
	item_state = null
	cell_type = /obj/item/stock_parts/cell/high
	can_charge = TRUE
	weapon_weight = WEAPON_HEAVY // No dual wielding
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/e_gun/rabbit/Initialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.16 SECONDS)

/obj/item/gun/energy/e_gun/rabbit/captain
	name = "R-Corporation R-4000 'Mark 3'"
	desc = "An energy gun produced especially for the rabbit captain. This weapon can be fired with one hand."
	//icon_state = "rabbitcaptain"
	color = COLOR_SILVER
	weapon_weight = WEAPON_LIGHT
	pin = /obj/item/firing_pin
	cell_type = /obj/item/stock_parts/cell/high/plus
