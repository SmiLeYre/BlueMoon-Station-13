/obj/item/gun/energy/broom
	name = "Энергетическая Супер-Метла"
	desc = "Новейшая разработка отдела РнД. Позволяет вам эффективно подметать мусор, не вставая с кресла."
	icon = 'modular_bluemoon/SmiLeY/code/janitor/broom.dmi'
	icon_state = "broomgun"
	item_state = "broomgun"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	charge_sections = 0
	can_charge = FALSE
	selfcharge = TRUE
	charge_delay = 2
	ammo_type = list(/obj/item/ammo_casing/energy/broom)

/obj/item/gun/energy/broom/do_fire(atom/target, mob/living/user, flag, params)
	. = ..()
	if(.)
		flick("broomgun_shoot", src)

#define PUSHING 0
#define STOP_PUSHING 1
#define STOP_PUSHING_FOR_ONE_TILE 2

/obj/item/ammo_casing/energy/broom
	projectile_type = /obj/item/projectile/broom
	e_cost = 150

/obj/item/projectile/broom
	icon = 'modular_bluemoon/SmiLeY/code/janitor/broom.dmi'
	icon_state = "broom_wave2"
	pixels_per_second = TILES_TO_PIXELS(12.5)
	range = 50
	damage = 0
	var/list/mob/living/losers = list()
	var/list/atom/movable/pushedstuff = list() // can't use the contents var for whatever reason
	var/pushing = PUSHING

/obj/item/projectile/broom/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	if(pushing != PUSHING)
		if(pushing == STOP_PUSHING_FOR_ONE_TILE)
			pushing = PUSHING
		return

	for(var/atom/movable/AM in get_turf(old_loc))
		var/C = can_push(AM)
		if(C)
			AM.forceMove(src)
			pushedstuff.Add(AM)
			vis_contents.Add(AM)

	for(var/mob/living/L in get_turf(src)) // so cl*wns get pwned immediately when the projectile enters the same tile they're on
		var/C = can_push(L)
		if(C == TRUE*2)
			pixels_per_second = pixels_per_second * 0.75
			L.visible_message(span_alert("Энергетическая волна подхватывает [L.name] и уносит куда-то!"),\
								span_userdanger("Энергетическая волна подхватила меня и понесла куда-то! \
			[pick("Блять-блять-бляяять!", "Чё-ё-ёрт!", "Сука-а-а!", "Ох бля-я-ять!", "Мля-я-я!", "Ёбаный в рот этой станции!!")]"))
			losers.Add(L)
			L.Knockdown(5)
			if(isnull(fired_from))
				continue
			var/obj/item/gun/energy/FF = fired_from
			if(istype(FF))
				FF.cell.give(100) // half a charge for one shot, as a reward. Acquire 3 or more cl*wns to effectively prevent the heat death of the universe.

/obj/item/projectile/broom/Destroy()
	pushing = STOP_PUSHING
	drop_everything()
	return ..()

/obj/item/projectile/broom/on_ricochet(atom/A)
	pushing = STOP_PUSHING_FOR_ONE_TILE
	drop_everything()
	return ..()

/obj/item/projectile/broom/proc/drop_everything()
	for(var/thing in pushedstuff)
		var/atom/movable/AM = thing
		AM.forceMove(get_turf(src))
	for(var/mob/living/L in losers)
		L.Knockdown(rand(3,7))
	vis_contents = list()
	losers = list()
	pushedstuff = list()

/obj/item/projectile/broom/can_hit_target(atom/target, direct_target, ignore_loc, cross_failed)
	. = ..()
	if(can_push(target))
		return FALSE
	/*
	if(ismachinery(target))
		var/obj/machinery/M = target
		if(!M.anchored)
			return FALSE
	*/

/obj/item/projectile/broom/proc/can_push(atom/movable/AM)
	if(!ismovable(AM))
		return FALSE
	if(AM.anchored)
		return FALSE
	if(isitem(AM) /*|| ismachinery(AM)*/ )
		return TRUE
	if(ismob(AM))
		var/mob/M = AM
		if(M.mind?.assigned_role == CLOWN)
			return TRUE*2
	if(isclown(AM)  || isdrone(AM) || isswarmer(AM) || isdead(AM) || ismouse(AM) || ishuman(AM) )
		return TRUE*2 // reserved for mob/living //refactor later, this is ugly

#undef PUSHING
#undef STOP_PUSHING
#undef STOP_PUSHING_FOR_ONE_TILE
