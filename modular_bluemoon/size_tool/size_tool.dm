#define GROWTH_MODE 1
#define SHRINK_MODE 0

/obj/item/melee/sizetool
	name = "size tool"
	desc = "A small tool with ability to chance size of living creatures. While manufactured by Syntech, it was banned in most of the civilized countries, \
	as it is a popular tool for slave traders and perverts alike. There are rumors they have used some unknown alien technologies for it. \
	Seems like NT doesn't give much of attention to it since the station is out of borders."
	icon_state = "silencer"
	icon_state = "silencer"
	icon = 'icons/obj/abductor.dmi'
	lefthand_file = 'icons/mob/inhands/antag/abductor_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/antag/abductor_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	custom_premium_price = 2000

	var/obj/item/stock_parts/cell/cell
	var/in_use = FALSE
	var/mode = SHRINK_MODE
	var/charge_per_use = 1000

/obj/item/melee/sizetool/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/cell/high(src)
	register_item_context()

/obj/item/melee/sizetool/attack_self(mob/user)
	mode = !mode // изменение режима
	to_chat(user, span_notice("You switch [src] to <b>[mode ? "growth" : "shrink"]</b> mode."))
	. = ..()

/obj/item/melee/sizetool/attackby(obj/item/new_item, mob/user, params)
	if(istype(new_item, /obj/item/stock_parts/cell)) // замена батарейки
		var/obj/item/stock_parts/cell/new_cell = new_item
		if(cell)
			to_chat(user, span_warning("[src] already has a cell."))
		else
			if(!user.transferItemToLoc(new_cell, src))
				return
			cell = new_cell
			to_chat(user, span_notice("You install a cell in [src]."))

	else if(new_item.tool_behaviour == TOOL_SCREWDRIVER) // выкручивание батарейки
		if(cell)
			cell.update_icon()
			cell.forceMove(get_turf(src))
			cell = null
			to_chat(user, span_notice("You remove the cell from [src]."))
	else
		return ..()

/obj/item/melee/sizetool/examine(mob/user)
	. = ..()
	if(cell) // заряд батарейки
		. += span_notice("[src] is [round(cell.percent())]% charged.")
		. += span_notice("Its cell can be removed with a screwdriver.")
	else
		. += span_warning("[src] does not have a power source installed.")


/obj/item/melee/sizetool/attack(mob/living/target, mob/living/carbon/human/user)
	if(!isliving(target) || issilicon(target)) // только для существ, не киборгов
		return FALSE
	if(cell?.charge < charge_per_use) // есть ли батарейка и хватает ли в ней энергии
		to_chat(user, span_warning("[src] has not enough power to be used."))
	if(in_use) // нельзя спамить
		return FALSE

	var/new_size = RESIZE_NORMAL
	switch(mode) // проверка режима

		if(SHRINK_MODE)
			switch(get_size(target))
				if(RESIZE_BIG to INFINITY)
					new_size = RESIZE_NORMAL
				if(RESIZE_NORMAL to RESIZE_BIG)
					new_size = RESIZE_SMALL
				if(RESIZE_SMALL to RESIZE_NORMAL)
					new_size = RESIZE_TINY
				if(RESIZE_TINY to RESIZE_SMALL)
					new_size = RESIZE_MICRO
				if((0 - INFINITY) to RESIZE_NORMAL)
					to_chat(user, span_warning("[src] buzzes as it cannot make [target] smaller."))
					return

		if(GROWTH_MODE)
			switch(get_size(target))
				if(RESIZE_BIG to RESIZE_HUGE)
					to_chat(user, span_warning("[src] buzzes as it cannot make [target] bigger."))
					return
				if(RESIZE_NORMAL to RESIZE_BIG)
					new_size = RESIZE_BIG
				if(RESIZE_SMALL to RESIZE_NORMAL)
					new_size = RESIZE_NORMAL
				if(RESIZE_TINY to RESIZE_SMALL)
					new_size = RESIZE_SMALL
				if(RESIZE_MICRO to RESIZE_TINY)
					new_size = RESIZE_TINY
				if((0 - INFINITY) to RESIZE_MICRO)
					new_size = RESIZE_MICRO

	in_use = TRUE // использование началось

	user.visible_message(span_warning("[user] comes closer to [target] and points [src] at them!"), span_notice("You point your [src] at [target] and hold the trigger. It begins to vibrate and is getting hotter, as the charge is being gained."))

	if(do_after(user, 5 SECONDS, target = target)) // КД перед применением на цель
		cell.use(charge_per_use)
		in_use = FALSE

		//TODO - ДОБАВИТЬ СЮДА ТРЕЙТ, ЗАПРЕЩАЮЩИЙ ИЗМЕНЯТЬ РАЗМЕР, ЕСЛИ ЦЕЛЬ НЕВОСПРИИМЧИВА К НОРМАЛАЙЗЕРУ!

		target.update_size(new_size)

		playsound(target, 'sound/effects/magic.ogg', 50, 1)
		target.flash_lighting_fx(3, 3, LIGHT_COLOR_PURPLE)
		target.visible_message(span_warning("A flash of purple light engulfs \the [target], before [target.ru_who()] jump[target.p_s()] to [mode ? "bigger" : "smaller"] size!"), \
		span_notice("You feel warm for a moment, before everything [mode ? "becomes smaller" : "becomes bigger"]..."))
		return
	else
		in_use = FALSE // использование прервано

	. = ..()

#undef GROWTH_MODE
#undef SHRINK_MODE
