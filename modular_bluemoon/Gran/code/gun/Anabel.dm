//obj/item/gun/energy/anabele
//	name = "Анабэль"
//	desc = "Тестовый лазер"
//	icon = 'modular_bluemoon/Gran/icons/gun/Anabel.dmi'
//	icon_state = "Anabel"
//	item_state = "Anabel"
//	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
//	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
//	w_class = WEIGHT_CLASS_NORMAL
//	cell_type = /obj/item/stock_parts/cell{charge = 3000; maxcharge = 3000}
//	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser/lightliz)
//	weapon_weight = WEAPON_LIGHT
//	slot_flags = ITEM_SLOT_BACK
//	can_flashlight = 1
//	flight_x_offset = 0
//	ammo_x_offset = 2
//	flight_y_offset = -700
//	selfcharge = TRUE
//	var/last_altfire = 0
//	var/altfire_delay = 0

//obj/item/gun/energy/anabele/altafterattack(atom/target, mob/user, proximity_flag, params)
//	. = TRUE
//	if(last_altfire + altfire_delay > world.time)
//		return
//	var/current_index = current_firemode_index
//	set_firemode_to_type(/obj/item/ammo_casing/energy/laser/lightliz)
//	process_afterattack(target, user, proximity_flag, params)
//	set_firemode_index(current_index)
//	last_altfire = world.time



/obj/item/ammo_casing/energy/laser/lightliz
	projectile_type = /obj/item/projectile/beam/laser/heavylaser
	e_cost = 300
	select_name = "kill"
	fire_sound = 'modular_bluemoon/Gran/sound/item/gun/Anabel_shot.ogg'


/obj/item/gun/energy/e_gun/Anabel
	name = "\improper Anabel"
	desc = "This is an expensive, modern recreation of an antique laser gun. This gun has several unique firemodes, but lacks the ability to recharge over time in exchange for inbuilt advanced firearm EMP shielding. <span class='boldnotice'>Right click in combat mode to fire a taser shot with a cooldown.</span>"
	icon = 'modular_bluemoon/Gran/icons/gun/Anabel.dmi'
	icon_state = "Anabel"
	cell_type = /obj/item/stock_parts/cell{charge = 3000; maxcharge = 3000}
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser/lightliz)
	ammo_x_offset = 0
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/last_altfire = 0
	var/altfire_delay = 0

/obj/item/gun/energy/e_gun/hos/altafterattack(atom/target, mob/user, proximity_flag, params)
	. = TRUE
	if(last_altfire + altfire_delay > world.time)
		return
	var/current_index = current_firemode_index
	set_firemode_to_type(/obj/item/ammo_casing/energy/electrode)
	process_afterattack(target, user, proximity_flag, params)
	set_firemode_index(current_index)
	last_altfire = world.time

/obj/item/gun/energy/e_gun/hos/emp_act(severity)
	return
