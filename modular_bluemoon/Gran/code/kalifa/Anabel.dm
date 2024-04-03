/obj/item/gun/energy/e_gun/hos/Anabel
	name = "\improper Anabel"
	desc = "This is an expensive, modern recreation of an antique laser gun. This gun has several unique firemodes, but lacks the ability to recharge over time in exchange for inbuilt advanced firearm EMP shielding. <span class='boldnotice'>Right click in combat mode to fire a taser shot with a cooldown.</span>"
	icon = 'modular_bluemoon/Gran/code/kalifa/icons/Anabel.dmi'
	icon_state = "Anabel"
	cell_type = /obj/item/stock_parts/cell{charge = 1500; maxcharge = 1500}
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser/lightliz)
	ammo_x_offset = 0

/obj/item/ammo_casing/energy/laser/lightliz
	projectile_type = /obj/item/projectile/beam/laser/heavylaser
	e_cost = 300
	select_name = "kill"
	fire_sound = 'modular_bluemoon/Gran/sound/item/gun/Anabel_shot.ogg'

/obj/item/modkit/Anabel_kit
	name = "Anabel Kit"
	desc = "A modkit for making a Miniature Energy Gun into Anabel."
	product = /obj/item/gun/energy/e_gun/hos/Anabel
	fromitem = list(/obj/item/gun/energy/e_gun/mini, /obj/item/gun/energy/e_gun/mini/expeditor)
