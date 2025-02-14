/obj/item/cyborg_inducer //Слишком много проков не будут совпадать с родительскими проками
	name = "inducer"
	desc = "A tool for inductively charging internal power cells."
	icon = 'icons/obj/tools.dmi'
	icon_state = "inducer-engi"
	item_state = "inducer-engi"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	force = 7
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	item_flags = SURGICAL_TOOL
	var/powertransfer = 1000
	var/obj/item/stock_parts/cell/cell
	var/recharging = FALSE
	var/gun_charger = FALSE
	var/mob/living/silicon/robot/owner
	var/min_remaining_charge = 0.2 // 20%

/obj/item/cyborg_inducer/Initialize(mapload)
	ADD_TRAIT(src, TRAIT_NODROP, CYBORG_ITEM_TRAIT)
	if(issilicon(src.loc.loc)) // Индуцер спавнится в модуле, в модуле внутри борга
		owner = src.loc.loc
	. = ..()

/obj/item/cyborg_inducer/examine(mob/living/M)
	. = ..()
	cell = get_cell()
	if(cell)
		. += "<span class='notice'>Its display shows: [DisplayEnergy(cell.charge)].</span>"
	else
		. += "<span class='notice'>Its display is dark.</span>"

/obj/item/cyborg_inducer/attack_obj(obj/O, mob/living/carbon/user)
	if(user.a_intent == INTENT_HARM) return ..()
	if(cantbeused(user)) return
	if(recharge(O, user)) return
	return ..()

/obj/item/cyborg_inducer/attackby(obj/item/W, mob/user)
	if(cantbeused(user)) return
	if(recharge(W, user)) return
	return ..()

/obj/item/cyborg_inducer/attack(mob/M, mob/user)
	if(user.a_intent == INTENT_HARM) return ..()
	if(cantbeused(user)) return
	if(recharge(M, user)) return
	return ..()

/obj/item/cyborg_inducer/proc/induce(obj/item/stock_parts/cell/target, coefficient)
	cell = get_cell()
	var/totransfer = min(cell.charge, (powertransfer * coefficient), cell.maxcharge * 0.2) //Тратим максимум до 20% заряда
	var/transferred = target.give(totransfer)
	cell.use(transferred)
	cell.update_icon()
	target.update_icon()

/obj/item/cyborg_inducer/get_cell()
	return owner.cell

/obj/item/cyborg_inducer/proc/cantbeused(mob/user)
	cell = get_cell()
	if(!cell)
		to_chat(user, "<span class='warning'>Unit doesn't have a power cell installed!</span>")
		return TRUE

	if(!cell.charge)
		to_chat(user, "<span class='warning'>Unit's battery is dead!</span>")
		return TRUE
	return FALSE

/obj/item/cyborg_inducer/proc/recharge(atom/movable/A, mob/user)
	if(!isturf(A) && user.loc == A)
		return FALSE
	if(A.get_cell() == get_cell()) //запрещаем пытаться заряжать самого себя
		to_chat(user, "<span class='warning'>Error: Power loop detected!</span>")
		playsound(owner, "modular_splurt/sound/misc/bonk.ogg", 50, 1)
		return FALSE
	if(recharging)
		return TRUE

	recharging = TRUE
	cell = get_cell()
	var/obj/item/stock_parts/cell/C = A.get_cell()
	var/obj/O
	var/coefficient = 1
	if(istype(A, /obj/item/gun/energy) && gun_charger != TRUE)
		to_chat(user,"Error unable to interface with device")
		return FALSE
	if(istype(A, /obj))
		O = A
	if(C)
		var/done_any = FALSE
		if(C.charge >= C.maxcharge)
			to_chat(user, "<span class='notice'>[A] is fully charged!</span>")
			recharging = FALSE
			return TRUE
		user.visible_message("[user] starts recharging [A] with [src].","<span class='notice'>You start recharging [A] with [src].</span>")
		while(C.charge < C.maxcharge)
			if(do_after(user, 10, target = user) && cell.charge && (cell.maxcharge * min_remaining_charge < cell.charge))
				done_any = TRUE
				induce(C, coefficient)
				do_sparks(1, FALSE, A)
				if(O)
					O.update_icon()
			else
				break
		if(done_any) // Only show a message if we succeeded at least once
			user.visible_message("[user] recharged [A]!","<span class='notice'>You recharged [A]!</span>")
		recharging = FALSE
		return TRUE
	recharging = FALSE
