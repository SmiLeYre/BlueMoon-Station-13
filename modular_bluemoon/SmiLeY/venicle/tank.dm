/obj/vehicle/sealed/tank
	name = "\improper Baneblade"
	icon = 'icons/obj/car.dmi'
	icon_state = "tank"
	bound_width = 32 * 3
	bound_height = 32 * 3
	base_pixel_x = -16
	base_pixel_y = -16
	max_integrity = 2000
	armor = list(MELEE = 50, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	move_force = MOVE_FORCE_VERY_STRONG
	move_resist = MOVE_FORCE_EXTREMELY_STRONG
	generic_canpass = TRUE
	layer = 60
	var/crash_all = TRUE

/obj/vehicle/sealed/tank/Initialize(mapload)
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 2
	D.set_riding_offsets(1, list(TEXT_NORTH = list(-10, -4), TEXT_SOUTH = list(16, 3), TEXT_EAST = list(-4, 30), TEXT_WEST = list(4, -3)))
	D.set_riding_offsets(2, list(TEXT_NORTH = list(19, -5, 4), TEXT_SOUTH = list(-13, 3, 4), TEXT_EAST = list(-4, -3, 4.1), TEXT_WEST = list(4, 28, 3.9)))
	D.set_riding_offsets(3, list(TEXT_NORTH = list(-10, -18, 4.2), TEXT_SOUTH = list(16, 25, 3.9), TEXT_EAST = list(-22, 30), TEXT_WEST = list(22, -3, 4.1)))
	D.set_riding_offsets(4, list(TEXT_NORTH = list(19, -18, 4.2), TEXT_SOUTH = list(-13, 25, 3.9), TEXT_EAST = list(-22, 3, 3.9), TEXT_WEST = list(22, 28)))
	D.set_vehicle_dir_offsets(NORTH, -48, -48)
	D.set_vehicle_dir_offsets(SOUTH, -48, -48)
	D.set_vehicle_dir_offsets(EAST, -48, -48)
	D.set_vehicle_dir_offsets(WEST, -48, -48)
	for(var/i in GLOB.cardinals)
		D.set_vehicle_dir_layer(i, BELOW_MOB_LAYER)

/obj/vehicle/sealed/tank/Moved()
	. = ..()
	if(has_buckled_mobs())
		for(var/atom/A in range(2, src))
			if(!(A in buckled_mobs))
				Bump(A)

/obj/vehicle/sealed/tank/Bump(atom/movable/A)
	. = ..()
	if(A.density && has_buckled_mobs())
		var/atom/throw_target = get_edge_target_turf(A, dir)
		if(crash_all)
			A.throw_at(throw_target, 4, 3)
			visible_message("<span class='danger'>[src] давит [A]!</span>")
			playsound(src, 'sound/effects/bang.ogg', 50, 1)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			H.DefaultCombatKnockdown(100)
			H.adjustStaminaLoss(30)
			H.apply_damage(rand(25,50), BRUTE)
			if(!crash_all)
				H.throw_at(throw_target, 4, 3)
				visible_message("<span class='danger'>[src] давит [H]!</span>")
				playsound(src, 'sound/effects/bang.ogg', 50, 1)

