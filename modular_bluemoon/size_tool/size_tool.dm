/obj/item/melee/sizetool
	name = "size tool"
	desc = "A small tool with ability to change size of living creatures. While manufactured by Syntech, it was banned in most of the civilized countries, \
	as it is a popular tool for slave traders and perverts alike. There are rumors they have used some unknown alien technologies for it. \
	Seems like NT doesn't give much of attention to its status since the station is out of borders.<br><br> \
	It has an information patch at a side: <i>\"Do not remain under the effect of the device for more than 24 hours to reduce sensory deprivation, \
	as well as the risk of cancer development!\"</i>"
	icon_state = "silencer"
	icon_state = "silencer"
	icon = 'icons/obj/abductor.dmi'
	lefthand_file = 'icons/mob/inhands/antag/abductor_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/antag/abductor_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	custom_premium_price = 2000

	var/obj/item/stock_parts/cell/cell
	var/in_use = FALSE
	var/size_set_to = 1
	var/charge_per_use
	var/time_per_use = 5 //секунды (важно для гост кафе)

/obj/item/melee/sizetool/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/cell/high(src)
	register_item_context()

/obj/item/melee/sizetool/attack_self(mob/user)
	. = ..()
	var/size_select

	if(check_for_ghostcafe())
		size_select = tgui_input_number(usr, "Set prefered size (25-600%).", "Set Size", size_set_to * 100, 600, 25)
		size_set_to = clamp((size_select/100), RESIZE_MICRO, RESIZE_MACRO)
	else
		size_select = tgui_input_number(usr, "Set prefered size (25-200%).", "Set Size", size_set_to * 100, 200, 25)
		size_set_to = clamp((size_select/100), RESIZE_MICRO, RESIZE_BIG)
	if(!size_select) return

	to_chat(usr, "<span class='notice'>You set the size to [size_set_to * 100]%</span>")

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
	if(cell)
		. += span_info("[src] is [round(cell.percent())]% charged.")
		. += span_info("Its cell can be removed with a screwdriver.")
	else
		. += span_warning("[src] does not have a power source installed.")
	. += span_info("Current prefered size set to [size_set_to * 100]%")

/obj/item/melee/sizetool/proc/check_for_ghostcafe() // Вы можете использовать весь функционал (в виде повышения размера до 800%) в госткафе
	if(istype(get_area(src), /area/centcom/holding))
		return TRUE
	return FALSE

/obj/item/melee/sizetool/attack(mob/living/target, mob/living/carbon/human/user)
	if(user.a_intent != INTENT_HELP) // если режим взаимодействия не "help", то устройством можно бить
		return ..()
	if(in_use) // нельзя спамить
		return
	if(!isliving(target) || issilicon(target)) // только для существ, не киборгов
		return
	var/ghostcafe = check_for_ghostcafe()
	var/target_size = get_size(target)
	var/diff = abs(size_set_to - target_size)
	if(!diff) return
	if(!ghostcafe) //welp если в гост кафе, то статичные 5 секунд на любое изменение размера
		charge_per_use = diff * 4000 // 1000 энергии на каждые 25% размера
		time_per_use = diff * 20 //5 секунд на 25% размера
		if(cell?.charge < charge_per_use) // есть ли батарейка и хватает ли в ней энергии
			to_chat(user, span_warning("[src] has not enough power to be used."))
			return

	in_use = TRUE // использование началось

	user.visible_message(span_warning("[user] points [src] at [target] and hold its trigger!"), span_notice("You point your [src] at [target] and hold the trigger. It begins to vibrate and is getting hotter, as the charge is being gained. You need [time_per_use] seconds to finish."))

	if(do_after(user, time_per_use SECONDS, target = target)) // КД перед применением на цель
		in_use = FALSE

		if(!ghostcafe && (!cell || !cell.use(charge_per_use))) // в госткафе заряд не тратится
			to_chat(user, span_warning("[src] goes cold after failed usage. Looks like its power cell has gone out of charge."))
			return

		if(target.GetComponent(/datum/component/size_normalized)) //нормализаторы не дружат с изменениями размера во время их ношения
			to_chat(user, span_warning("[src] goes cold after failed usage. It vibrates, as if it located normalization device on the target."))
			return

		if(HAS_TRAIT(target, TRAIT_BLUEMOON_ANTI_NORMALIZER))
			to_chat(user, span_notice("[src] buzzes in your hand while goes cold after usage. Looks like nothing changed?"))
			playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
			return

		target.update_size(size_set_to)

		playsound(target, 'sound/effects/magic.ogg', 50, 1)
		target.flash_lighting_fx(3, 3, LIGHT_COLOR_PURPLE)
		target.visible_message(span_warning("A flash of purple light engulfs \the [target], before [target.ru_who()] jump[target.p_s()] to [target_size > size_set_to ? "bigger" : "smaller"] size!"), \
		span_notice("You feel warm for a moment, before everything [target_size > size_set_to  ? "becomes smaller" : "becomes bigger"]..."))
		return
	else
		in_use = FALSE // использование прервано
		to_chat(user, span_warning("You must stand still to use [src]!"))
		return
